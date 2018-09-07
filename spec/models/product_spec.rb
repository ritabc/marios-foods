require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :state_of_origin }
  it { should have_many :reviews }
  it { should validate_uniqueness_of :name }
end
