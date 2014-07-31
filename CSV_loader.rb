require 'csv'
require 'sequel'

class CSVLoader
  def self.initialize(csv_path, db_path)
    DB ||= Sequel.sqlite("db_path")

    DB.create_table :jimmys_db do
      primary_key :id
      String :menu
      String :category
      String :name
      String :description
      String :price
    end

    @database ||= db[:jimmys_db]

    data = CSV.read('csv_path', headers: true, header_converters: :symbol)

    rows = data.each do |row|
      @database.insert(:menu        => row[:menu],
                       :category    => row[:category],
                       :name        => row[:name],
                       :description => row[:description],
                       :price       => row[:price]
                        )
    end
  end
end
