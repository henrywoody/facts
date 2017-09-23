FactoryGirl.define do
	factory :item do
		trait :title do
			title "Neat Fact"
		end

		trait :link do
			link "example.com"
		end

		trait :image_url do
			image_url "example.com/image.png"
		end

		trait :info do
			info "this is a bit of info on the fact"
		end
	end
end