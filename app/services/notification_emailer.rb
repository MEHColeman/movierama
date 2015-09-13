# Used to send/queue up an email to the owner of a movie, telling that someone
# expressed their opinion on one of their submissions.
class NotificationEmailer
  def initialize(movie:, user:, opinion:)
    @movie, @user, @opinion = movie, user, opinion
  end
end
