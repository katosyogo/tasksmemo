class MemosController < ApplicationController
  def index
    @memos = Memo.all  #要検証
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.create(memo_params)
    if @memo.save
      redirect_to "/"
    else
      render :new
    end
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :content).merge(user_id: current_user.id)
  end

end
