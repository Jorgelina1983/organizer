class PersonLists < ActiveRecord::Base
	belongs_to :person, class_name: 'Person'
	belongs_to :list, class_name: 'List'
end
