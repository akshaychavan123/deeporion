class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :task
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
