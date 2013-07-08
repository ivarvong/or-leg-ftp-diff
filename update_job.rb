require 'sucker_punch'

class UpdateJob
	include SuckerPunch::Job

	def perform
		puts "I'm UpdateJob. I should check for diffs and stuff"
	end

end