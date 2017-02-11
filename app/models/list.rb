class List < ActiveRecord::Base
	has_many :person_lists
	has_many :people, :through => :person_lists
end
