class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :reason, null: false, foreign_key: true
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
