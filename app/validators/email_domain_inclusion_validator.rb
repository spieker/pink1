class EmailDomainInclusionValidator < ActiveModel::EachValidator
  include ActiveModel::Validations::Clusivity

  def validate_each(record, attribute, value)
    return if value.blank?
    return if value.index('@').blank?
    value = value[(value.index('@') + 1)..-1]
    unless include?(record, value)
      record.errors.add(attribute, :inclusion, options.except(:in, :within).merge!(value: value))
    end
  end
end
