class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_no
      t.references :user, null: false, foreign_key: true, unique: true
      t.string :title
      t.float :amount
      t.float :paid_amount
      t.integer :status

      t.timestamps
    end
  end
end
