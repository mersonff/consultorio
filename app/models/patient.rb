require 'cpf_cnpj'
class Patient < ApplicationRecord
    has_many :appointments
    has_many :doctors, through: :appointments

    validate :validates_cpf
    validate :validates_birth_date
    
    validates :name, presence: true
    validates :birth_date, presence: true
    validates :cpf, presence: true, uniqueness: true, cpf: true


    private

    def validates_cpf
        if self.cpf.present?
            cpf = CPF.new(self.cpf)
            if Patient.where('cpf = ?', cpf.stripped.to_s).count > 0
                errors.add(:cpf, "já existe no sistema")
            end
        end
    end

    def validates_birth_date
        if self.birth_date.present? && self.birth_date >= Date.current 
            errors.add(:birth_date, "inválida")
        end
    end
end