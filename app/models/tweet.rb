class Tweet
  include Neo4j::ActiveNode

  property :body

  has_one :out, :author, type: :written_by, model_class: :User
  has_many :out, :mentions, type: :mentions, model_class: :User

  validates :author, presence: true
end
