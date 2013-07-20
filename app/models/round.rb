class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses
  # Remember to create a migration!
end
