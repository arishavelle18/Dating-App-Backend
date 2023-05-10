# frozen_string_literal: true

module Types
  class SwipeType < Types::BaseObject
    field :id, ID, null: false
    field :swiped_by_id, Integer, null: false
    field :swiped_user_id, Integer, null: false
    field :status, String
    field :is_match, Boolean
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
