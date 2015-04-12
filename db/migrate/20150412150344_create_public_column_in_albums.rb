class CreatePublicColumnInAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :public, :boolean, default: false
  end
end
