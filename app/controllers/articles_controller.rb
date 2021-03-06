class ArticlesController < ApplicationController

before_action :authenticate_user!
protect_from_forgery with: :exception

def index
	@articles = Article.all
end

def new
	@article = Article.new
end

def create
	@article = Article.new(article_params)

	if @article.save
		redirect_to @article
	else
		render 'new'
	end
end

def show
	@article = Article.find(params[:id])
end

private 
	def article_params
		params.require(:article).permit(:item, :summary, :qtype, :choice, :answer, :explaination, :status, :category, :source, :reference)
	end
end
