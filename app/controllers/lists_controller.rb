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
    # redirect_to'/top'を削除し変更
    redirect_to list_path(list.id)
  end
  
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
