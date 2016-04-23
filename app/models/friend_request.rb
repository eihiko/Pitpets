class FriendRequest < ActiveRecord::Base

	def get_from_user
		User.find(self.from_user)
	end
end
