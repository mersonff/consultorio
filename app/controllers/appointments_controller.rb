class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    def new
        @appointment = Appointment.new
        @doctors = Doctor.all
    end

	def index
		@appointments = Appointment.paginate(page: params[:page], per_page: 5)
	end

    def create
        @appointment = Appointment.new(appointment_params)
		if !@appointment.starts_at.nil?
        	@appointment.ends_at = @appointment.starts_at + 30.minutes
		end
		if @appointment.save
			flash[:success] = "Consulta cadastrada com sucesso!"
			redirect_to root_path
		else
			render 'new'
		end
    end

    def edit
    end

    def update
        if @appointment.update(appointment_params)
			flash[:success] = "Consulta apagada com sucesso"
			redirect_to root_path
		else
			render 'edit'
		end
    end

    def destroy
        @appointment.destroy
		flash[:danger] = "Consulta apagada com sucesso."
		redirect_to root_path
    end

    private

	def appointment_params
		params.require(:appointment).permit(:starts_at, :doctor_id, :patient_id)
	end

	def set_appointment
		@appointment = Appointment.find(params[:id])
	end
end