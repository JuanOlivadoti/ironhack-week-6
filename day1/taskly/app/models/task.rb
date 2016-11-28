class Task < ApplicationRecord
	belongs_to :user

	def complete!
		self.completed_at = true
		self.save
	end

	def as_json(options={})
		super(except: [:user_id, :created_at, :updated_at])
	end

	def completed_tasks
		
	end
end
