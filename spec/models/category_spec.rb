# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { build(:category) }

  it { is_expected.to validate_presence_of(:category) }
end
