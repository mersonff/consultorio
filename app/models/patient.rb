class Patient < ApplicationRecord
    validates :name, presence: true
    validates :birth_date, presence: true
    validates :cpf, presence: true, uniqueness: true

    validates_cpf_format_of :cpf 
end