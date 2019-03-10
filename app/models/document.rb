class Document < ApplicationRecord
  belongs_to :user

  has_attached_file :file
end
