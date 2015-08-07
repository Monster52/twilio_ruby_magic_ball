require 'rubygems'
require 'twilio-ruby'

account_sid = 'My SID'
auth_token = 'My token'

puts "Welcome to the Magic Ruby where all your questions can be answered!"
print "Please ask a question: "

question = gets.chomp

answers = ["It is certain",
           "It is decidedly so",
           "Without a dout",
           "Yes definitely",
           "You may rely on it",
           "As I see it, yes",
           "Most likely",
           "Outlook good",
           "Yes",
           "Signs point to yes",
           "Reply hazy try again",
           "Ask again later",
           "Better not tell you now",
           "Cannot predict now",
           "Concentrate and ask again",
           "Don't count on it",
           "My reply is no",
           "My sources say no",
           "Outlook is not good",
           "Very doubtful"
          ]

@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.account.messages.create(:body => "#{question}\n#{answers.sample}",
                                          :to => "+Target number",
                                          :from => "+Twilio number"
                                         )

puts "You answer has been sent to #{message.to}."


