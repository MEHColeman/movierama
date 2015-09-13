# Used to send/queue up an email to the owner of a movie, telling that someone
# expressed their opinion on one of their submissions.
class NotificationEmailer
  def initialize(voter:, movie:, opinion:)
    @voter, @movie, @opinion = voter, movie, opinion
  end

  def send_notification
    return if @movie.user.email == nil
    VoteNotificationMailer.send("#{@opinion}_email", @movie, @voter).deliver
  end
end
