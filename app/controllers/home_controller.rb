class HomeController < ApplicationController

    def index
        
        now = DateTime.current
        @doctors = Doctor.paginate(page: params[:page], per_page: 5)

        @consultas_realizadas = Appointment.where('ends_at < ?', now).paginate(page: params[:page], per_page: 5)
        @quantidade_de_consultas_ja_realizadas = @consultas_realizadas.count
        @pacientes_atendidos_hoje = Patient.joins(:appointments).where('ends_at = ?', now).count

        
    end
end