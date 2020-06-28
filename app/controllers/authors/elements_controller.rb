# it can be done with modules as well for namespacing like its done in posts controller

class Authors::ElementsController < AuthorsController
  
  before_action :set_post
  before_action :set_element, only: [:show, :edit, :update, :destroy]

  # GET /elements
  def index
    @elements = Element.all
  end

  # GET /elements/1
  def show
  end

  # GET /elements/new
  def new
    @element = Element.new
  end

  # GET /elements/1/edit
  def edit
  end

  # POST /elements
  def create
    @element = @post.elements.build(element_params)

    _notice = nil
    if @element.save
      _notice = 'Element was successfully created.'
    else
      _notice = @element.errors.full_messages.join(" .")
    end

    redirect_to edit_post_path(@post), notice: _notice
  end

  # PATCH/PUT /elements/1
  def update
    if @element.update(element_params)
      redirect_to edit_post_path(@post), notice: 'Element was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /elements/1
  def destroy
    @element.destroy
    redirect_to edit_post_path(@post), notice: 'Element was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = Element.find(params[:id])
    end

    def set_post
      @post = current_author.posts.find(params[:post_id])
    end

    # Only allow a trusted parameter "white list" through.
    def element_params
      params.require(:element).permit(:element_type, :content, :post_id, :position, :image)
    end
end


