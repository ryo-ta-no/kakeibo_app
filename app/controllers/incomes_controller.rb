class IncomesController < ApplicationController

  before_action :set_current_user

  def index
    @incomes = Income.where(user: current_user).order(created_at: :asc)
  end

  def show
    @income = Income.find(params[:id])
  end

  def new
    @income = Income.new()
  end

  def edit
    @income = Income.find(params[:id])
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to @income, notice: "収入科目を登録しました"
    else
      render "new"
    end
  end

  def update
    @income = Income.find(params[:id])
    @income.assign_attributes(params[:income])
    if @income.save
      redirect_to @income, notice: "収入科目を登録しました"
    else
      render "new"
    end
  end

  def destroy
    @income = Income.find(params[:id])
    if @income.user_id == current_user.id
      @income.destroy
      redirect_to :incomes, notice: "科目を削除しました。"
    end
  end


  def set_current_user
    # @current_user = User.find_by(id: session[:user_id])
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end


  private
  def income_params
    params.require(:income).permit(:name, :description).merge(user_id: current_user.id)
  end

end
