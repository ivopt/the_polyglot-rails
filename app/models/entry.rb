class Entry < ActiveRecord::Base
  validates :title, presence: true
end
