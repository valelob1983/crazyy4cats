class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show edit update destroy like dislike]
  before_action :authenticate_user!, except: [:index, :show, :home]
  
  def home
  end

  # Acción para dar like a la publicación
  def like
    @like = @publication.likes.find_or_initialize_by(user: current_user)

    # Si el usuario ya ha dado un like (1), lo elimina
    if @like.like_type == 1
      @like.destroy
      message = "Like removed."
    else
      # Si el usuario ya ha dado un dislike (-1), se cambia a like (1)
      @like.update(like_type: 1)
      message = "Liked successfully."
    end

    redirect_to @publication, notice: message
  end

  # Acción para dar dislike a la publicación
  def dislike
    @like = @publication.likes.find_or_initialize_by(user: current_user)

    # Si el usuario ya ha dado un dislike (-1), lo elimina
    if @like.like_type == -1
      @like.destroy
      message = "Dislike removed."
    else
      # Si el usuario ya ha dado un like (1), se cambia a dislike (-1)
      @like.update(like_type: -1)
      message = "Disliked successfully."
    end

    redirect_to @publication, notice: message
  end

  # GET /publications or /publications.json
  def index
    @publications = Publication.all
  end

  # GET /publications/1 or /publications/1.json
  def show
    @publication = Publication.find(params[:id])
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications or /publications.json
  def create
    @publication = current_user.publications.build(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to publications_path, status: :see_other, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:title, :content, :user_id)
    end
end

