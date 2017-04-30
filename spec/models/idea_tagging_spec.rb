require 'rails_helper'

RSpec.describe IdeaTagging, type: :model do
  it { is_expected.to have_db_column(:idea_id).of_type(:integer) }
  it { is_expected.to have_db_column(:tag_id).of_type(:integer) }

  it { is_expected.to belong_to(:tag)}
  it { is_expected.to belong_to(:idea)}

  it { is_expected.to validate_presence_of :idea }
  it { is_expected.to validate_presence_of :tag }
  
end
