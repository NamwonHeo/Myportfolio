class MainviewController < ApplicationController
	def index
		@specs = Spec.all
		@designs = Design.all
	end

end
