class CreateTweet < Neo4j::Migrations::Base
  def up
    add_constraint :Tweet, :uuid
  end

  def down
    drop_constraint :Tweet, :uuid
  end
end
