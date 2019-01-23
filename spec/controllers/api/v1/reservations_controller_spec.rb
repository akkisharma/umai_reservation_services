

require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do

	describe "POST #create" do

	 	context "with valid parameters" do
      let(:valid_params) do
        {
					guest_id: 1,
					restaurant_id: 1,
					table_id: 1,
				  guest_count: 4,
					reservation_time: "23 jan 2019 09:00 am"
        }
      end

     	it "creates a new reservation" do
        expect { post :create, params: valid_params }.to change(Reservation, :count).by(+1)
        expect(response).to have_http_status :created
      end

    end

	 	context "with invalid parameters" do
      let(:invalid_params_with_incorrect_guest_count) do
        {
					guest_id: 1,
					restaurant_id: 1,
					table_id: 1,
				  guest_count: 2,
					reservation_time: "23 jan 2019 09:00 am"
        }
      end

     	it "does not create a new reservation" do
        expect { post :create, params: invalid_params_with_incorrect_guest_count }.to change(Reservation, :count).by(+0)
        expect(response).to have_http_status :unprocessable_entity
      end

    end

	end

end
