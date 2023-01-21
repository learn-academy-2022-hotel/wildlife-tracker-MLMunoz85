require 'rails_helper'

RSpec.describe Animal, type: :model do
  # it 'is not valid without a common name' do
  #   cat = Animal.create scientific_binomial: 'Felis silvestris catus'
  #   expect(cat.errors[:common_name]).to_not be_empty
  # end
  # it 'is not valid without a scientific binomial' do
  #   cat = Animal.create common_name: 'Cat'
  #   expect(cat.errors[:scientific_binomial]).to_not be_empty
  # end
  # it 'is not valid if the common name exactly matches the scientific binomial' do
  #   cat = Animal.create common_name: 'Cat', scientific_binomial: 'Cat'
  #   expect(cat.errors[:common_name] && cat.errors[:scientific_binomial]).to_not be_empty
  it 'is not valid if the common name and the scientific binomial are not unique' do
    Animal.create common_name: 'Cat', scientific_binomial: 'Felis silvestris catus'
    cat = Animal.create common_name: 'Cat', scientific_binomial: 'Felis silvestris catus'
    expect(cat.errors[:common_name] && cat.errors[:scientific_binomial]).to_not be_empty
  end
end
