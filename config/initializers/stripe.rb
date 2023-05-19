require 'dotenv'

Rails.configuration.stripe = {
    publishable_key:'pk_test_51N9WNvKEgZiwtZMaFKqMHEyc3ZbjMCqmfQCoc4Hlh4j8QIR2Po4TYJCwvc9nmCJxveEqztG8XohpTVnxkNH8g1yE00E2Jcdwyr',
    secret_key:'sk_test_51N9WNvKEgZiwtZMaP8UWH4RzwJsVBCp0O6rRlzsDQNpT4hotMvaKmdD73tz2xM3uAaDG1mK5DN25KtJ2db8SF5ys00whcb0xZp'
  }
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
  