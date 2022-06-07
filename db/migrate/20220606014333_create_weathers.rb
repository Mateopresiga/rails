class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.string :city
      t.string :county
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
