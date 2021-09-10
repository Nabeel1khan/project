class ArticleshowController < ApplicationController
http_basic_authenticate_with name: "nabeel", password: "12345", except: [:index, :show]
def index
  @articles = Article.paginate(page: params[:page], per_page: 4)
end
end