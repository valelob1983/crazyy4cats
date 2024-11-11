class UserCommentsController < ApplicationController
  before_action :set_publication

  def create
    @comment = @publication.user_comments.new(comment_params)
    @comment.user = current_user if user_signed_in?  # Solo asigna si hay un usuario registrado

    if @comment.save
      redirect_to @publication, notice: 'Comentario agregado con éxito.'
    else
      redirect_to @publication, alert: 'No se pudo agregar el comentario.'
    end
  end

  private

  def set_publication
    @publication = Publication.find(params[:publication_id])
  end

  def comment_params
    params.require(:user_comment).permit(:content)
  end

end
