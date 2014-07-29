require 'csv'
require 'sequel'

class MenuDB
  attr_accessor :database

  def initialize
    db ||= Sequel.sqlite("/Users/andy/projects/sinatra/lodojimmys/db/menu.db")
    @database ||= db[:jimmys_db]
  end

  def self.menus(menu)
    database.where(:menu => menu)
  end

  def categories
    database.map { |e| e[:category] }.uniq
  end

  def menu_items(category)
    database.where(:category => category)
  end
end


#     data = CSV.read('/Users/andy/projects/sinatra/lodojimmys/db/jimmys_menu.csv', headers: true, header_converters: :symbol)
#     rows = data.each do |row|
#       database.insert(:id => row[:id],
#                       :menu        => row[:menu],
#                       :category    => row[:category],
#                       :name        => row[:name],
#                       :description => row[:description],
#                       :price       => row[:price]
#       )
#     end
#
#     def self.create
#       DB = Sequel.sqlite("/Users/andy/projects/sinatra/lodojimmys/db/menu.db")
#
#       DB.create_table :jimmys_db do
#         primary_key :id
#         String :menu
#         String :category
#         String :name
#         String :description
#         String :price
#       end
#     end
# end
