class CreateGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :genres, id: :uuid do |t|
      t.string :name

      t.timestamps

      t.index :name, unique: true
    end
  end
end
