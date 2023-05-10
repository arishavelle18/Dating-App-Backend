# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :images, [String] ,null:true
    field :created_at,GraphQL::Types::ISO8601DateTime,null:false
    field :updated_at,GraphQL::Types::ISO8601DateTime,null:false
    field :birthdate, GraphQL::Types::ISO8601Date, null: false
    field :gender,Boolean, null: false
    field :gender_interest,Boolean, null: false
    field :country, String, null: false
    field :region, String, null: false
    field :city, String, null: false
    field :school, String, null: true
    field :bio, String, null: false
    field :swipes_given, [Types::SwipeType], null: false 
    field :swipes_received, [Types::SwipeType], null: false


      def images
        JSON.parse(object.images)["images"]
      end
  end
end
