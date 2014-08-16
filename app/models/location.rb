class Location < ActiveRecord::Base

  # instruct Geocoder gem which method returns your object's geocodable address:
  geocoded_by :full_street_address                  # can also be an IP address
  # For reverse geocoding, instruct Geocoder gem which attributes store latitude and longitude, and where to store the address
  reverse_geocoded_by :latitude, :longitude, address: :result

  after_validation :complete_location               # auto-fetch coordinates, or reverse-geocode


  private

  def full_street_address
    search || address
  end

  def address
    [street, city, zip_code, province, country].compact.join(',').presence
  end

  def complete_location
    if full_street_address.present? && !(latitude.present? && longitude.present?)
      geocode
    elsif (latitude.present? && longitude.present?) && result.blank?
      reverse_geocode
    end
  end

end
