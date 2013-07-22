class Card < ActiveRecord::Base
  before_save { term.downcase! }

  validates :term, presence: true
  validates :definition, presence: true
  validates :deck_id, presence: true
end
