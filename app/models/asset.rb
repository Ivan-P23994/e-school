# == Schema Information
#
# Table name: assets
#
#  id          :bigint           not null, primary key
#  serial      :integer
#  title       :string
#  Status      :integer
#  category_id :bigint           not null
#  location    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Asset < ApplicationRecord
  belongs_to :category, inverse_of: :assets

  
end
