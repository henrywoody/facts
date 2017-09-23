FactoryGirl.define do
	factory :user do
		trait :email do
			email 'ex@example.com'
		end

		trait :password do
			encypted_password 'password123'
		end

		trait :name do
			name 'James Yesler'
		end

		trait :admin do
			admin true
		end

		trait :not_admin do
			admin false
		end
	end
end