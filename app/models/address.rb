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
    if part_one.present? && part_two.present?
      "#{part_one},<br>#{part_two}"
    elsif part_one.present?
      part_one
    elsif part_two.present?
      part_two
    end
  end

  def part_one
    address = ''

    address += line_one if line_one.present?
    address += "#{', ' if address.present?}#{line_two}" if line_two.present?

    address
  end

  def part_two
    address = ''

    address += "#{', ' if address.present?}#{city}" if city.present?
    address += "#{', ' if address.present?}#{state}" if state.present?
    address += "#{' - ' if address.present?}#{pincode}" if pincode.present?

    address
  end
end
