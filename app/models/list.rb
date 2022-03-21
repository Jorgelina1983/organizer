class List < ActiveRecord::Base
	has_many :person_lists, class_name: 'PersonLists'
	has_many :people, :through => :person_lists

  def passengers
    people.count
  end
end
