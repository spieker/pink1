class Alias < ActiveRecord::Base

  # relations
  belongs_to :user
  has_one :company, through: :user

  # validations
  validates :user, presence: true
  validates :source, presence: true, email_domain_inclusion: { in: proc { |rec|
    rec.company.domains.map(&:name)
  } }, uniqueness: { case_sensitive: false }, email: true

end
