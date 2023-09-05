class Call < ApplicationRecord
  include PgSearch::Model

  scope :search_full_text, ->  (buscar) { 
    joins(:client, :reason).where("clients.name = ? OR reasons.name = ?", buscar, buscar)  
  }
  belongs_to :user
  belongs_to :client
  belongs_to :reason
end
