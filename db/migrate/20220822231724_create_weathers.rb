class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.float :lat
      t.float :lon
      t.text :temperatures
      t.string :city
      t.date :date

      t.timestamps
    end
  end
end
