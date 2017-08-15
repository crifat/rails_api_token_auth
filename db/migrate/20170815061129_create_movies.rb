class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image
      t.text :description
      t.date :release_date
      t.boolean :showing, default: false
      t.boolean :complete, default: false
      t.boolean :upcoming, default: true

      t.timestamps
    end
  end
end
