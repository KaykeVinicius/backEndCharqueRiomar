# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular "setor", "setores"
  inflect.irregular "categoria", "categorias"
  inflect.irregular "tipo_usuario", "tipos_usuarios"
  inflect.irregular "user", "users"
  inflect.irregular "lacamento", "lancamentos"




end
