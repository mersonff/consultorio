require 'test_helper'
require 'cpf_cnpj'

class PatientTest < ActiveSupport::TestCase

    def setup
        @patient = Patient.new(name: "Emerson", birth_date: "14/02/1990", cpf: "04209448346")
    end

    test "patient should be valid" do
        assert @patient.valid?
    end

    test "name should be present" do
        @patient.name = ""
        assert_not @patient.valid?
    end

    test "birthdate should be present" do
        @patient.birth_date = ""
        assert_not @patient.valid?
    end

    test "cpf should be present" do
        @patient.cpf = ""
        assert_not @patient.valid?
    end

    test "cpf should be unique" do
        @patient.save
        @patient2 = Patient.new(name: "João", birth_date: "13/02/1990", cpf: "04209448346")
        assert_not @patient2.valid?
    end

    test "cpf should be a valid number" do
        @patient2 = Patient.new(name: "João", birth_date: "13/02/1990", cpf: "11111111111")
        assert_not CPF.valid?(@patient2.cpf)
    end

    
end