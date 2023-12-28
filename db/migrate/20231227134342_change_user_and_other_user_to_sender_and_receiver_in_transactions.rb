class ChangeUserAndOtherUserToSenderAndReceiverInTransactions < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :user_id, :sender_id
    rename_column :transactions, :other_user_id, :receiver_id
    remove_column :transactions, :amount_type
  end
end
