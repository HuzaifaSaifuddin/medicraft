class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  field :line_one, type: String
  field :line_two, type: String
  field :city, type: String
  field :state, type: String
  field :pincode, type: String

  embedded_in :patient
  embedded_in :user
  embedded_in :facility
  embedded_in :organisation

  def to_s
    address = ''

    address += line_one if line_one.present?
    address += "#{', ' if address.present?}#{line_two}" if line_two.present?
    address += "#{', ' if address.present?}#{city}" if city.present?
    address += "#{', ' if address.present?}#{state}" if state.present?
    address += "#{' - ' if address.present?}#{pincode}" if pincode.present?

    address
  end
end
