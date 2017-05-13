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

describe("the adding a new brand to the store path", {:type => :feature}) do
  it ('allows the user to add a new brand') do
    brand = Brand.create({:name => 'Nike', :price => 50, :id => nil})
    store = Store.create({:name => "Shoe Store", :id => nil})
    visit("/stores/#{store.id}")
    find("#brand_id").value
    click_button('Add Brand')
    visit("/")
    expect(page).to have_content("Shoe Store")
  end
end

describe("the deleting a store path", {:type => :feature}) do
  it('allows a user to delete a store') do
    store = Store.create({:name => "Shoe Store", :id => nil})
    visit("/stores/#{store.id}")
    click_button("Delete Store")
    expect(page).to have_no_content("Shoe Store")
  end
end
