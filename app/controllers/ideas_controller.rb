class IdeasController < ApplicationController
  before_action :authenticate_user

  def index
  	@ideas = Idea.all
  end

  def new
  	@idea = Idea.new
  end

  def create
  	@idea = Idea.new(idea_params)
  	@idea.owner = current_user
  	set_tags
      if @idea.save
        redirect_to @idea
        flash[:success] = 'Trip created successfully'
      else
        render :new
        flash[:danger] = 'Trip has not created'
      end
  end

  def edit
  	@idea = Idea.find(params[:id]) 
  	raise "you are not authorised" if current_user != @idea.owner
  end

  def update
  	respond_to do |format|
      @idea = Idea.find(params[:id]) 
      raise "you are not authorised" if current_user != @idea.owner
      @idea.idea_taggings.delete_all
      set_tags
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  	@idea = Idea.find(params[:id])
    @idea.destroy
    #respond_to do |format|
    redirect_to root_path, notice: 'Idea was successfully destroyed.'
    #format.json {head :no_content}
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

  
end
