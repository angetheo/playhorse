class ArticlesController < ApplicationController

  include AdminHelper

  def index
  	@all_articles = Article.all

  	@min_page = 1
  	@max_page = (@all_articles.size/4.to_f).ceil
  	@page = !!params[:page] ? params[:page].to_i : 1

  	@articles = @all_articles.sort_by(&:created_at).reverse[4*(@page-1)..4*@page-1]
  	@populars = @all_articles.sort_by(&:views).reverse.first(5)
  	@recents = @all_articles.sort_by(&:created_at).reverse.first(5)
  end

  def show
    @article = Article.find(params[:id])

  	respond_to do |format|
  	  format.html { 
    		@all_articles = Article.all
    		@populars = @all_articles.sort_by(&:views).reverse.first(5)
    		@recents = @all_articles.sort_by(&:created_at).reverse.first(5)
      	@related_articles = @all_articles.sample(3)

    	  @article.views += 1
      	@article.save
  	  }
      format.json { render json: @article }
    end
  end

  def create
    Article.create({
      title: params[:article_title],
      subtitle: params[:article_subtitle],
      content: params[:article_content],
      image: upload(params[:article_image].original_filename, params[:article_image].tempfile),
      views: 0
    })

    redirect_to(:back)
  end

  def update
  	@article = Article.find(params[:id])

  	@article.title = params[:edit_article_title]
  	@article.subtitle = params[:edit_article_subtitle]
  	@article.content = params[:edit_article_content]
  	@article.image = upload(params[:edit_article_image].original_filename, params[:edit_article_image].tempfile) unless params[:edit_article_image].nil?
  	@article.save!
	  redirect_to(:back)
  end

  def destroy
    Article.delete(params[:id])
    redirect_to(:back)
  end

end
