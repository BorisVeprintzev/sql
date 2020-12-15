Select AVG("Vacancies"."compensation_from") as averageMin,
	AVG("Vacancies"."compensation_to") as averageMax,
	AVG("Vacancies"."compensation_to" - "Vacancies"."compensation_from") as averageAverage
	From "Vacancies"
	Where "Vacancies"."compensation_gross" = True