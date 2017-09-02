class Item < ApplicationRecord
  belongs_to :todo
  validates_presence_of :name
  validates_inclusion_of :done, in: [true, false]
end
