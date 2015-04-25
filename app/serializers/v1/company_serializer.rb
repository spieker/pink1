class V1::CompanySerializer < ActiveModel::Serializer

  # attributes
  attributes :id, :name

  # relations
  has_many :users, embed: :ids
  has_many :domains, embed: :ids

end
