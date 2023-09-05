class Client < ApplicationRecord
    mount_uploader :image, ImageUploader

    include PgSearch::Model

    pg_search_scope :search_full_text, against: {
        name: 'A',
        id: 'B',
     }
    

    has_many :calls
    has_many :users, through: :calls
    has_many :reasons, through: :calls
end
