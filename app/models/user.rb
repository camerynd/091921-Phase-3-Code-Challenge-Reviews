class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        highest_rating = reviews.map(&:star_rating).max
        highest_rated_product_review = reviews.find { |review| review.star_rating == highest_rating }
        self.products.find { |product| product.id == highest_rated_product_review.product_id ? product : "no match"}
        # self.products.map { |product| 
        # if product.id == highest_rated_product_review.product_id
        #     return product
        # else
        #     return "no match"
        # end}
    end

    def remove_reviews(product)
        review = self.reviews.find_by_product_id(product.id)
        review.destroy
    end
end