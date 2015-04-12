class CreatePhotos < ActiveRecord::Migration
  def change
     create_table :photos do |t|
      t.string :name  
      t.text :description
      t.binary :image, null:false
      t.string :location

      t.references :album, null:false

      t.timestamps
    end
  end
end

