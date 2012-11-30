require 'test_helper'

class CompanyTypesControllerTest < ActionController::TestCase
  setup do
    @company_type = company_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_type" do
    assert_difference('CompanyType.count') do
      post :create, company_type: { name: @company_type.name }
    end

    assert_redirected_to company_type_path(assigns(:company_type))
  end

  test "should show company_type" do
    get :show, id: @company_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_type
    assert_response :success
  end

  test "should update company_type" do
    put :update, id: @company_type, company_type: { name: @company_type.name }
    assert_redirected_to company_type_path(assigns(:company_type))
  end

  test "should destroy company_type" do
    assert_difference('CompanyType.count', -1) do
      delete :destroy, id: @company_type
    end

    assert_redirected_to company_types_path
  end
end
