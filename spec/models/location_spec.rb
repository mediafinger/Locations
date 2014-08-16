#encoding: utf-8
require 'rails_helper'

describe Location do

  require 'geocoder'
  Geocoder.configure(:lookup => :test)

  # default result that will always be returned when testing   # TODO add fields Google delivers
  Geocoder::Lookup::Test.set_default_stub(
    [
      {
        'latitude'     => 41.3830970,
        'longitude'    => 2.1675150,
        'address'      => "Plaça dels Àngels, 1, Barcelona, Spain",
        'state'        => 'Catalunya',
        'state_code'   => 'CAT',
        'country'      => 'Spain',
        'country_code' => 'ES'
      }
    ]
  )


  describe "geocode" do

    context "when searching" do
      let(:location) { Location.new(search: "Plaça dels Àngels, 1, Barcelona, Spain") }

      it "should add lat and long to the model" do
        location.valid?

        expect(location.latitude).to  eq 41.3830970
        expect(location.longitude).to eq 2.1675150
      end
    end

    context "when address fields given" do
      let(:location) { Location.new(street: "Plaça dels Àngels, 1", city: "Barcelona", country: "Spain") }

      it "should add lat and long to the model" do
        location.valid?

        expect(location.latitude).to  eq 41.3830970
        expect(location.longitude).to eq 2.1675150
      end
    end

    context "when no address fields an no search given" do
      let(:location) { Location.new() }

      it "should not geocode" do
        location.valid?

        expect(location.latitude).to_not  be
        expect(location.longitude).to_not be
      end
    end

  end


  describe "reverse-geocode" do

    context "when lat and lang are set" do
      let(:location) { Location.new(latitude: 5.0, longitude: 50.5) }

      it "should add an result to the model" do
        location.valid?

        expect(location.result).to eq "Plaça dels Àngels, 1, Barcelona, Spain"
      end
    end

    context "when lat and lang are set and some address fields too" do
      let(:location) { Location.new(latitude: 5.0, longitude: 50.5, city: "Barcelona", country: "Spain") }

      it "should maybe do something - but maybe not..."
    end

    context "when lat and lang are set and a result exists" do
      let(:location) { Location.new(latitude: 5.0, longitude: 50.5, result: "Do not overwrite me") }

      it "should not add an result to the model" do
        location.valid?

        expect(location.result).to eq "Do not overwrite me"
      end
    end

    context "when lat and lang are not set" do
      let(:location) { Location.new() }

      it "should not geocode" do
        location.valid?

        expect(location.result).to_not be
      end
    end

  end

end
