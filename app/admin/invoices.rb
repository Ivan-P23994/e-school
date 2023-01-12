# frozen_string_literal: true

ActiveAdmin.register Invoice do
  config.per_page = [10, 50, 100]

  permit_params :invoice_no, :user_id, :title, :amount, :paid_amount, :status

  includes :user

  index title: 'Student Fee Manager' do
    column :invoice_no
    column 'Invoicee' do |invoice|
      div for: invoice do
        em invoice.user.full_name
        br
        strong 'Course:'
        span invoice.user.courses.first.title.to_s unless invoice.user.courses.first.nil?
      end
    end
    column :title
    column 'Amount' do |invoice|
      div for: invoice do
        span "$ #{invoice.amount}"
        br
        strong 'Created at: '
        span invoice.created_at.to_date
      end
    end
    column 'Paid Amount' do |invoice|
      div for: invoice do
        span "$ #{invoice.paid_amount}"
        br
        strong 'Payment Date: '
        span 'Not Found'
      end
    end
    column :status do |invoice|
      status_tag invoice.status
    end
    actions
  end

  filter :created_at, label: 'By Date Range', as: :date_range
  filter :user_first_name_or_user_last_name_cont, label: 'Student', as: :text, input_html: { rows: 1 }
  filter :status, collection: Invoice.statuses, as: :select
end
