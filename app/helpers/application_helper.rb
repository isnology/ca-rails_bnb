module ApplicationHelper
  
  def format_cents_for_country(cents, country)
    Money.new(cents, country.currency.code).format
  end
end
