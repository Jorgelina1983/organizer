# rake import:people["/home/georgie/code/organizer/LISTADO.csv"]
require 'csv'

namespace :import do
	desc "Add a list of people form a csv/xsl file to the organizer database"

	task :people, [:file_path] => :environment do |t, args|
			puts 'Importing people to database of people.'
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

	desc "Import travelers from .csv file"

	task :travelers, [:file_path] => :environment do |t, args|
		puts 'Starting travelers import.'

		file_path = args[:file_path]		
			CSV.foreach(file_path, headers: true) do |row|			
				person = Person.new(row.to_hash)

				exist_person = Person.where(first_name: person.first_name,
					                          last_name:person.last_name).first
				if exist_person.blank?
					puts 'New person'
					person.first_name = person.first_name.upcase unless person.first_name.blank?
					person.last_name = person.last_name.upcase unless person.last_name.blank?
					person.address = person.address.titleize unless person.address.blank?
					person.traveler = true			  	
			  	    person.save
				else
					puts 'Person already exist, updating information.'
					exist_person.first_name.upcase!
					exist_person.last_name.upcase!
					exist_person.identification = person.identification unless person.identification.blank?
					exist_person.cell_phone = person.cell_phone unless person.cell_phone.blank?
					exist_person.phone = person.phone unless person.phone.blank?
					exist_person.dob = person.dob unless person.dob.blank?
					exist_person.address = person.address unless person.address.blank?
					exist_person.address_number = person.address_number unless person.address_number.blank?
					exist_person.traveler = true

					exist_person.save
			  end

			  puts 'PERSON: ' + person.inspect
			end
	end

	desc "Capitalize"

	task :cap => :environment do |t, args|
		puts "Capitalize people's strings."
		Person.all.each do |person|			
			person.first_name = person.first_name.upcase unless person.first_name.blank?
			person.last_name = person.last_name.upcase unless person.last_name.blank?
			person.address = person.address.upcase unless person.address.blank?

			person.phone = person.phone == "-" ? "" : person.phone
			person.cell_phone = person.cell_phone == "-" ? "" : person.cell_phone
		  puts person.inspect
		  person.save
		end
	end
end