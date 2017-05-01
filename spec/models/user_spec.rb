require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:email).of_type(:string) }  
  it { is_expected.to have_db_column(:password_digest).of_type(:string) }

  it { is_expected.to have_many(:ideas)}

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }

   it { is_expected.to validate_length_of(:email).is_at_most(25) }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }

   it { is_expected.to allow_value('example@example.com').for(:email) }
   it { is_expected.not_to allow_value('example@example-com').for(:email) }

   it_behaves_like "common to all models" do
    let(:record) { create(:user)}
   end

end
