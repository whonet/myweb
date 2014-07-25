class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }  # 设定微博的排序是倒序 DESC是倒序的意思
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end 