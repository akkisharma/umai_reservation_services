

require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :controller do

	describe "GET #show" do

	 	context "with valid parameters" do
	   	before do
	      get :show, params: {id: restaurant.id}
	    end

	    let(:restaurant) {
	    	Restaurant.create({
	    		id: 1,
	    		name: "punjabi rasoi",
					email: "sharma.akash1891@gmail.com",
					phone: "1234567980",
					latitude: 18.6523893,
					longitude: 73.7311266,
					morning_shift_start: "09:00 am",
					morning_shift_end: "01:00 pm",
					night_shift_start: "06:00 pm",
					night_shift_end: "11:00 pm"
	    	})
	    }

 		 	it "returns http success" do
	      expect(response).to have_http_status(:success)
	    end

    end

	end

end
