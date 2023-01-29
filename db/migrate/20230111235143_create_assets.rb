# frozen_string_literal: true

class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.integer :serial
      t.string :title
      t.integer :status
      t.references :category, null: false, foreign_key: true
      t.integer :location

      t.timestamps
    end
  end
end
