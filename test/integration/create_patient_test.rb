require "test_helper"

class CreatePatientTest < ActionDispatch::IntegrationTest
  test "get new patient form and create patient" do
    get "/patients/new"
    assert_response :success
    assert_difference 'Patient.count', 1 do
      post patients_path, params: { patient: {name: "Emerson", cpf: "04209448346", birth_date: "14/02/1990"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Emerson", response.body
  end
end

class CreatePatientTest < ActionDispatch::IntegrationTest
  test "get new patient form and reject invalid patient submission" do
    get "/patients/new"
    assert_response :success
    assert_no_difference 'Patient.count' do
      post patients_path, params: { patient: {name: "Emerson", cpf: "111111111111", birth_date: "14/02/1990"}}
    end
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end