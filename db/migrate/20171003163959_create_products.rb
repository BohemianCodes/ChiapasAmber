class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|

      #shorthand for t.column "name" :string
      t.string :name
      t.text :description
      t.string :image_url

      #we do not need to add a column for "id", this is done automatically

      t.timestamps
      #shorthand for
      #t.datetime "created_at"
      #t.datetime "updated_at"
    end
  end
end
