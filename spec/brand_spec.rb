require 'spec_helper'

describe Brand do
  it { should have_and_belong_to_many :stores }
  it('validates the presence of name') do
    brand = Brand.create({name: ""})
    expect(brand.save).to eq(false)
  end
end
