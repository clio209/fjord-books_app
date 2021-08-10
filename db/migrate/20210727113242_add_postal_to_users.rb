# frozen_string_literal: true

class AddPostalToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :postal, :string
    add_column :users, :address, :text
    add_column :users, :description, :text

  end
end
