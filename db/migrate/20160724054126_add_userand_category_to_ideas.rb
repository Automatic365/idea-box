class AddUserandCategoryToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :category_id, :integer
    add_column :ideas, :user_id, :integer
  end
end
