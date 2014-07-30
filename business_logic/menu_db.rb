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
    database.where(:id => item_id)
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
end
