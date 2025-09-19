require "test_helper"

class SetoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setor = setores(:one)
  end

  test "should get index" do
    get setores_url, as: :json
    assert_response :success
  end

  test "should create setor" do
    assert_difference("Setor.count") do
      post setores_url, params: { setor: { nome: @setor.nome } }, as: :json
    end

    assert_response :created
  end

  test "should show setor" do
    get setor_url(@setor), as: :json
    assert_response :success
  end

  test "should update setor" do
    patch setor_url(@setor), params: { setor: { nome: @setor.nome } }, as: :json
    assert_response :success
  end

  test "should destroy setor" do
    assert_difference("Setor.count", -1) do
      delete setor_url(@setor), as: :json
    end

    assert_response :no_content
  end
end
