require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { is_expected.to have_db_column(:title).of_type(:string) }
  it { is_expected.to have_db_column(:description).of_type(:text) }
  it { is_expected.to have_db_column(:owner_id).of_type(:integer) }

  it { is_expected.to have_many(:idea_taggings) }
  it { is_expected.to belong_to(:owner)}

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }

  it { is_expected.to validate_length_of(:title).is_at_most(20) }
  it { is_expected.to validate_length_of(:description).is_at_least(10) }
end
