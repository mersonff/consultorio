require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor = Doctor.create(name: "Emerson", crm: "1234", crm_uf: "CE")
    @patient = Patient.create(name: "Emerson", birth_date: "14/02/1990", cpf: "04209448346")

    @appointment = Appointment.create(starts_at: '27/05/2031 13:10', ends_at: '27/05/2031 13:40', doctor: @doctor, patient: @patient)
  end

  test "should get new" do
    get new_appointment_url
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { starts_at: '27/05/2041 13:10', 
        ends_at: '27/05/2041 13:40',
        doctor_id: 1, patient_id: 1 } }
    end

    assert_redirected_to root_path
  end

  test "should get edit" do
    get edit_appointment_url(@appointment)
    assert_response :success
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: { appointment: { starts_at: '27/05/2022 13:10', ends_at: '27/05/2022 13:40' } }
    assert_redirected_to root_path
  end

end
