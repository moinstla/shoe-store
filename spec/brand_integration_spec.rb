require ("spec_helper")

describe("the adding a new brand path", {:type => :feature}) do
  it('allows the user to add a new brand') do
    visit('/brands/add')
    fill_in('brand-name', :with => 'Nike')
    click_button('Submit')
    visit("/")
    expect(page).to have_content('Nike')
  end
end

describe("the viewing all brands path", {:type => :feature}) do
  it('allows a user to see all of the brands') do
    brand = Brand.create({:name => 'Nike', :price => 50, :id => nil})
    visit('/')
    expect(page).to have_content(brand.name)
  end
end

describe("the adding a store to the brand path", {:type => :feature}) do
  it ('allows the user to add a new store') do
    brand = Brand.create({:name => 'Nike', :price => 50, :id => nil})
    store = Store.create({:name => "Shoe Store", :id => nil})
    visit("/brands/#{brand.id}")
    find("#store_id").value
    click_button('Submit')
    visit("/")
    expect(page).to have_content("Shoe Store")
  end
end
