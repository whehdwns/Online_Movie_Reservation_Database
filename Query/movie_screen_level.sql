SELECT screen_level.watching_standard
FROM online_movie_reservation_model.movie, online_movie_reservation_model.screen_level
WHERE movie.level_id = screen_level.level_id