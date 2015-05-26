class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.text :description
      t.references :user, null: false

      t.timestamps
    end
  end
end
