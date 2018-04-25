class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  default_scope ->{order(created_at: :desc)}
  validates :content, length: {minimum: 6}
  validates :user_id, presence: true
  validates :entry_id, presence: true
end
