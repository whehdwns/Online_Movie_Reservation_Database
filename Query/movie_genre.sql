SELECT movie.movie_name, genre.genre_name
FROM online_movie_reservation_model.movie, online_movie_reservation_model.movie_genre, 
	 online_movie_reservation_model.genre
WHERE movie.movie_id = movie_genre.movie_id AND movie_genre.genre_id = genre.genre_id
ORDER BY genre.genre_id