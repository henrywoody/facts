require 'rails_helper'

RSpec.describe Item, type: :model do
	let (:item) { create :item, :title, :link, :image_url, :info }

	it "is valid with valid attributes" do
		expect(item).to be_valid
	end
end