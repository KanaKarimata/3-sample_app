class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    # 1,2 データを受け取り、新規登録するためのインスタンスを作成
    list = List.new(list_params)
    # ３データをデータベースに保存するためのsaveメソッド
    list.save
    # ４トップ画面へリダイレクト
    redirect_to'/top'
  end
  
  def index
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
