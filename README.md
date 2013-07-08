The Oregon State Legislature has an FTP server [1] with information about the session. 

This is a small app that pulls those text files to diff them.

It uses the sucker_punch gem to do the FTP fetching from the main Heroku web process. The rake task only hit the endpoint in the Sinatra app, which queues the job and immediately returns. The scheduler only runs for a few seconds, making it pretty cheap.

This is a major work in progress. All it does right now is download the files.

[1] ftp://landru.leg.state.or.us/pub
