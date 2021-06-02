module DoctorAppointmentsTodayHelper

    def appointments_today(doctor)
        return Appointment.where('doctor_id = ? AND starts_at > ? AND ends_at < ?', doctor.id, DateTime.current.beginning_of_day, DateTime.current).count
    end

end