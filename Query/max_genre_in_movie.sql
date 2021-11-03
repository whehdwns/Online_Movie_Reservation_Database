SELECT movie.movie_name, genre.genre_name
FROM online_movie_reservation_model.genre, online_movie_reservation_model.movie_genre, online_movie_reservation_model.movie
WHERE 	movie.movie_id = movie_genre.movie_id and 
		movie_genre.genre_id = genre.genre_id and
        genre.genre_id =  (SELECT genre.genre_id
							FROM online_movie_reservation_model.genre, online_movie_reservation_model.movie_genre, online_movie_reservation_model.movie
							WHERE movie.movie_id = movie_genre.movie_id and movie_genre.genre_id = genre.genre_id
							GROUP BY movie_genre.genre_id
							ORDER BY COUNT(genre.genre_id) DESC LIMIT 1)

