class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.references :band, null: false, foreign_key: true
      t.string :title, null: false, index: {unique: true}
      t.integer :year, null: false
      t.boolean :is_studio_recording, null: false, default: true
      #Ex:- :default =>''


      t.timestamps
    end
  end
end
