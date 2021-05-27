class Doctor < ApplicationRecord
    has_many :appointments
    
    validates :name, presence: true
    validates :crm, presence: true, uniqueness: {
        scope: :crm_uf, 
        message: 'Já existe um médico com esse CRM.'}
    validates :crm_uf, presence: true
end