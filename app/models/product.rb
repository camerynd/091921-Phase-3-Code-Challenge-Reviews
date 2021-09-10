class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        Review.create(star_rating: star_rating, comment: comment, product_id: self.id, user_id: user.id)
    end

    def print_all_reviews
        reviews.map(&:print_review)
    end

    def average_rating
        sum = reviews.map(&:star_rating).sum
        sum / reviews.map(&:star_rating).length.to_f
    end
end