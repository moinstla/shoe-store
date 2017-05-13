class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save :capitalize_name
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :price, presence: true

  def number_currency (price)
      sprintf("%.2f", price)
  end

  private
    def capitalize_name
      self.name=(name.split(/(\W)/).map(&:capitalize).join)
    end
  end
