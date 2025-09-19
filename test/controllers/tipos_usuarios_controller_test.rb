require "test_helper"

class TiposUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_usuario = tipos_usuarios(:one)
  end

  test "should get index" do
    get tipos_usuarios_url, as: :json
    assert_response :success
  end

  test "should create tipo_usuario" do
    assert_difference("TipoUsuario.count") do
      post tipos_usuarios_url, params: { tipo_usuario: { descricao: @tipo_usuario.descricao } }, as: :json
    end

    assert_response :created
  end

  test "should show tipo_usuario" do
    get tipo_usuario_url(@tipo_usuario), as: :json
    assert_response :success
  end

  test "should update tipo_usuario" do
    patch tipo_usuario_url(@tipo_usuario), params: { tipo_usuario: { descricao: @tipo_usuario.descricao } }, as: :json
    assert_response :success
  end

  test "should destroy tipo_usuario" do
    assert_difference("TipoUsuario.count", -1) do
      delete tipo_usuario_url(@tipo_usuario), as: :json
    end

    assert_response :no_content
  end
end
