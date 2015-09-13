require 'rails_helper'

RSpec.describe NotificationEmailer do

  let(:movie_submitter) {
    double('User',
           name: 'Testy McTesterson',
           email: 'testy@example.com') }
  let(:movie) {
    double('Movie',
           title: 'Star Wars: The Force Awakens',
           user:  movie_submitter)
  }
  let(:voter) { double('User', name: 'Votey McVoter') }
  let(:opinion) { :like }

  subject {
    NotificationEmailer.new(voter: voter, movie: movie, opinion: opinion)
  }

  describe '.initialize' do
    it 'takes a movie, a user and an opinion' do
      expect(subject).to be_a NotificationEmailer
    end
  end

  describe '#send_notification' do
    it 'ensures an email is sent when someone likes a movie' do
      expect{ subject.send_notification }.to change {
        ActionMailer::Base.deliveries.count
      }.by(1)

      email = ActionMailer::Base.deliveries.last

      expect(email.to).to eq ['testy@example.com']
      expect(email.subject).to eq 'Someone agrees with you!'
      expect(email.body).to include 'Votey McVoter'
      expect(email.body).to include 'like the movie'
      expect(email.body).to include 'Star Wars: The Force Awakens'

    end
  end
end
