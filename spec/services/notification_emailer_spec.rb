require 'rails_helper'

RSpec.describe NotificationEmailer do

  describe '.initialize' do
    let(:movie_submitter) { double('User', name: 'Testy McTesterson') }
    let(:movie) {
      double('Movie',
             title: 'Star Wars: The Force Awakens',
             user:  movie_submitter)
    }
    let(:voter) { double('User', name: 'Votey McVoter') }
    let(:opinion) { :like }

    subject {
      NotificationEmailer.new(user: voter, movie: movie, opinion: opinion)
    }

    it 'takes a movie, a user and an opinion' do
      expect(subject).to be_a NotificationEmailer
    end
  end
end
