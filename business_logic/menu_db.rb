require 'csv'
require 'sequel'

class MenuDB
  attr_accessor :database

  def initialize
    db ||= Sequel.sqlite("#{File.expand_path('./db')}/menu.db")
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

  def item(item_id)
    database.where(:id => item_id).first
  end

  def menu_brunch
    brunch = database.where(:menu => 'Brunch')
    brunch.map { |e| e[:category] }.uniq
  end

  def menu_regular
    regular = database.where(:menu => 'Regular')
    regular.map { |e| e[:category] }.uniq
  end

  def add(data)
    database.insert(data)
  end

  def edit(id, params)
    database.where(:id => id).update(:name        => params[:menu_item][:name],
                                     :description => params[:menu_item][:description],
                                     :price       => params[:menu_item][:price])
  end

  def delete(id)
    database.where(:id => id).delete
  end

  def add_column(name)
    database.add_column(name, String)
  end
end
