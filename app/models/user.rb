class User < ActiveRecord::Base

  # relations
  belongs_to :company
  has_many :aliases

  # validations
  validates :email, presence: true, email_domain_inclusion: { in: proc { |user|
    user.company.domains.map(&:name)
  } }, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :company, presence: true

  # encrypt password
  def password=(value)
    super(value.present? ? UnixCrypt::SHA512.build(value) : nil)
  end

  # validate password
  def validate_password(value)
    UnixCrypt.valid?(value, password)
  end

end
