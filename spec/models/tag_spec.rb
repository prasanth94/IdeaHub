require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }

  it { is_expected.to have_many(:idea_taggings) }

  it { is_expected.to validate_presence_of :name }

  it { is_expected.to validate_length_of(:name).is_at_most(10) }

  it { is_expected.to validate_uniqueness_of :name }
end
