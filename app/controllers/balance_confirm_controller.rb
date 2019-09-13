class BalanceConfirmController < ApplicationController
  def top
  end

  def show
    @year_month = params[:year_month] + "-01"
    @incomes = Income.order(created_at: :asc)
    @fixedcosts = Fixedcost.order(created_at: :asc)
    @variablecosts = Variablecost.order(created_at: :asc)

    #収入計算
    @income_values =IncomeValue.where(year_month: @year_month)
    @income_value_total = 0	#収入合計
    @income_values.each do |income_value|
      @income_value_total += income_value.value
    end

    #固定費計算
    @fixedcost_values = FixedcostValue.where(year_month: @year_month)
    @fixedcost_value_total = 0 #固定費合計
    @fixedcost_values.each do |fixedcost_value|
      @fixedcost_value_total += fixedcost_value.value
    end

    #変動費計算
    @variablecost_values = VariablecostValue.where(year_month: @year_month)
    @variablecost_value_total = 0 #変動費合計
    @variablecost_values.each do |variablecost_value|
      @variablecost_value_total += variablecost_value.value
    end

    #収支差
    @balance_difference = @income_value_total - (@fixedcost_value_total + @variablecost_value_total)
  end

end
