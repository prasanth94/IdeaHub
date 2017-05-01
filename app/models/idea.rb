class Idea < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :idea_taggings
  has_many :tags, through: :idea_taggings
  validates :title, presence:   true, length: { maximum: 20 }
  validates :description, presence:   true, length: { minimum: 10}
end
