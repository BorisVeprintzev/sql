Select tmp2."companyName" From (
	Select tmp."companyName", Max(tmp.count) as ma From
	(
		Select "Employers"."companyName", count("Responds".*) From "Employers"
			join "Responds" on "Responds"."idEmp" =  "Employers"."idCompany"
				Group by "Employers"."companyName"
	) as tmp
	Group by tmp."companyName"
) as tmp2
	Order by ma desc, tmp2."companyName"
	limit 5;