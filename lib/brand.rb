class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save :capitalize_name
  # before_save :price
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }


  private
    def capitalize_name
      self.name=(name.split(/(\W)/).map(&:capitalize).join)
    end

  private
    # def price
    #   if self.price XXXXX != XXXXX
    #     self.description+=XXXXX
    #   end
    # end
  end
