Select Percentile_cont(0.5) within group(Order by tmp.count) From
(
	Select "Employers"."companyName", COUNT("Responds"."idVac") From 
		"Employers" join "Responds" on "Employers"."idCompany" = "Responds"."idEmp"
			Group by "Employers"."companyName"
) as tmp