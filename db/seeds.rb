# frozen_string_literal: true

AdminUser.destroy_all
Course.destroy_all
Lesson.destroy_all
Invoice.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('admin_users')
ActiveRecord::Base.connection.reset_pk_sequence!('courses')
ActiveRecord::Base.connection.reset_pk_sequence!('lessons')
ActiveRecord::Base.connection.reset_pk_sequence!('invoice')
ActiveRecord::Base.connection.reset_pk_sequence!('users')

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

@lecturers = []
@students = []

15.times do
  @students << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
  )
end


5.times do
  @lecturers << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    role: "lecturer",
    password: '123456'
  )
end

@courses = []

10.times do
  @courses << Course.create!(
    title: Faker::Science.science(:natural, :applied),
    description: Faker::Address.full_address,
    field_of_study: Faker::Science.science
  )
end

@lecturers.each.with_index do |e, i|
  e.lectured_course = @courses[i]
  e.save
end

@students.each do |e|
  e.courses << @courses[rand(1..5)]
end

@courses.each do |e|
  student = @students[rand(1..15)]
  e.students << student unless e.students.include?(student)
end

20.times do
  @invoice = Invoice.create!(
    invoice_no: "%05d" % rand(1..15),
    user_id: rand(1..15),
    title: Faker::Science.science(:formal, :applied),
    amount: rand(1000..10_000),
    paid_amount: rand(10..1000),
    status: rand(1..2) == 1 ? "paid" : "unpaid"
  )
end
