require 'pg'

def setup_test_database

  p "Setting up test database..."

  connection = PG.connect(dbname: 'peep_manager_test')

  connection.exec("TRUNCATE peeps, users;")
end
