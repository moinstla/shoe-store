class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save :capitalize_name
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  # validates :price, presence: true

  private
    def capitalize_name
      self.name = (name.split(/(\W)/).map(&:capitalize).join)
    end
  end

  # def number_currency
  #   sprintf("%.2f", self)
  # end
