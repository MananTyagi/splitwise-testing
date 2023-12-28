class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :expense

  validates :sender_id, :receiver_id, :amount, presence: true


  def self.friends_and_amounts_owe_by_user(receiver_id)
    where(receiver_id: receiver_id, status: 'pending')
      .joins(:sender)
      .group('users.id')
      .select('users.id, users.name, sum(amount) as total_amount')
  end

  def self.friends_and_amounts_due_to_user(sender_id)
    where(sender_id: sender_id, status: 'pending')
      .joins(:receiver)
      .group('users.id')
      .select('users.id, users.name, sum(amount) as total_amount')
  end





end
