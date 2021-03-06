# Locations

## An app to demonstrate

* geocoding *country, city, street, number* addresses into lat-lang coordinates
* reverse-geocoding lat-lang coordinates into addresses
* displaying locations on a map
* calculating the (shortest) distance between two locations
* finding all near by locations

### Geocoder

It uses the Geocoder gem, which has an extensive documentation at <https://github.com/alexreisner/geocoder>

Nevertheless, some details might be understood better through

        bundle open geocoder

### API access

The app uses the Google Geolocation API. To have a quota of 2500 per day (instead of a mere 100), you need to generate an API key and add it to your environment variables:

          export GOOGLE_LOCATION_API_KEY=mySecretGoogleAPIKey

To get a key: open <https://console.developers.google.com/apis/library>, log in with your Google Account, click the Services link from the left-hand menu in the APIs Console, then activate the Geocoding API and generate a new key.

You also have to activate the Google Maps JavaScript API as your API Key will be used in the javascript_include_tag that the gem gmaps4rails needs to display the map.

### lat and long

Are the abbrevations for _latitude_ and _longitude_. As a pair they are refered to as _coordinates_.

### How to run it

*Just clone, bundle, create your postgres database, migrate, create the seeds, fire up your server and visit* <http://localhost:3000/>

And thank git, github, rails and rake to make it that easy!

---

## Displaying maps

Displaying the map is an integral part, as it is demanded by the Google Geolocation API terms & conditions that the fetched geolocation data may only be used to display Google Maps. The views are created with help of the Gmaps4Rails gem <https://github.com/apneadiving/Google-Maps-for-Rails>.

To display a map with only one marked location, use an URL like: <http://localhost:3000/locations?ids[]=6>

To display a map with multiple marked locations, use an URL like: <http://localhost:3000/locations?ids[]=1&ids[]=2&ids[]=3>

---

## Location Model

Our location model contains the fields `latitude` and `longitude` for the values that the API will return.

It contains a field `result` that the API will fill with a _street address_ when we search with coordinates only.

It also contains some fields that the user might use to input his address, e.g. `country, city, street`.

### Creation

Create a new location, this uses an API call and adds the lat and long coordinates to the object.

        barcelona = Location.create(country: "ES", city: "Barcelona")

Create a new location, through passing lat and long  this uses an API call and adds the lat and long coordinates to the object.

        london = Location.create(latitude: 51.5073509, longitude: -0.1277583)

### Querying

The Geocoder gem adds several scopes to our ActiveRecord model. This makes it possible to do further database calculations without additional API calls.

#### near

Search in our database table for locations in the maximum distance of 10km to the object `barcelona`. This uses the lat and long coordinates.

        near_by_locations = Location.near(barcelona, 10)

#### distance_to

Let our database calculate the distance between our objects `barcelona` and `london`. The result will be in kilometer. This uses the lat and long coordinates.

        distance_in_km = barcelona.distance_to(london)

---

## Geocoding existing Location objects

It is possible to add lat and lang coordinates to Location objects in bulk. The `sleep` parameter should prevent to hit the Google API's request per seconds limit.

        rake geocode:all CLASS=Location SLEEP=0.25 BATCH=100

## Tests

The specs use a default stub to not hit the API.

---
