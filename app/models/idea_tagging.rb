class IdeaTagging < ActiveRecord::Base
  belongs_to :idea
  belongs_to :tag
  validates :idea, presence:   true
  validates :tag, presence:   true
end
