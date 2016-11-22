class Task < ApplicationRecord
  # make sure that we can only save if there is a name
  validates :name, presence: true
end
