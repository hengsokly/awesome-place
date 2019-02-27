class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image

  def image
    object.image.url
  end
end
