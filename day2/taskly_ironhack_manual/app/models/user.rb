class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


   validates :password, presence: true, length: { minimum: 8 }

	has_many :tasks

	has_secure_password
	

	def as_json(options={})
  	super( only: [:name,:email],
    	methods: [:tasks_count],
    	include: [tasks:  { only: :name }])
	end

	def tasks_count
		self.tasks.count
	end
end
