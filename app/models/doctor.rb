class Doctor < ApplicationRecord
    validates :name, presence: true
    validates :crm, presence: true
    validates :crm_uf, presence: true, uniqueness: {
        scope: :crm, 
        message: 'Já existe um médico com esse CRM.'}
end