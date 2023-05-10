module Mutations
  class UpdateUser < BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :email, String, required: true
    argument :birthdate, GraphQL::Types::ISO8601Date, required: false
    argument :gender,Boolean, required: true
    argument :gender_interest,Boolean, required: true
    argument :country, String, required: true
    argument :region, String, required: true
    argument :city, String, required: true
    argument :school, String, required: false
    argument :images, [String], required: false
    argument :id, ID, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false
  
    def resolve(id:,first_name:, last_name:, email:, password:, password_confirmation:, birthdate:, gender:, gender_interest:, country:, region:, city:, school:,images:)
      user = User.find_by(id:id)
    
      if user.update(
        first_name: first_name,
        last_name: last_name, 
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        birthdate: birthdate,
        gender: gender,
        gender_interest: gender_interest,
        country: country,
        region: region,
        city: city,
        school: school.presence ? school : nil,
        images: images.presence ? {images: images}.to_json : nil
        )
        # Successful creation, return the created object with no errors
        {
          user: user,
          errors: []
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
