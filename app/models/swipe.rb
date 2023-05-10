class Swipe < ApplicationRecord
  belongs_to :swiped_by, class_name: 'User'
  belongs_to :swiped_user, class_name: 'User'
end
