class CommentsController < ApplicationController
http_basic_authenticate_with name: "nabeel", password: "12345", only: :destroy
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      @comment.update(user_id: current_user.id)
      if @comment.save
        redirect_to article_path(@article)
      end
    end
  
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end
  
    private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status, :email)
    end
  end
  