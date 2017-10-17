# == Schema Information
#
# Table name: listings
#
#  id                 :integer          not null, primary key
#  title              :string
#  street_address     :string
#  city               :string
#  country_code       :string
#  bed_count          :integer
#  bedroom_count      :integer
#  bathroom_count     :integer
#  description        :text
#  night_fee_cents    :integer
#  cleaning_fee_cents :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  host_id            :integer
#  latitude           :decimal(10, 6)
#  longitude          :decimal(10, 6)
#
class Listing < ApplicationRecord
  validates :title, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :country_code, presence: {message: -> (listing, data) { "No country for code: #{listing.country_code}"}}
  validates :bed_count, numericality: {greater_than: 0}
  validates :bedroom_count, numericality: {greater_than: 0}
  validates :bathroom_count, numericality: {greater_than: 0}
  validates :night_fee_cents, numericality: {greater_than: 0}
  
  has_many :conversations
  belongs_to :host, class_name: 'User'
  
  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode #, if: ->(obj){ obj.full_address.present? and obj.full_address_changed? } # auto-fetch
  # coordinates

  monetize :night_fee_cents
  monetize :cleaning_fee_cents
  
  def country
    ISO3166::Country.new(country_code.upcase)
  end
  
  def full_address
    return nil if country.nil?
    "#{street_address}, #{city}, #{country.name}"
  end
end

