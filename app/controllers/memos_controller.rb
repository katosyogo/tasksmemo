class MemosController < ApplicationController

  def index
    @memos = Memo.where(user_id: current_user.id).order("updated_at DESC")if user_signed_in?
    # @memo = Memo.find(params[:id])
    # @images = Image.where(memo_id: @memo.id)
    # @memos = Memo.includes(:images)
    @user = User.find(current_user[:id])if user_signed_in?
  end

  def new
    @memo = Memo.new
    # @memo.images.new
  end

  def create
    @memo = Memo.create(memo_params)
    if @memo.save
      redirect_to "/"
    else
      redirect_to new_memo_path
    end
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy if memo.user_id == current_user.id
    redirect_to "/"
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    memo.update(memo_params) if memo.user_id == current_user.id
    redirect_to "/"
  end


  private
  def memo_params
    params.require(:memo).permit(:title, :content, images_attributes:  [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  # def set_memo
  #   @memo = Memo.find(params[:id])
  # end


end
