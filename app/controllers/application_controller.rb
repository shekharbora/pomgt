class ApplicationController < ActionController::Base
	before_action :set_most_viewed
	before_action :authenticate_user!



	private

	def set_most_viewed
	  most_viewed = Post.most_viewed
	end
end
