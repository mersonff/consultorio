require 'test_helper'

class DoctorTest < ActiveSupport::TestCase

    def setup
        @doctor = Doctor.new(name: "Emerson", crm: "1234", crm_uf: "CE")
    end

    test "doctor should be valid" do
        assert @doctor.valid?
    end

    test "name should be present" do
        @doctor.name = ""
        assert_not @doctor.valid?
    end

    test "crm should be present" do
        @doctor.crm = ""
        assert_not @doctor.valid?
    end

    test "crm_uf should be present" do
        @doctor.crm_uf = ""
        assert_not @doctor.valid?
    end

    test "crm_uf_crm should be unique" do
        @doctor.save
        @doctor2 = Doctor.new(name: "Emerson", crm: "1234", crm_uf: "CE")
        assert_not @doctor2.valid?
    end
    
end