class BakerySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zip, :description, :img_url
end
