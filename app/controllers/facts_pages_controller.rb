class FactsPagesController < ApplicationController
  before_action :require_login #:set_facts_page, only: [:show, :edit, :update, :destroy]

  # GET /facts_pages
  # GET /facts_pages.json
  def index
    @facts_pages = current_user.facts_pages
  end

  # GET /facts_pages/1
  # GET /facts_pages/1.json
  def show
    @facts_page = current_user.facts_pages.find(params[:id])
  end

  # GET /facts_pages/new
  def new
    @facts_page = current_user.facts_pages.build
    @facts_page.join_topic_facts_pages.build
  end

  # GET /facts_pages/1/edit
  def edit
    @facts_page = current_user.facts_pages.find(params[:id])
  end

  # POST /facts_pages
  # POST /facts_pages.json
  def create
    @facts_page = current_user.facts_pages.build(facts_page_params)
    @facts_page.join_topic_facts_pages.each do |join_topic_facts_page|
      join_topic_facts_page.facts_page_id = @facts_page.id
    end

    respond_to do |format|
      if @facts_page.save
        format.html { redirect_to @facts_page, notice: 'Facts page was successfully created.' }
        format.json { render :show, status: :created, location: @facts_page }
      else
        format.html { render :new }
        format.json { render json: @facts_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facts_pages/1
  # PATCH/PUT /facts_pages/1.json
  def update
    @facts_page = current_user.facts_pages.find(params[:id])
    respond_to do |format|
      if @facts_page.update(facts_page_params)
        format.html { redirect_to @facts_page, notice: 'Facts page was successfully updated.' }
        format.json { render :show, status: :ok, location: @facts_page }
      else
        format.html { render :edit }
        format.json { render json: @facts_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts_pages/1
  # DELETE /facts_pages/1.json
  def destroy
    @facts_page = current_user.facts_pages.find(params[:id])
    @facts_page.join_topic_facts_pages.each do |join_topic_facts_page|
      join_topic_facts_page.destroy
    end
    @facts_page.destroy
    respond_to do |format|
      format.html { redirect_to facts_pages_url, notice: 'facts page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facts_page
      @facts_page = factsPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facts_page_params
      params.require(:facts_page).permit(:title, :description, join_topic_facts_pages_attributes: JoinTopicFactsPage.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
