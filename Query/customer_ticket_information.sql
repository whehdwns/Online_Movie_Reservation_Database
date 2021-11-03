SELECT customer.fname, customer.lname, ticket.number_of_seat, ticket.ticket_price, 
	   movie.movie_name, showtime.start_time, theater.theater_name
FROM online_movie_reservation_model.ticket, online_movie_reservation_model.payment, 
	 online_movie_reservation_model.customer, online_movie_reservation_model.movie,
     online_movie_reservation_model.screen_area, online_movie_reservation_model.theater,
     online_movie_reservation_model.showtime
WHERE ticket.payment_id = payment.payment_id AND payment.customer_id = customer.customer_id AND
	  customer.customer_id =1 AND ticket.screen_id = screen_area.screen_id  AND
      Movie.movie_id = showtime.movie_id AND showtime.show_id = screen_area.show_id AND
      screen_area.theater_id = theater.theater_id
      
