class AddBodyToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :body, :text
  end
end
