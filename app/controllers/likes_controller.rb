class LikesController < ApplicationController
  def create
    like = Like.create(article_id: params[:article_id], user_id: current_user.id)
    if like.save
      redirect_to '/articles/' + params[:article_id].to_s
    end
  end

  def destroy
   like = Like.where(user_id: current_user.id, article_id: params[:article_id]).first
   if like.present?
      like.destroy 
      redirect_to '/articles/' + params[:article_id].to_s
    end
  end
end