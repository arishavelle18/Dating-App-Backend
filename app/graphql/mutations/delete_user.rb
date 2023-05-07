module Mutations
  class DeleteUser < BaseMutation
    
    argument :id, ID, required: true

    field :errors, String, null: false
    
    def resolve(id:)
      user = User.find_by(id:id)

      # check if the user is found
      if user
        user.destroy
        {errors: ""}
      else
        {errors: "User not found"}
      end
    end
  end
end
