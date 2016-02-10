# rake import:people["/home/georgie/code/organizer/LISTADO.csv"]
require 'csv'

namespace :import do
desc "Add a list of people form a csv/xsl file to the database"

task :people, [:file_path] => :environment do |t, args|
		#file_path = "/home/Georgie/code/organizer/listado.csv"
		#CSV.parse(file_path, headers: true) do |row|
			#puts row.to_hash
		#	binding.pry
		#end
		file_path = args[:file_path]
		CSV.foreach(file_path, headers: true) do |row|
			person = Person.new(row.to_hash)
		  	puts person.inspect
		  	person.save
		end	
end
end