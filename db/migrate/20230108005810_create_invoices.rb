# frozen_string_literal: true

class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_no, null: false
      t.references :user, null: false, foreign_key: true, unique: true
      t.string :title
      t.float :amount, null: false
      t.float :paid_amount, null: false
      t.integer :status

      t.timestamps
    end
  end
end
