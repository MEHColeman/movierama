require 'rails_helper'
require 'capybara/rails'
require 'support/pages/movie_list'
require 'support/pages/movie_new'
require 'support/with_user'

RSpec.describe 'movie submitter receives an email notification', type: :feature do

  let(:page) { Pages::MovieList.new }

  before do
    author = User.create(
      uid:  'null|12345',
      name: 'Bob',
      email: 'bob@example.com'
    )
    Movie.create(
      title:        'Avengers: Age of Ultron',
      description:  'A new age begins',
      date:         '2015-04-23',
      user:         author
    )
  end

  context 'when a user is logged in' do
    with_logged_in_user

    before { page.open }

    it 'sends a notification when a user votes' do
      expect do
        page.like('Avengers: Age of Ultron')
      end.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
