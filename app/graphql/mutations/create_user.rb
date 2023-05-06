module Mutations
  class CreateUser < BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :email, String, required: true
  
    field :user, Types::UserType, null: true
    field :errors, [String], null: false
  
    def resolve(first_name:,last_name:, email:, password:, password_confirmation:)
      user = User.new(first_name:first_name,last_name:last_name, email:email, password:password, password_confirmation:password_confirmation)
      if user.save
        # Successful creation, return the created object with no errors
        {
          user: user,
          errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          errors: user.errors.full_messages
        }
      end
    end
  end
end
