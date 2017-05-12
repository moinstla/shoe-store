require 'spec_helper'

describe Store do
  it { should have_and_belong_to_many :brands }
  it('validates the presence of name') do
    store = Store.create({name: ""})
    expect(store.save).to eq(false)
  end
  it("ensures the length of name is at most 100 characters") do
    store = Store.create({name: "a".*(101)})
    expect(store.save).to eq(false)
  end
  it("ensures the  name is unique") do
    store1 = Store.create({name: "DSW"})
    store2 = Store.create({name: "DSW"})
    expect(store2.save).to eq(false)
  end
end
