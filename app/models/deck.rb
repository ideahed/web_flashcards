class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds

  validates :name, presence: true #, length: { minimum: 25 }, uniqueness: { case_sensitive: false }
end
