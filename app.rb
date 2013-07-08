require 'dotenv'
require './refresh_job'

Dotenv.load

get "/:#{ENV['ENDPOINT']}" do
	RefreshJob.new.async.perform()
	return "OK"
end