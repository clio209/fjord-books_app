# frozen_string_literal: true

class AddPostalToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal, :string
  end
end
