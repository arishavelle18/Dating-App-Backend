class User < ApplicationRecord
    has_secure_password
    has_many :swipes_given, foreign_key: :swiped_by_id, class_name: 'Swipe', dependent: :destroy
    has_many :swipes_received, foreign_key: :swiped_user_id, class_name: 'Swipe', dependent: :destroy
    # before saving the email
    before_save {self.email = email.downcase}

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true,length:{:maximum => 255},uniqueness: {case_sensitive: false},format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,message: "must be a valid email address"} # Replace FILL_IN with the right code.
    validates :password_confirmation,presence:true
    validates :password,presence:true,length:{minimum:6}
    validates :birthdate, presence: true
    validates :country, presence: true
    validates :region, presence: true
    validates :city, presence: true
   
    # check if the user is 18 or above
    validate :age_should_be_18_or_above

    def age_should_be_18_or_above
        if birthdate.present? && birthdate > 18.years.ago.to_date
        errors.add(:birthdate, "must be 18 years or older")
        end
    end
end
