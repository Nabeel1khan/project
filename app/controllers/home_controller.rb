class HomeController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 2)
  end
  end