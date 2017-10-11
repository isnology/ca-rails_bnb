MoneyRails.configure do |config|
  
  # set the default currency
  config.default_currency = :aud
  config.no_cents_if_whole = false

end