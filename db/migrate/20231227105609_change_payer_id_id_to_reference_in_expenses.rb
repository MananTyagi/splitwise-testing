class ChangePayerIdIdToReferenceInExpenses < ActiveRecord::Migration[6.1]
  def change
    remove_column :expenses, :payer_id_id

    change_table :expenses do |t|
      t.references :payer, null: false, foreign_key: { to_table: :users }
    end

  end
end
