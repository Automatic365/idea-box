class Category < ApplicationRecord
  validates :title, presence:true, uniqueness: true
  has_many :ideas
end
