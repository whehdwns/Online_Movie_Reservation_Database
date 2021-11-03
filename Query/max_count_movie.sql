SELECT movie.movie_name, COUNT(ticket.movie_id)
FROM online_movie_reservation_model.ticket, online_movie_reservation_model.movie
WHERE ticket.movie_id = movie.movie_id
GROUP BY ticket.movie_id
HAVING COUNT(ticket.movie_id) = (SELECT MAX(maxcount)
								 FROM (SELECT COUNT(ticket.movie_id) as maxcount
									   FROM online_movie_reservation_model.ticket, 
											online_movie_reservation_model.movie
									   WHERE ticket.movie_id = movie.movie_id
									   GROUP BY ticket.movie_id) as results)