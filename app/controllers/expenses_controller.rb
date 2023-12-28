# app/controllers/expenses_controller.rb

class ExpensesController < ApplicationController
  
    def new
      @expense = Expense.new
    end
  
    def create
      @expense = Expense.new(expense_params)
      @expense.payer = User.find(params[:expense][:payer_id]) if params[:expense][:payer_id].present?
  
      if @expense.save
        participant_ids = params[:expense][:participant_ids] || []
        # Remove payer_id from participant_ids
        participant_ids.delete(@expense.payer_id.to_s)
        
        total_participants = participant_ids.size + 1  # Adding 1 for the payer
  
        individual_amount = (@expense.amount / total_participants).round(2)
  
        # Create transactions for selected participants with sender_id as payer_id that means payer sends money to participants
        participant_ids.each do |participant_id|
          transaction = Transaction.new(sender_id: @expense.payer_id, receiver_id: participant_id, amount: individual_amount)
          transaction.expense = @expense
          transaction.save
        end

        redirect_to root_url, notice: 'Expense was successfully created.'
      else
        render :new
      end
    end

    def friend_expenses
        @friend = User.find(params[:id])
        # Load expenses paid by the user for the friend
        @friend_expenses = @friend.expenses_paid
      end
  
    private
  
    def expense_params
      params.require(:expense).permit(:date, :description, :amount)
    end
  end
  