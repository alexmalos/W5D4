class ShortenedUrl < ApplicationRecord
    def self.url_generator(user, long_url)
        ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: self.random_code)
    end

    def self.random_code
        random_url = SecureRandom.urlsafe_base64
        while ShortenedUrl.exists?(short_url: random_url)
            random_url = SecureRandom.urlsafe_base64
        end
        random_url
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true
    validates :user_id, presence: true
end