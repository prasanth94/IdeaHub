class IdeasController < ApplicationController
  before_action :authenticate_user
  before_action :set_user

  def index
  	@ideas =  @user.ideas
  end

  def new
  	@idea = Idea.new(owner: @user)
  end

  def create
  	@idea = Idea.new(idea_params)
  	@idea.owner = @user
  	set_tags
      if @idea.save
        redirect_to user_idea_path(@user, @idea)
 	    flash[:success] = 'Idea created successfully'
      else
        render :new
        flash[:danger] = 'Idea has not created'
      end
  end

  def edit
  	@idea = Idea.find(params[:id]) 
  	raise "you are not authorised" if current_user != @idea.owner
  end

  def update
      @idea = Idea.find(params[:id]) 
      raise "you are not authorised" if current_user != @idea.owner
      @idea.idea_taggings.delete_all
      set_tags
      if @idea.update(idea_params)
        redirect_to user_idea_path(@user, @idea)
        flash[:success] = 'Idea updated successfully'
      else
        render :edit
      end
  end

  def destroy
  	@idea = Idea.find(params[:id])
  	@idea.idea_taggings.delete_all
    @idea.destroy
    redirect_to user_ideas_path(@user), notice: 'Idea was successfully destroyed.'
  end

  def show
  	@idea = Idea.find(params[:id])
  end

  private

  	def idea_params
  	  params.require(:idea).permit(:description, :title)
 	 end

  	def tag_params
  	  params[:tags]	
  	end
  
 	def set_tags
      input_tags = tag_params.split(",")
  	  input_tags.each do |input_tag|
  	  	input_tag.strip!
  	  	tag = Tag.find_or_create(input_tag)
  	  	IdeaTagging.create(idea: @idea, tag: tag)
      end
    end

    def set_user 
      @user = User.find(params[:user_id])
    end

  
end
