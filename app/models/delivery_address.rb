class DeliveryAddress < ActiveRecord::Base
  has_and_belongs_to_many :customers
  has_many  :tickets
  validates :street, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :name, uniqueness: true, allow_nil: true
  before_save :downcase_details


  def downcase_details
    attributes.each do |key, value|
      value.try(:downcase!)
    end
  end
end
