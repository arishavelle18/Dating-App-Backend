module Mutations
  class CreateDislike < BaseMutation
    argument :swiped_user_id, Integer, required: true
    argument :swiped_by_id, Integer, required: true
    argument :status, String, required: true
    argument :is_match, Boolean, required: true

    field :swipe, Types::SwipeType, null: true
    field :errors, [String], null: false
    # create a function that will resolve the mutation in the schema in swipe
    def resolve(swiped_user_id:,swiped_by_id:,status:,is_match:)
      swipe = Swipe.new(
        swiped_user_id: swiped_user_id,
        swiped_by_id: swiped_by_id,
        status: status,
        is_match: is_match
      )
      if swipe.save
        { swipe: swipe, errors: []}
      else
        {errors: swipe.errors.full_messages}
      end
    end
  end
end
