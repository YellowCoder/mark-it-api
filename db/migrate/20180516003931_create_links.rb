class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :domain, foreign_key: true, index: true
      t.string :url, null: false
      t.timestamps null: false
    end
  end
end
