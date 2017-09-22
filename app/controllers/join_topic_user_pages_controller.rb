class JoinTopicUserPagesController < ApplicationController
  before_action :set_join_topic_user_page, only: [:show, :edit, :update, :destroy]

  # GET /join_topic_user_pages
  # GET /join_topic_user_pages.json
  def index
    @join_topic_user_pages = JoinTopicUserPage.all
  end

  # GET /join_topic_user_pages/1
  # GET /join_topic_user_pages/1.json
  def show
  end

  # GET /join_topic_user_pages/new
  def new
    @join_topic_user_page = JoinTopicUserPage.new
  end

  # GET /join_topic_user_pages/1/edit
  def edit
  end

  # POST /join_topic_user_pages
  # POST /join_topic_user_pages.json
  def create
    @join_topic_user_page = JoinTopicUserPage.new(join_topic_user_page_params)

    respond_to do |format|
      if @join_topic_user_page.save
        format.html { redirect_to @join_topic_user_page, notice: 'Join topic user page was successfully created.' }
        format.json { render :show, status: :created, location: @join_topic_user_page }
      else
        format.html { render :new }
        format.json { render json: @join_topic_user_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /join_topic_user_pages/1
  # PATCH/PUT /join_topic_user_pages/1.json
  def update
    respond_to do |format|
      if @join_topic_user_page.update(join_topic_user_page_params)
        format.html { redirect_to @join_topic_user_page, notice: 'Join topic user page was successfully updated.' }
        format.json { render :show, status: :ok, location: @join_topic_user_page }
      else
        format.html { render :edit }
        format.json { render json: @join_topic_user_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /join_topic_user_pages/1
  # DELETE /join_topic_user_pages/1.json
  def destroy
    @join_topic_user_page.destroy
    respond_to do |format|
      format.html { redirect_to join_topic_user_pages_url, notice: 'Join topic user page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_topic_user_page
      @join_topic_user_page = JoinTopicUserPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def join_topic_user_page_params
      params.require(:join_topic_user_page).permit(:order_num, :topic_id, :user_page_id)
    end
end
