class Tweet
  include Neo4j::ActiveNode

  property :body

  has_one :out, :author, type: :written_by, model_class: :User
  has_many :out, :mentions, type: :mentions, model_class: :User
  has_many :out, :tags, type: :tagged_by, model_class: :Tag

  validates :author, presence: true
  validates :body, presence: true
end
