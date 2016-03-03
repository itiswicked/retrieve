require 'gmail'

Gmail
  .connect!('getsmarty87', ARGV[0])
  .inbox
  .emails(:unread)
  .each do |email|
    if email.sender[0].mailbox == 'nathanrbourke' && email.subject.include?("Imgur")
      url = email.body.match(/https:\/\/imgur.+/)
      system "open #{url}"
      email.read!
    end
  end

gmail.logout
