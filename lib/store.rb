class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  before_save :capitalize_name
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }


private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
