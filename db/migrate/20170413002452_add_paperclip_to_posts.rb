class AddPaperclipToPosts < ActiveRecord::Migration[5.0]

  def change
    remove_column :posts, :image
    add_attachment :posts, :image
  end

end
