class User < ApplicationRecord
    validates :name, uniqueness: true, allow_nil: false

    def self.active
        where("last_seen > ?", 5.minutes.ago)
    end
end
