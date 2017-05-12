require 'spec_helper'

describe Brand do
  it { should have_and_belong_to_many :stores }
  it('validates the presence of name') do
    brand = Brand.create({name: ""})
    expect(brand.save).to eq(false)
  end
  it("ensures the length of name is at most 100 characters") do
    brand = Brand.create({name: "a".*(101)})
    expect(brand.save).to eq(false)
  end
end
