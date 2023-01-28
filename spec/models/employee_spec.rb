require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject { build(:employee) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_length_of(:email) }
  it { is_expected.to validate_length_of(:position) }
end