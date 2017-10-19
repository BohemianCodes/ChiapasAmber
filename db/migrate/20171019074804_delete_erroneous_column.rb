class DeleteErroneousColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :string
  end
end
