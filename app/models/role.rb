class Role
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String


  has_and_belongs_to_many :users
  belongs_to :resource, polymorphic: true, optional: true

  validates_presence_of :name
  validates_uniqueness_of :name

  scopify

  before_create :stop_create
  before_destroy :stop_destroy

  private

  def stop_create
    return if ['owner', 'admin', 'doctor', 'receptionist'].include?(name)

    errors.add(:base, 'Cannot create new Roles')
    throw :abort
  end

  def stop_destroy
    errors.add(:base, :undestroyable)
    throw :abort
  end
end
