class MemosController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :destroy, :edit, :update]
  # # before_action :require_login, except: [:index, :show]
  # def authenticate_user!
  #   #ログアウト状態だったら
  #   if @current_user == true
  #     # flash[:notice] = "ログインが必要です"
  #     redirect_to("/memos/show")
  #   end
  # end

  def index
    @memos = Memo.where(user_id: current_user.id).order("created_at DESC")if user_signed_in?   #要検証
    # if user_signed_in?
    #   redirect_to "/"
    # else
    #   redirect_to "user_session_path"
    # end
  end

  def show
    # @memos = Memo.where(user_id: current_user.id).order("created_at DESC")   #要検証
  end

  def new
    @memo = Memo.new
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
    params.require(:memo).permit(:title, :content).merge(user_id: current_user.id)
  end

end
