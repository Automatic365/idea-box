class Idea < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :category
  belongs_to :user
end
