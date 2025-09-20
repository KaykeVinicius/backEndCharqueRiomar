require "test_helper"

class LancamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lancamento = lancamentos(:one)
  end

  test "should get index" do
    get lancamentos_url, as: :json
    assert_response :success
  end

  test "should create lancamento" do
    assert_difference("Lancamento.count") do
      post lancamentos_url, params: { lancamento: { categoria_id: @lancamento.categoria_id, data: @lancamento.data, setor_id: @lancamento.setor_id, user_id: @lancamento.user_id, valor: @lancamento.valor } }, as: :json
    end

    assert_response :created
  end

  test "should show lancamento" do
    get lancamento_url(@lancamento), as: :json
    assert_response :success
  end

  test "should update lancamento" do
    patch lancamento_url(@lancamento), params: { lancamento: { categoria_id: @lancamento.categoria_id, data: @lancamento.data, setor_id: @lancamento.setor_id, user_id: @lancamento.user_id, valor: @lancamento.valor } }, as: :json
    assert_response :success
  end

  test "should destroy lancamento" do
    assert_difference("Lancamento.count", -1) do
      delete lancamento_url(@lancamento), as: :json
    end

    assert_response :no_content
  end
end
