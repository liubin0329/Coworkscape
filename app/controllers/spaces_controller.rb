# encoding: utf-8
class SpacesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :search, :category, :sitemap, :new]
  # GET /spaces
  # GET /spaces.json
  def index
  	@rss = Space.find(:all, :order => 'created_at DESC')
    @spaces = @rss.paginate(:page => params[:page], :per_page => 9)
    #p = Space.where(["created_at <= :end_date", {:end_date => "2012-05-28 00:00:00 UTC" }])
    @pickup = @rss.shuffle().slice(0,3)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spaces }
      format.rss
    end
  end
  
  def search
  	if params[:lat]
  	@spaces = Space.near([params[:lat].to_f, params[:long].to_f], 20).paginate(:page => params[:page], :per_page => 12)
  	elsif params[:user_id]
  	@spaces = Space.where(:user_id => params[:user_id].to_i).paginate(:page => params[:page], :per_page => 12)
  	else
    @search = Space.search do
    	fulltext(params[:keyword].to_s)
    	unless params[:option].blank?
    	params[:option].each do |option|
    	with(option,true)
    	end
    	end
	end
    @spaces = @search.results.paginate(:page => params[:page], :per_page => 12)
    if params[:keyword].blank?
    flash[:notice] = "条件に一致するコワーキングスペース一覧"
    else
    flash[:notice] = params[:keyword].to_s + "に一致するコワーキングスペース一覧"
    end
    end
    p = Space.all
    @pickup = p.shuffle().slice(0,3)
    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @spaces }
    end
  end

  def category
  	if params[:id]
  	@pref = params[:id].to_s
    @spaces = Space.find_all_by_pref(@pref).paginate(:page => params[:page], :per_page => 12)
    flash[:notice] = @pref + "のコワーキングスペース一覧"
    end
    p = Space.where(["created_at <= :end_date", {:end_date => "2012-05-28 00:00:00 UTC" }])
    @pickup = p.shuffle().slice(0,3)
    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @spaces }
    end
  end
  
  # GET /spaces/1
  # GET /spaces/1.json
  def show
    @space = Space.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @space }
    end
  end

  def sitemap
    @spaces = Space.all
    @pref = Space::CITY_TYPES
    respond_to do |format|
      format.xml
    end
  end
  # GET /spaces/new
  # GET /spaces/new.json
  def new
    @space = Space.new
	5.times { @space.plans.build }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @space }
    end
  end

  # GET /spaces/1/edit
  def edit
    @space = Space.find(params[:id])
    5.times { @space.plans.build }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @space }
    end
  end

  # POST /spaces
  # POST /spaces.json
  def create
    @space = Space.new(params[:space])
    respond_to do |format|
      if @space.save
        format.html { redirect_to @space, notice: 'Space was successfully created.' }
        format.json { render json: @space, status: :created, location: @space }
      else
        format.html { render action: "new" }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spaces/1
  # PUT /spaces/1.json
  def update
    @space = Space.find(params[:id])

    respond_to do |format|
      if @space.update_attributes(params[:space])
        format.html { redirect_to @space, notice: 'Space was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1
  # DELETE /spaces/1.json
  def destroy
    @space = Space.find(params[:id])
    @space.destroy

    respond_to do |format|
      format.html { redirect_to spaces_url }
      format.json { head :no_content }
    end
  end
end
