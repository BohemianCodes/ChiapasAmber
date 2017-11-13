if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_IHSstH3che6IAbFoWNf5t8GZ',
    secret_key: 'sk_test_gCWa3btEiHMbIWZWkbexnEm5'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
