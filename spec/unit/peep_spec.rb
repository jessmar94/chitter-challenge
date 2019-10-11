require 'peep'
require 'database_helpers_spec'

describe Peep do

  describe '.all' do
    it 'returns all the peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')

      peep = Peep.create(message: 'This is a test peep')
      Peep.create(message: 'This is a test peep 2')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peep).to be_a Peep
      expect(peep.message).to eq 'This is a test peep'
      expect(peeps).to include("This is a test peep")
      expect(peeps).to include("This is a test peep 2")
    end
  end


  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'test message')

      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'test message'

    end
  end
end
