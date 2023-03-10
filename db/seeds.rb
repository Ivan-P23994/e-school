# frozen_string_literal: true

ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.reset_pk_sequence!(table)
end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

@lecturers = []
@students = []
@courses = []

60.times do
  @students << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
  )
end

2.times do
  @courses << Course.create!(
    title: Faker::Science.science(:natural, :applied),
    description: Faker::Address.full_address,
    field_of_study: Faker::Science.science
  )
end

2.times do |count|
  @lecturers << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    lectured_course_id: count + 1,
    role: 'lecturer',
    password: '123456'
  )
end

@students.each do |e|
  e.courses << @courses[rand(0..1)]
end

@courses.each do |e|
  count = 1
  20.times do |time|
    student = @students[time + count]
    e.students << student unless e.students.include?(student)
  end
  count += 20
end

10.times do |count|
  Mark.create!(
    user_id: count + 1,
    course_id: 1,
    mark: rand(20..100),
    comment: 'Good',
    grade_point: rand(0..4)
  )
end

20.times do
  @invoice = Invoice.create!(
    invoice_no: '%05d' % rand(1..15),
    user_id: rand(1..60),
    title: Faker::Science.science(:formal, :applied),
    amount: rand(1000..10_000),
    paid_amount: rand(10..1000),
    status: rand(1..2) == 1 ? 'paid' : 'unpaid'
  )
end
