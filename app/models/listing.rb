class Listing < ApplicationRecord
  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? } # auto-fetch coordinates
  
  
  def country
    ISO3166::Country.new(country_code.upcase)
  end
  
  def full_address
    "#{street_address}, #{city}, #{country.name}"
  end
  
  
end
