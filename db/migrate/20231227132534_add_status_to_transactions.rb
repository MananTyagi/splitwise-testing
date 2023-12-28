class AddStatusToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :status, :string, default: 'pending'
  end
end
