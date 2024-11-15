class Like < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  # Validación para evitar duplicados: un usuario solo puede dar un like/dislike por publicación
  validates :user_id, uniqueness: { scope: :publication_id, message: "You can only like or dislike once per publication" }
  validates_uniqueness_of :user, scope: :publication
  # Validación para asegurarse de que 'like_type' sea solo 1 o -1
  validates :like_type, inclusion: { in: [-1, 1], message: "must be either 1 (like) or -1 (dislike)" }
end