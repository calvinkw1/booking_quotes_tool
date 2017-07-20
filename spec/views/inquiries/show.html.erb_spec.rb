require 'rails_helper'

RSpec.describe "inquiries/show", type: :view do
  before(:each) do
    @inquiry = assign(:inquiry, Inquiry.create!(
      :rental_site => "Rental Site",
      :unit_id => "",
      :price => "9.99",
      :tax => "9.99",
      :nights => 2,
      :adults => 3,
      :children => 4,
      :pets => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Rental Site/)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
