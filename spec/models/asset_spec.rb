require 'rails_helper'

RSpec.describe Asset, type: :model do
  subject { build(:asset) }

  it { is_expected.to validate_presence_of(:serial) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:status) }
end