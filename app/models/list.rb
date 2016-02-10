class List < ActiveRecord::Base
	has_many :people, :through => :person_lists
end
