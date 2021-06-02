module DoctorAppointmentsHelper
    def all_appointments_count(doctor)
        return Appointment.where('doctor_id = ? AND ends_at < ?', doctor.id, DateTime.current).count
    end
end