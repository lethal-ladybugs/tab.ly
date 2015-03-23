class Business < ActiveRecord::Base

	has_many :jobs 

	def has_employee(id)
		emp = Job.where({user_id: id, business_id: self.id})
		if emp == []
			false
		else
			true
		end
	end

end
