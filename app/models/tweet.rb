class Tweet < ApplicationRecord
    validates :message, presence: true
    validates :message, length: { maximum: 140 }
end
