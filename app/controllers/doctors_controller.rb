class DoctorsController < ApplicationController
    before_action :set_doctor, only: [:show, :edit, :update, :destroy]

    def new
        @doctor = Doctor.new
    end

    def index
        @doctors = Doctor.paginate(page: params[:page], per_page: 5)
    end

    def show
    end

    def create
        @doctor = Doctor.new(doctor_params)
		if @doctor.save
			flash[:success] = "Médico cadastrado com sucesso!"
			redirect_to doctors_path
		else
			render 'new'
		end
    end

    def edit
    end

    def update
        if @doctor.update(doctor_params)
			flash[:success] = "Médico atualizado com sucesso"
			redirect_to doctors_path
		else
			render 'edit'
		end
    end

    def destroy
        @doctor.destroy
		flash[:danger] = "Médico apagado com sucesso."
		redirect_to doctors_path
    end

    private

	def doctor_params
		params.require(:doctor).permit(:name, :crm, :crm_uf)
	end

	def set_doctor
		@doctor = Doctor.find(params[:id])
	end
end