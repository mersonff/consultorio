require "test_helper"

class ListPatientsTest < ActionDispatch::IntegrationTest
  def setup
    @patient = Patient.create(name: "Emerson", birth_date: "14/02/1990", cpf: "04209448346")
    @patient2 = Patient.create(name: "João", birth_date: "13/02/1990", cpf: "04209448346")
  end

  test "should show patients listing" do
    get '/patients'
    assert_select "tr>td:nth-child(2)", :text => @patient.name
  end
end
