class PersonLists < ActiveRecord::Base
	belongs_to :people
	belongs_to :lists
end
