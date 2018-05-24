class Tweet
  include Neo4j::ActiveNode

  property :body

  has_one :out, :author, type: :written_by, model_class: :User
end
