class User < ApplicationRecord
  include Clearance::User
  has_many :facts_pages, dependent: :destroy
end
