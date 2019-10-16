class Api::PostsController < ApplicationController
  def index
        # ルーティングでの設定によりparamsの中にgroup_idというキーでグループのidが入るので、これを元にDBからグループを取得する
        group = Group.find(params[:group_id])
        # ajaxで送られてくる最後のメッセージのid番号を変数に代入
        last_post_id = params[:id].to_i
        # 取得したグループでのメッセージ達から、idがlast_post_idよりも新しい(大きい)メッセージ達のみを取得
        @posts = group.posts.includes(:user).where("id > #{last_post_id}")
        respond_to do |format|
          format.html
          format.json
      end
  end
end