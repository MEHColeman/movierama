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
end
