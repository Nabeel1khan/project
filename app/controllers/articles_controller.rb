class ArticlesController < ApplicationController
http_basic_authenticate_with name: "nabeel", password: "12345", except: [:index, :show]
  def index
  @article = Article.new
  @articles = Article.order("RANDOM()").first(3)
  @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
    flash[:notice] = "Your article create successfull"
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Your article update successfull"
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Your article destroy successfull"
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id, :image)
  end
end
