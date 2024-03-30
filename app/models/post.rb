class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :answer
  acts_as_taggable_on :tags
end
