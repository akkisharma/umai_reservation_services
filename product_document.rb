API List:
---------

1: create a reservation

URL: http://localhost:3000/api/v1/reservations
method: POST
params:
{
	"guest_id" : 1,
	"restaurant_id" : 1,
	"table_id": 1,
  "guest_count" : 4,
	"reservation_time" : "23 jan 2019 08:00 am"
}



2: updates the reservation

URL: http://localhost:3000/api/v1/reservations/<reservation_id>
method: PUT
params:
{
	"reservation_time" : "23 jan 2019 12:00 pm",
  "guest_count" : 5
}


3: list of reservations for a restaurant

URL: http://localhost:3000/api/v1/restaurants/<restaurant_id>
Method: GET
