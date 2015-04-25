class Company < ActiveRecord::Base

  # relations
  has_many :domains
  has_many :users

  # validations
  validates :name, presence: true

end
