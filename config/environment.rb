<<<<<<< HEAD

require 'bundler'
Bundler.require

=======
require 'bundler'
Bundler.require
>>>>>>> remotes/origin/Adam
require_relative '../tinyGameEngine/UI.rb'
require_relative '../tinyGameEngine/gameevent.rb'
require_relative '../tinyGameEngine/gametrigger.rb'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/Dragon_Maker.db')
require_all 'lib'

DB = {:conn => SQLite3::Database.new("Dragon_Maker.db")}