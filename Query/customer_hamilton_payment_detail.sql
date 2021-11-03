SELECT customer.fname, customer.lname, payment_detail.Card_type, 
	   payment_detail.Card_number, payment_detail.Expire_date, payment_detail.csv
FROM online_movie_reservation_model.payment_detail,
     online_movie_reservation_model.payment,
	 online_movie_reservation_model.customer
WHERE payment_detail.payment_detail_id = payment.payment_detail_id AND
	  payment.customer_id = customer.customer_id AND
	  customer.fname ='Hamilton'