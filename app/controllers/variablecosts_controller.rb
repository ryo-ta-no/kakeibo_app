class VariablecostsController < ApplicationController

  def index
    @variablecosts = Variablecost.where(user: current_user).order(created_at: :asc)
  end

  def show
    @variablecost = Variablecost.find(params[:id])
  end

  def new
    @variablecost = Variablecost.new()
  end

  def edit
    @variablecost = Variablecost.find(params[:id])
  end

  def create
    @variablecost = Variablecost.new(variablecost_params)
    if @variablecost.save
      redirect_to @variablecost, notice: "変動費科目を登録しました"
    else
      render "new"
    end
  end

  def update
    @variablecost = Variablecost.find(params[:id])
    @variablecost.assign_attributes(params[:variablecost])
    if @variablecost.save
      redirect_to @variablecost, notice: "変動費科目を登録しました"
    else
      render "new"
    end
  end

  def destroy
    @variablecost = Variablecost.find(params[:id])
    if @variablecost.user_id == current_user.id
      @variablecost.destroy
      redirect_to :variablecosts, notice: "科目を削除しました。"
    end
  end


  private
  def variablecost_params
    params.require(:variablecost).permit(:name, :description).merge(user_id: current_user.id)
  end

end
