class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
