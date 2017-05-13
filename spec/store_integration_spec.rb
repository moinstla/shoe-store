require('spec_helper')

describe("the adding a new store path", {:type => :feature}) do
  it("allows the user to add a new store") do
    visit("/stores/add")
    fill_in("store-name", :with => "Store")
    click_button("Submit")
    visit("/")
    expect(page).to have_content("Store")
  end
end

describe("the viewing all stores path", {:type => :feature}) do
  it('allows a user to see all of the stores') do
    store = Store.create({:name => 'Store'})
    visit('/')
    expect(page).to have_content(store.name)
  end
end

describe("the updating a store's name path", {:type => :feature}) do
  it('allows a user to rename a store') do
    store = Store.create({:name => 'Store'})
    visit("/stores/#{store.id}")
    fill_in('new_name',{:with => "Shoe Store"})
    click_button("Rename")
    expect(page).to have_content("Shoe Store")
  end
end

describe("the adding a brand to the brand path", {:type => :feature}) do
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
