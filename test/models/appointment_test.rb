require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase

    def setup
        @doctor = Doctor.new(name: "Emerson", crm: "1234", crm_uf: "CE")
        @patient = Patient.new(name: "Emerson", birth_date: "14/02/1990", cpf: "04209448346")

        @appointment = Appointment.new(starts_at: "27/05/2031 9:00",
                                        ends_at: "27/05/2031 9:30",
                                        patient: @patient,
                                        doctor: @doctor)
    end

    test "appointment should be valid" do
        assert @appointment.valid?
    end

    test "starts_at shoud be present" do
        @appointment.starts_at = ""
        assert_not @appointment.valid?
    end

    test "ends_at should be present" do
        @appointment.ends_at = ""
        assert_not @appointment.valid?
    end

    test "patient should be present" do
        @appointment.patient = nil
        assert_not @appointment.valid?
    end

    test "doctor should be present" do
        @appointment.doctor = nil
        assert_not @appointment.valid?
    end

    test "appointment should be future data" do
        @appointment.starts_at = "27/05/2011 9:00"
        assert_not @appointment.valid?
    end

    test "appointment should be between 9:00 and 17:30" do
        @appointment.starts_at = "27/05/2031 8:00"
        assert_not @appointment.valid?
    end

    test "appointment should finish in 30 minutes" do
        @appointment.ends_at = "27/05/2031 9:10"
        assert_not @appointment.valid?
    end

    test "12:00-13:00 should be lunchtime" do
        @appointment.starts_at = "27/05/2031 12:10"
        assert_not @appointment.valid?
    end

    test "appointment should not overlap another" do
        @appointment.save
        @appointment2 = Appointment.new(starts_at: "27/05/2031 9:10",
            ends_at: "27/05/2031 9:40",
            patient: @patient,
            doctor:@doctor)
        assert_not @appointment2.valid?
    end
end