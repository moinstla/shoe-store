require 'spec_helper'

describe Brand do
  it { should have_and_belong_to_many :stores }
  it('validates the presence of name') do
    brand = Brand.create({name: ""})
    expect(brand.save).to eq(false)
  end

  it('validates the presence of price') do
    brand = Brand.create({price: 50})
    expect(brand.save).to eq(false)
  end

  it("ensures the length of name is at most 100 characters") do
    brand = Brand.create({name: "a".*(101)})
    expect(brand.save).to eq(false)
  end

  it("ensures the  name is unique") do
    brand1 = Brand.create({name: "Nike"})
    brand2 = Brand.create({name: "Nike"})
    expect(brand2.save).to eq(false)
  end

  it("capitalizes every word in the name") do
    brand = Brand.create({name: "new balance"})
    expect(brand.name).to eq("New Balance")
  end
end
  # it("converts price to a decimal with two places") do
  #   brand = Brand.create({price: 50})
  #   expect(brand.price).to eq(50.00)
  # end
