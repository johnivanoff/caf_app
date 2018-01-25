class ContentsController < ApplicationController
  before_filter :set_content, only: [:show, :edit, :update, :destroy]

  skip_before_filter :check_authorization, :check_authentication, :only => [:show, :home, :news_index]


  respond_to :html

  def index
    @contents = Content.pages.categorize.all
    respond_with(@contents)
  end

  def news_index
    @contents = Content.news.reverse.all
    respond_with(@contents)
  end

  def show
    respond_with(@content)
  end

  def new
    @content = Content.new
    respond_with(@content)
  end

  def new_page
    @content = Content.new
    respond_with(@content)
  end

  def add_news
    @content = Content.new
    respond_with(@content)
  end

  def home
    @slider = Content.home.find_by_slug('slider')
    @info_blocks = Content.home.find_by_slug('info_blocks')
    @special_events = Content.home.find_by_slug('special_events')
    @support = Content.home.find_by_slug('support_caf')      
    @recent_news = Content.news.reverse.tease.all
    @gift_shop = Content.home.find_by_slug('gift_shop')
    @bottom_info_blocks = Content.home.find_by_slug('bottom_info_blocks')



    render :layout => "home"
#    respond_with(@content)
  end

  def edit
  end
  
  def news_edit
  end
  
  def page_edit
  end

  def create
    @content = Content.new(params[:content])
    @content.save
    respond_with(@content)
  end

  def update
    @content.update_attributes(params[:content])
    respond_with(@content)
  end

  def destroy
    @content.destroy
    respond_with(@content)
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end
end
