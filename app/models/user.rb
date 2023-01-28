# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer
#  lectured_course_id     :bigint
#
class User < ApplicationRecord


  enum :role, %i[student lecturer], default: :student

  has_many :invoices, inverse_of: :user

  belongs_to :lectured_course, class_name: 'Course', optional: true, inverse_of: :lecturer
  has_and_belongs_to_many :courses, class_name: 'Course'

  has_many :marks, inverse_of: :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: 2..20
  validates :last_name, presence: true, length: 2..20
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email format is invalid' }

  def full_name
    "#{first_name} #{last_name}"
  end
end
