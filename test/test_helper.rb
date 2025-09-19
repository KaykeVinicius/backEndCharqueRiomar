ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
  def authorize_role(*roles)
    unless roles.include?(@current_user.tipo_usuario.descricao)
      render json: { error: "Acesso negado" }, status: :forbidden
    end
  end
end
