class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end
end