class CoursesSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :image_url

  def image_url
    object.image.attached? ? Rails.application.routes.url_helpers.url_for(object.image) : nil
  end
end
