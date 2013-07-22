class Deck < ActiveRecord::Base
  before_save { name.downcase! }

  has_many :cards
  has_many :rounds

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
