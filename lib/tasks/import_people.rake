# rake import:people["/home/georgie/code/organizer/LISTADO.csv"]
require 'csv'

namespace :import do
desc "Add a list of people form a csv/xsl file to the organizer database"

task :people, [:file_path] => :environment do |t, args|
		puts 'hola'
		byebug
		file_path = args[:file_path]		
		CSV.foreach(file_path, headers: true) do |row|			
			person = Person.new(row.to_hash)
			person.first_name = person.first_name.titleize unless person.first_name.blank?
			person.last_name = person.last_name.titleize unless person.last_name.blank?
			person.address = person.address.titleize unless person.address.blank?
		  	puts person.inspect
		  	person.save
		end	
end
end