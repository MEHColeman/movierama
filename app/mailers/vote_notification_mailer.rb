class VoteNotificationMailer < ActionMailer::Base
  default from: 'voternewsexample.com'

  def like_email(movie, voter)
    @recipient = movie.user
    @movie = movie
    @voter = voter
    mail(to: @recipient.email, subject: 'Someone agrees with you!')

    self
  end
end
