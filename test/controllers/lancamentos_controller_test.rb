require "test_helper"

class LancamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lacamento = lancamentos(:one)
  end

  test "should get index" do
    get lancamentos_url, as: :json
    assert_response :success
  end

  test "should create lacamento" do
    assert_difference("Lancamento.count") do
      post lancamentos_url, params: { lacamento: { data: @lacamento.data, setor_id: @lacamento.setor_id, user_id: @lacamento.user_id, valor: @lacamento.valor } }, as: :json
    end

    assert_response :created
  end

  test "should show lacamento" do
    get lacamento_url(@lacamento), as: :json
    assert_response :success
  end

  test "should update lacamento" do
    patch lacamento_url(@lacamento), params: { lacamento: { data: @lacamento.data, setor_id: @lacamento.setor_id, user_id: @lacamento.user_id, valor: @lacamento.valor } }, as: :json
    assert_response :success
  end

  test "should destroy lacamento" do
    assert_difference("Lancamento.count", -1) do
      delete lacamento_url(@lacamento), as: :json
    end

    assert_response :no_content
  end
end
