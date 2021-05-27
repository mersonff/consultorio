class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]

    def new
        @patient = Patient.new
    end

    def index
        @patients = Patient.paginate(page: params[:page], per_page: 5)
    end

    def show
    end

    def create
        @patient = Patient.new(patient_params)
		if @patient.save
			flash[:success] = "Paciente cadastrado com sucesso!"
			redirect_to patients_path
		else
			render 'new'
		end
    end

    def edit
    end

    def update
        if @patient.update(patient_params)
			flash[:success] = "Paciente atualizado com sucesso"
			redirect_to patients_path
		else
			render 'edit'
		end
    end

    def destroy
        @patient.destroy
		flash[:danger] = "Paciente apagado com sucesso."
		redirect_to patients_path
    end

    private

	def patient_params
		params.require(:patient).permit(:name, :birth_date, :cpf)
	end

	def set_patient
		@patient = Patient.find(params[:id])
	end
end