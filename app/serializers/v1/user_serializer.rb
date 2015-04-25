class V1::UserSerializer < ActiveModel::Serializer

  # attributes
  attributes :id, :email, :company_id

  # relations
  has_many :aliases, embed: :ids

end
