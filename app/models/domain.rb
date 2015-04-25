class Domain < ActiveRecord::Base

  # relations
  belongs_to :company

  # validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
