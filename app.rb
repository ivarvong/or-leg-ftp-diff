require './refresh_job'

get "/#{ENV['ENDPOINT'] || 'test'}" do
	RefreshJob.new.async.perform()
	return "OK"
end