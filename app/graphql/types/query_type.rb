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

    field :male_users, [Types::UserType], null: false do 
      argument :id, ID, required: true    
      argument :gender_interested_in, Boolean, required: true
    end
      
    field :female_users, [Types::UserType], null: false do
      argument :id, ID, required: true    
      argument :gender_interested_in, Boolean, required: true
    end

    def male_users(id:,gender_interested_in:)
      # User.where(gender: false,gender_interest:gender_interested_in).where.not(id: id)
      users = User.where(gender: false, gender_interest: gender_interested_in).where.not(id: id)

      # Find all female users who have been swiped by the current user
      swiped_user_ids = Swipe.where(swiped_by_id: id).pluck(:swiped_user_id)

      # Return only the female users who have not been swiped by the current user
      users.where.not(id: swiped_user_ids)
    end

    def female_users(id:,gender_interested_in:)
      # Find all female users who match the gender of interest and are not the current user
      users = User.where(gender: true, gender_interest: gender_interested_in).where.not(id: id)

      # Find all female users who have been swiped by the current user
      swiped_user_ids = Swipe.where(swiped_by_id: id).pluck(:swiped_user_id)

      # Return only the female users who have not been swiped by the current user
      users.where.not(id: swiped_user_ids)
    end

  end
end
