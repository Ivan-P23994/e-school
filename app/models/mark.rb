class Mark < ApplicationRecord
  enum :grade_point, %i(A A- B+ B C+ C F)

  belongs_to :user

end
