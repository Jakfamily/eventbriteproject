# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.default_options = { from: 'eventbrite@example.com' }