class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  extend FriendlyId
  friendly_id :url, use: :slugged

end