# frozen_string_literal: true

# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  email      :string           not null
#  position   :string
#  team_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: 2..20
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email format is invalid' }
end
