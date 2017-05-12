class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save :capitalize_name
  # before_save :number_currency
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :price, presence: true



  private
    def capitalize_name
      self.name=(name.split(/(\W)/).map(&:capitalize).join)
    end

    # def number_currency

    #     sprintf("%.2f", self)
    # end
  end

  # def num_to_currency |price|
  #   "$#{price.to_i}."+"#{(price % 1.0)}"[2..3]
  # end
