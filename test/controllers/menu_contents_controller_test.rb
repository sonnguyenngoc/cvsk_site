require 'test_helper'

class MenuContentsControllerTest < ActionController::TestCase
  setup do
    @menu_content = menu_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_content" do
    assert_difference('MenuContent.count') do
      post :create, menu_content: { content: @menu_content.content, title: @menu_content.title }
    end

    assert_redirected_to menu_content_path(assigns(:menu_content))
  end

  test "should show menu_content" do
    get :show, id: @menu_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu_content
    assert_response :success
  end

  test "should update menu_content" do
    patch :update, id: @menu_content, menu_content: { content: @menu_content.content, title: @menu_content.title }
    assert_redirected_to menu_content_path(assigns(:menu_content))
  end

  test "should destroy menu_content" do
    assert_difference('MenuContent.count', -1) do
      delete :destroy, id: @menu_content
    end

    assert_redirected_to menu_contents_path
  end
end
