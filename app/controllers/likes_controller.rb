class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(
      user_id:@current_user.id,
      group_id:params[:group_id],
      post_id:params[:id]
    )
     @like.destroy
  end
end
