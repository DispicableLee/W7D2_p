class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :name, null: false, index: {unique: true}
      

      t.timestamps
    end
  end
end
