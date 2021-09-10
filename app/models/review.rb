class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :product 

    def print_review
        "Review for #{product.name} by #{user.name}: #{self.star_rating}. #{self.comment}"
    end
end