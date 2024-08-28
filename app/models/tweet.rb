class Tweet < ApplicationRecord
    validates :content, presence: true, uniqueness: true, length: { in: 10..20 }
  end
  
