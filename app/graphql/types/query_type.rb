module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :male_users, [Types::UserType], null: false, description: "Returns all male users"
    field :female_users, [Types::UserType], null: false, description: "Returns all female users"

    def male_users

      User.where(gender: true).where.not(id: context[:current_user].id)
    end

    def female_users
      User.where(gender: false).where.not(id: context[:current_user])
    end

  end
end
