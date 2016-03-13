require 'test_helper'

class EmailAlertsControllerTest < ActionController::TestCase
  setup do
    @email_alert = email_alerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_alert" do
    assert_difference('EmailAlert.count') do
      post :create, email_alert: { all_params: @email_alert.all_params, machine_group: @email_alert.machine_group, machine_name: @email_alert.machine_name, subject: @email_alert.subject }
    end

    assert_redirected_to email_alert_path(assigns(:email_alert))
  end

  test "should show email_alert" do
    get :show, id: @email_alert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_alert
    assert_response :success
  end

  test "should update email_alert" do
    patch :update, id: @email_alert, email_alert: { all_params: @email_alert.all_params, machine_group: @email_alert.machine_group, machine_name: @email_alert.machine_name, subject: @email_alert.subject }
    assert_redirected_to email_alert_path(assigns(:email_alert))
  end

  test "should destroy email_alert" do
    assert_difference('EmailAlert.count', -1) do
      delete :destroy, id: @email_alert
    end

    assert_redirected_to email_alerts_path
  end
end
