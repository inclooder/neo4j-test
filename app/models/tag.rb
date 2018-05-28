class Tag
  include Neo4j::ActiveNode

  property :name

  has_many :in, :tweets, origin: :tags

  validates :name, presence: true
end
