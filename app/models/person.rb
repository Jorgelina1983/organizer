class Person < ActiveRecord::Base
	has_many :person_lists, class_name: 'PersonLists'
	has_many :lists, :through => :person_lists

	validates_presence_of :first_name, :last_name,  { :message => "Campo requerido."}
	# validates_presence_of :associated_number, :if => :is_associated?

	def is_associated?
		!associated_number.blank?
	end

  def age
		if !dob.nil?
			age = Date.today.year - dob.year
    		age -= 1 if Date.today < dob + age.years #for days before birthday
    	end
    	age
	end

	def dob_formatted
		dob.nil? ? nil : dob.strftime("%d/%m/%Y")
	end

	def full_address
		return address + " " + address_number unless (address.nil? || address_number.nil?)
	end
end
