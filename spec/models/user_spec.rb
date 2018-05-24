require 'rails_helper'

describe User do
  describe '.create!' do
    it 'saves the record in the database' do
      user = User.create!(
        email: 'a@a.pl',
        first_name: 'Jan',
        last_name: 'Kowalski',
        age: 18
      )
      db_user = User.find_by(email: 'a@a.pl')
      expect(db_user).to eq(user)
    end
  end
end
