class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments, dependent: :restrict_with_exception

    validates :name, presence: true
    validates :crm, presence: true, uniqueness: {
        scope: :crm_uf, 
        :message => :crm_duplicado }
    validates :crm_uf, presence: true
    
end