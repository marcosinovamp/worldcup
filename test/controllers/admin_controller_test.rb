require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_home_url
    assert_response :success
  end

  test "should get classificacao" do
    get admin_classificacao_url
    assert_response :success
  end

  test "should get tabela" do
    get admin_tabela_url
    assert_response :success
  end

  test "should get estatisticas" do
    get admin_estatisticas_url
    assert_response :success
  end
end
