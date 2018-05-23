class User
  include Neo4j::ActiveNode

  property :email
  property :first_name
  property :last_name
  property :age, type: Integer
end
