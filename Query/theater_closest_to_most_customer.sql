SELECT theater.theater_name
FROM  online_movie_reservation_model.theater
WHERE theater.theater_City = (SELECT personal_information.city as max_city
							  FROM online_movie_reservation_model.personal_information
							  GROUP BY personal_information.city
							  HAVING COUNT(personal_information.city) = (SELECT MAX(max_count_city)
																	     FROM (SELECT COUNT(personal_information.city) as max_count_city
																			   FROM online_movie_reservation_model.personal_information, 
																				    online_movie_reservation_model.customer
																			   WHERE customer.customer_id = personal_information.customer_id
																			   GROUP BY personal_information.city) as results))