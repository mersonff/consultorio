class Appointment < ApplicationRecord
    belongs_to :patient
    belongs_to :doctor

    before_save :lunchtime
    before_validation :no_appointment_overlap


    validates :starts_at, presence: true
    validates :ends_at, presence: true

    validates_datetime :starts_at, on_or_after: lambda { DateTime.current.strftime('%d/%m/%Y %H:%M') }

    validates_time :starts_at, between: '09:00'..'17:30'
    
    validates_time :ends_at, is_at: :duration

    private 

    def duration
        self.starts_at + 30.minutes 
    end

    def lunchtime
        if self.starts_at.strftime('%H:%M') > '12:00' && self.starts_at.strftime('%H:%M') < '13:00'
            puts 'lunchtime'
            errors.add(:starts_at, "É hora do lanche")
        end 
    end

    def no_appointment_overlap
        if (Appointment.where("(? BETWEEN starts_at AND ends_at)", self.starts_at).any?)
            errors.add(:starts_at, 'Sobrepõe a outra consulta.')
        end
    end

end