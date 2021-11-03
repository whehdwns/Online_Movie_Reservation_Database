SELECT movie.movie_name, showtime.start_time as earliest_movie 
FROM  online_movie_reservation_model.showtime,
	  online_movie_reservation_model.movie
WHERE movie.movie_id = showtime.movie_id AND showtime.start_time < '12:00'
ORDER BY showtime.start_time ASC