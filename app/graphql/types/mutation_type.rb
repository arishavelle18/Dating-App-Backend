module Types
  class MutationType < Types::BaseObject
    field :delete_image, mutation: Mutations::DeleteImage
    field :delete_user, mutation: Mutations::DeleteUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :create_user, mutation: Mutations::CreateUser
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
