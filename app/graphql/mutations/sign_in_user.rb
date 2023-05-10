module Mutations
  class SignInUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    #error
    field :errors, [String], null: false
    field :token, String, null: true
    field :success,String, null: true

    def resolve(email:,password:)
      user = User.find_by(email: email)
      # check if the user is found
      if user && user.authenticate(password)
        payload = {user_id: user.id}
        token = JWT.encode(payload,Rails.application.credentials.secret_key_base)
        context[:session][:token] = token
        {
          token: token,
          errors: [],
          success: "#{context[:current_user]}"
        }
      else
        {
          errors: ['Invalid email or password']
        }
      end
      
    end

  end
end
