class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :other_user, null: false, foreign_key: { to_table: :users }
      t.decimal :amount
      t.string :amount_type
      t.references :expense, null: false, foreign_key: { to_table: :expenses }
    
      t.timestamps
    end
  end
end
