module Mutations
  class DeleteImage < BaseMutation
    argument :public_ids, String, required: true
    field :errors, [String], null: false

    def resolve(public_ids:)
      errors = []
      JSON.parse(public_ids).each do |public_id|
        begin
          public_id = public_id.split("/").last.split(".").first
          Cloudinary::Uploader.destroy("upload-demo/#{public_id}")

        rescue CloudinaryException => e
          errors << e.message
        end
      end
      if errors.empty?
        { errors: ["Image(s) deleted successfully"] }
      else
        { errors: errors }
      end
    end
  end
end