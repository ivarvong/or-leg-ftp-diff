require 'sucker_punch'
require 'net/ftp'
require './update_job'

class RefreshJob
	include SuckerPunch::Job

	def perform
		puts "Top of RefreshJob's perform"
		time_start = Time.now
		ftp = Net::FTP.new('landru.leg.state.or.us')
		ftp.passive = true
		ftp.login
		ftp.chdir('/pub')		
		ftp.nlst('*.txt').each do |file|
			mtime = ftp.mtime(file).to_i				
			ftp.get(file, "/tmp/#{file}")
		end

		puts "RefreshJob: perform took #{Time.now - time_start}"

		UpdateJob.new.async.perform()
	end

end