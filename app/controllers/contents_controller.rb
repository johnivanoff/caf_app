class ContentsController < ApplicationController
  before_filter :set_content, only: [:show, :edit, :update, :destroy]

  skip_before_filter :check_authorization, :check_authentication, :only => [:show, :home, :news_index, :password_reset]


  respond_to :html

  def index
    @contents = Content.pages.categorize.all
    respond_with(@contents)
  end

  def news_index
    @public_contents = Content.news.public.reverse.all
    @member_contents = Content.news.reverse.all
    respond_with(@contents)
  end

  def blogs_index
    @contents = Content.blogs.reverse.all
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

  def add_blog
    @content = Content.new
    respond_with(@content)
  end

  def home
    @slider = Content.home.find_by_slug('slider')
    @info_blocks = Content.home.find_by_slug('info_blocks')
    @special_events = Content.home.find_by_slug('special_events')
    @support = Content.home.find_by_slug('support_caf')      
    @recent_news = Content.news.public.reverse.tease.all
    @gift_shop = Content.home.find_by_slug('gift_shop')
    @bottom_info_blocks = Content.home.find_by_slug('bottom_info_blocks')

    render :layout => "home"
#    respond_with(@content)
  end

  def member_home
    @info_blocks = Content.member_home.find_by_slug('member_intro')
    @recent_news = Content.news.reverse.tease.all
    @bottom_info_blocks = Content.member_home.find_by_slug('member_bottom_info_blocks')
    @recent_blogs = Content.blogs.reverse.tease.all

    render :layout => "home"

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

  def password_reset

  end

  private
    def set_content
      @content = Content.find(params[:id])
    end
end
