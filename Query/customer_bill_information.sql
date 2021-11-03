SELECT customer.fname, customer.lname, ticket.ticket_price, Movie.movie_name
FROM online_movie_reservation_model.ticket, online_movie_reservation_model.payment, 
	 online_movie_reservation_model.customer, online_movie_reservation_model.movie
WHERE ticket.payment_id = payment.payment_id AND payment.customer_id = customer.customer_id AND
	  customer.customer_id =1 AND movie.movie_id = ticket.movie_id
      
