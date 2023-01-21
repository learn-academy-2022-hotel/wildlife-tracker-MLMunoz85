class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, :scientific_binomial, presence: true
    validates :common_name, :scientific_binomial, uniqueness: true
    validate :name_binomial_validation
    

    def name_binomial_validation
        if common_name == scientific_binomial
            errors.add(:common_name, 'must be different to scientific binomial')
            errors.add(:scientific_binomial, 'must be different to common name')
        end
    end
end
