require "roo"
require "date"

namespace :import do
  desc "Importa lançamentos das planilhas semanais"
  task planilhas: :environment do
    file_path = Rails.root.join("lib", "planilhas", "orcamentos.xlsx")

    # Abrir planilha
    xlsx = Roo::Spreadsheet.open(file_path.to_s)

    total_lancamentos = 0

    xlsx.sheets.each do |sheet|
      sheet_name = sheet.to_s.strip
      puts "📊 Importando aba: #{sheet_name}"

      xlsx.default_sheet = sheet

      # Extrai informações do nome da aba: "02-2025 (SEMANA 04)"
      if sheet_name =~ /(\d{2})-(\d{4}) \(SEMANA (\d+)\)/
        mes    = $1.to_i
        ano    = $2.to_i
        semana = $3.to_i

        # início da semana baseado no mês/ano
        data_base = Date.new(ano, mes, 1) + ((semana - 1) * 7)
      else
        puts "⚠️ Aba #{sheet_name} não segue o padrão esperado, pulando..."
        next
      end

      lancamentos_por_aba = 0

      (2..xlsx.last_row).each do |row|
        categoria_nome = xlsx.cell(row, "A").to_s.strip
        setor_nome     = xlsx.cell(row, "B").to_s.strip

        next if categoria_nome.empty? || setor_nome.empty?
        next if categoria_nome.upcase.include?("TOTAL") # ignora linhas de total

        setor     = Setor.find_or_create_by!(nome: setor_nome)
        categoria = Categoria.find_or_create_by!(nome: categoria_nome)

        valores_diarios = false

        # 1) Primeiro tenta valores diários (se existirem em C..AA)
        ("C".."AA").each_with_index do |col, i|
          valor_raw = xlsx.cell(row, col)
          next if valor_raw.nil? || valor_raw.to_s.strip.empty?

          valor = valor_raw.to_s.tr(",", ".").to_f
          next if valor.zero?

          data = data_base + i.days

          Lancamento.create!(
            setor: setor,
            categoria: categoria,
            data: data,
            valor: valor
          )

          lancamentos_por_aba += 1
          total_lancamentos += 1
          valores_diarios = true
        end

        # 2) Se não houver valores diários, pega o valor consolidado da coluna C
        unless valores_diarios
          valor_raw = xlsx.cell(row, "C")
          next if valor_raw.nil? || valor_raw.to_s.strip.empty?

          valor = valor_raw.to_s.tr(",", ".").to_f
          next if valor.zero?

          Lancamento.create!(
            setor: setor,
            categoria: categoria,
            data: data_base, # usa a data base da semana
            valor: valor
          )

          lancamentos_por_aba += 1
          total_lancamentos += 1
        end
      end

      puts "✅ Aba #{sheet_name}: #{lancamentos_por_aba} lançamentos importados"
    end

    puts "🎉 Importação concluída! Total de lançamentos: #{total_lancamentos}"
  end
end