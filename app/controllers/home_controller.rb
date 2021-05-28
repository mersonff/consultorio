class HomeController < ApplicationController

    def dashboard
        agora = DateTime.current
        @consultas_realizadas = Appointment.where('ends_at < ?', agora).paginate(page: params[:page], per_page: 5)
        @quantidade_de_consultas_ja_realizadas = @consultas_realizadas.count
        @pacientes_atendidos_hoje = Patient.joins(:appointments).where('ends_at = ?', agora).count
    end
end