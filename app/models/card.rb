class Card < ActiveRecord::Base
  before_save { term.downcase! }

  validates :term, presence: true, length: { minimum: 25 }, uniqueness: { case_sensitive: false }
  validates :definition, presence: true
end
