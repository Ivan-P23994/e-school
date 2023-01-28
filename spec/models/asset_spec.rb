# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Asset, type: :model do
  subject { build(:asset) }

  it { is_expected.to validate_presence_of(:serial) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:status) }

  it do
    should define_enum_for(:location)
      .with_values(['classroom', 'lobby', 'conference room', 'caffeteria', 'school garden', 'storage room'])
      .backed_by_column_of_type(:integer)
  end
end
