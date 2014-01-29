require 'test_helper'

class ConexoesControllerTest < ActionController::TestCase
  setup do
    @conexao = conexoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conexoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conexao" do
    assert_difference('Conexao.count') do
      post :create, conexao: { adapter: @conexao.adapter, database: @conexao.database, host: @conexao.host, password: @conexao.password, username: @conexao.username }
    end

    assert_redirected_to conexao_path(assigns(:conexao))
  end

  test "should show conexao" do
    get :show, id: @conexao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conexao
    assert_response :success
  end

  test "should update conexao" do
    patch :update, id: @conexao, conexao: { adapter: @conexao.adapter, database: @conexao.database, host: @conexao.host, password: @conexao.password, username: @conexao.username }
    assert_redirected_to conexao_path(assigns(:conexao))
  end

  test "should destroy conexao" do
    assert_difference('Conexao.count', -1) do
      delete :destroy, id: @conexao
    end

    assert_redirected_to conexoes_path
  end
end
