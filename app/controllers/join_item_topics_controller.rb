class JoinItemTopicsController < ApplicationController
	before_action :set_join_item_topic, only: [:show, :edit, :update, :destroy]

	# GET /join_item_topics
	# GET /join_item_topics.json
	def index
		@join_item_topics = JoinItemTopic.all
	end

	# GET /join_item_topics/1
	# GET /join_item_topics/1.json
	def show
	end

	# GET /join_item_topics/new
	def new
		@join_item_topic = JoinItemTopic.new
	end

	# GET /join_item_topics/1/edit
	def edit
	end

	# POST /join_item_topics
	# POST /join_item_topics.json
	def create
		@join_item_topic = JoinItemTopic.new(join_item_topic_params)

		respond_to do |format|
			if @join_item_topic.save
				format.html { redirect_to @join_item_topic, notice: 'Join item topic was successfully created.' }
				format.json { render :show, status: :created, location: @join_item_topic }
			else
				format.html { render :new }
				format.json { render json: @join_item_topic.errors, status: :unprocessable_entity }
			end
		end
		#assign_order_num(@join_item_topic)
	end

	# PATCH/PUT /join_item_topics/1
	# PATCH/PUT /join_item_topics/1.json
	def update
		respond_to do |format|
			if @join_item_topic.update(join_item_topic_params)
				format.html { redirect_to @join_item_topic, notice: 'Join item topic was successfully updated.' }
				format.json { render :show, status: :ok, location: @join_item_topic }
			else
				format.html { render :edit }
				format.json { render json: @join_item_topic.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /join_item_topics/1
	# DELETE /join_item_topics/1.json
	def destroy
		@join_item_topic.destroy
		respond_to do |format|
			format.html { redirect_to join_item_topics_url, notice: 'Join item topic was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_join_item_topic
			@join_item_topic = JoinItemTopic.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def join_item_topic_params
			params.require(:join_item_topic).permit(:order_num, :item_id, :topic_id)
		end

		def assign_order_num(join)
			join.order_num = JoinItemTopic.where(topic_id: join.topic_id).count - 1
			join.save
		end

		def reassign_other_order_nums()
		end
end
