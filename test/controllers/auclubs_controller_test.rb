require 'test_helper'

class AuclubsControllerTest < ActionController::TestCase
  setup do
    @auclub = auclubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auclubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auclub" do
    assert_difference('Auclub.count') do
      post :create, auclub: { apply_time: @auclub.apply_time, category: @auclub.category, description: @auclub.description, facebook: @auclub.facebook, introduce: @auclub.introduce, logo: @auclub.logo, meeting_time: @auclub.meeting_time, name: @auclub.name, tel: @auclub.tel }
    end

    assert_redirected_to auclub_path(assigns(:auclub))
  end

  test "should show auclub" do
    get :show, id: @auclub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auclub
    assert_response :success
  end

  test "should update auclub" do
    patch :update, id: @auclub, auclub: { apply_time: @auclub.apply_time, category: @auclub.category, description: @auclub.description, facebook: @auclub.facebook, introduce: @auclub.introduce, logo: @auclub.logo, meeting_time: @auclub.meeting_time, name: @auclub.name, tel: @auclub.tel }
    assert_redirected_to auclub_path(assigns(:auclub))
  end

  test "should destroy auclub" do
    assert_difference('Auclub.count', -1) do
      delete :destroy, id: @auclub
    end

    assert_redirected_to auclubs_path
  end
end
