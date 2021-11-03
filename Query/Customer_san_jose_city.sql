SELECT customer.fname, customer.lname
FROM online_movie_reservation_model.customer, online_movie_reservation_model.personal_information
WHERE customer.customer_id = personal_information.customer_id AND
	  personal_information.City = 'San Jose'
	  