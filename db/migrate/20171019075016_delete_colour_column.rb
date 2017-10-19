class DeleteColourColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :colour
  end
end
