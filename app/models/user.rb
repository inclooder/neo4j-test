class User
  include Neo4j::ActiveNode

  property :email
  property :name
  property :first_name
  property :last_name
  property :age, type: Integer

  has_many :in, :tweets, origin: :author
  has_many :in, :mentions, origin: :mentions, model_class: :Tweet

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, format: /\A[^A-Z]+\z/
end
