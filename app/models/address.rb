class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  field :line_one, type: String
  field :line_two, type: String
  field :city, type: String
  field :state, type: String
  field :pincode, type: String
end
