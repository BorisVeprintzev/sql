Select "Vacancies"."nameVac", "Citys"."nameCity", "Employers"."companyName" 
	FROM "Employers" JOIN "Responds" ON "Employers"."idCompany" = "Responds"."idEmp"
		join "Vacancies" on "Responds"."idVac" = "Vacancies"."idVac"
		join "Citys" on "Citys"."idCity" = "Vacancies"."idCity" 
	Where ("Vacancies"."compensation_from" is NULL) and ("Vacancies"."compensation_to" is NULL)
	limit 10