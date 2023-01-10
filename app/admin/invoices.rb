ActiveAdmin.register Invoice do
  config.per_page = [10, 50, 100]

  permit_params :invoice_no, :user_id, :title, :amount, :paid_amount, :status

  index title: 'Student Fee Manager' do
    selectable_column
    column :invoice_no
    column 'Invoicee' do |invoice|
      div for: invoice do
        em invoice.user.full_name; br
        strong 'Course:' 
        unless invoice.user.courses.first.nil?
          span invoice.user.courses.first.title.to_s
        end
      end
    end
    column :title
    column 'Amount' do |invoice|
      div for: invoice do
        span "$ " + invoice.amount.to_s; br
        strong 'Created at: ' 
        span invoice.created_at.to_date
      end
    end
    column 'Paid Amount' do |invoice|
      div for: invoice do
        span "$ " + invoice.paid_amount.to_s; br
        strong 'Payment Date: '
        span "Not Found"
      end
    end
    column :status do |invoice|
      status_tag invoice.status
    end
    actions
  end

end
