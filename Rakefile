require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc 'Populate database with sample data'
task "db:populate" do
  Mayor.destroy_all
  Mayor.create!(name: "Gregor Robertson", email: "gregor.robertson123456@vancouver.ca", city: "Vancouver", twitter: "@MayorGregor123456")
  Mayor.create!(name: "Linda Hepner", email: "mayor123456@surrey.ca", city: "Surrey", twitter: "@CityofSurrey123456")
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end
