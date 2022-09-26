class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :yes_clickbait

    CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]
    def yes_clickbait
        if CLICKBAIT.none? { |pattern| pattern.match title }
        errors.add(:title, "must be clickbait")
        end
    end
end
