class Location < ActiveRecord::Base

  # instruct Geocoder gem which method returns your object's geocodable address:
  geocoded_by :full_street_address                  # can also be an IP address
  # For reverse geocoding, instruct Geocoder gem which attributes store latitude and longitude, and where to store the address
  reverse_geocoded_by :latitude, :longitude, address: :result

  after_validation :complete_location               # auto-fetch coordinates, or reverse-geocode

  def address
    [street, city, zip_code, province, country].compact.join(', ').presence
  end

  def coordinates
    if latitude.present? && longitude.present?
      { latitude: latitude, longitude: longitude }
    else
      {}
    end
  end

  def self.markers(locations)
    Gmaps4rails.build_markers(locations) do |location, marker|
      marker.lat          location.latitude
      marker.lng          location.longitude
      marker.title        "X marks the spot"
      marker.infowindow   location.result || location.address || location.search
    end.to_json
  end


  private

  def full_street_address
    search || address
  end

  def complete_location
    if full_street_address.present? && coordinates.empty?
      geocode
    elsif coordinates.present? && result.blank?
      reverse_geocode
    end
  end

end
