require 'csv'
require 'sequel'

class CSVLoader
  def self.initialize(csv_path, db_path)
    db ||= Sequel.sqlite("db_path")

    db.create_table :jimmys_db do
      primary_key :id
      String :menu
      String :category
      String :name
      String :description
      String :price
    end

    @database ||= db[:jimmys_db]

    data = CSV.read('csv_path', headers: true, header_converters: :symbol)
  end
end
