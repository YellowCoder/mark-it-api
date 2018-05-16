class CreateDomains < ActiveRecord::Migration[5.2]
  def change
    create_table :domains do |t|
      t.string :name, null: false, unique: true
      t.timestamps null: false
    end
  end
end
