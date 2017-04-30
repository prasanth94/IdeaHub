class Tag < ActiveRecord::Base
  has_many :idea_taggings
  has_many :ideas, through: :idea_taggings
  validates :name, presence:   true, length: { maximum: 10 }
  
  def self.find_or_create name
  	tag = Tag.find_by(name: name)
  	tag ||= Tag.create(name: name)
  end

end
