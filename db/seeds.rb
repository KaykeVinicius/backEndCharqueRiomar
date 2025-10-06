# Criar tipos de usuário
admin_tipo = TipoUsuario.find_or_create_by!(descricao: "admin")
comum_tipo = TipoUsuario.find_or_create_by!(descricao: "comum")

# Criar usuário admin
User.find_or_create_by!(cpf: "12345678901") do |user|
  user.password = "123456"          # bcrypt vai criptografar
  user.tipo_usuario = admin_tipo
end
