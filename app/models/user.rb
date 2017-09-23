class User < ApplicationRecord
  include Clearance::User
  has_many :user_pages, dependent: :destroy
end
