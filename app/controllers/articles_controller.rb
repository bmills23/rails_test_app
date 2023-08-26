class ArticlesController < ApplicationController

    ## runs before the actions in each route are enacted
    before_action :set_article, only: [:show, :edit, :update, :destroy] 

    def show
    end

    def index
        @articles = Article.all
    end    

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        ## need to whitelist @article = Article.new(params[:title, :description])
        ## we need to require the top level key of article and permit the keys
        @article = Article.new(article_params)
        
    
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to article_path(@article)
        else
            render :new, status: :unprocessable_entity
        end

    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article updated successfully."
            redirect_to @article
        else 
            render :edit, status: :unprocessable_entity
        end

    end

    def destroy 
        @article.destroy 
        redirect_to articles_path
    end

    ## anything below private is a private method, just a keyword to isolate 
    ## the methods to this controller, i.e. not accessible elsewhere
    private 

    def set_article 
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end
