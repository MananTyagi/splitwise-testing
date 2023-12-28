class StaticController < ApplicationController
  def dashboard
    @user = current_user
    @friends_and_amounts_owe_by_user = Transaction.friends_and_amounts_owe_by_user(@user.id)
    @friends_and_amounts_due_to_user = Transaction.friends_and_amounts_due_to_user(@user.id)
    @total_you_owe = calculate_total_you_owe
    @total_due_to_you = calculate_total_due_to_you
    @total_balance = @total_due_to_you - @total_you_owe

  end



  def person
  end


  private

  def calculate_total_you_owe
    @friends_and_amounts_owe_by_user.sum(&:total_amount)
  end

  def calculate_total_due_to_you
    @friends_and_amounts_due_to_user.sum(&:total_amount)
  end

end
