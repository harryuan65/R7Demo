class Comment < ApplicationRecord
  belongs_to :post
  broadcasts_to :post  # create update destroy will broadcast to post
end
