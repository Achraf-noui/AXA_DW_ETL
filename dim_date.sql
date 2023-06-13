SET LANGUAGE 'French';

drop table if exists dim_date;

CREATE TABLE dim_date
(
    date_id INT PRIMARY KEY,
    [date] DATE,
    annee INT,
    trimestre INT,
    mois INT,
    jour INT,
    jour_semaine INT,
    lib_jour NVARCHAR(20),
    jour_mois INT,
    jour_annee INT,
    semaine_annee INT,
    lib_mois NVARCHAR(20),
    lib_trimestre NVARCHAR(20),
    IsWeekend varchar(15)
);

-- Generate and populate the date dimension
DECLARE @StartDate DATE = '2013-01-01';
DECLARE @EndDate DATE = '2050-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO dim_date (date_id, date, annee, trimestre, mois, jour, jour_semaine, lib_jour, 
	jour_mois, jour_annee, semaine_annee, lib_mois, lib_trimestre, IsWeekend)
    VALUES (
        CONVERT(INT, FORMAT(@StartDate, 'yyyyMMdd')),
        @StartDate,
        YEAR(@StartDate),
        DATEPART(QUARTER, @StartDate),
        MONTH(@StartDate),
        DAY(@StartDate),
        DATEPART(WEEKDAY, @StartDate),
        DATENAME(WEEKDAY, @StartDate),
        DAY(@StartDate),
        DATEPART(DAYOFYEAR, @StartDate),
        DATEPART(WEEK, @StartDate),
        DATENAME(MONTH, @StartDate),
        'Trimestre ' + CAST(DATEPART(QUARTER, @StartDate) AS NVARCHAR(2)),
        CASE WHEN DATEPART(WEEKDAY, @StartDate) IN (1, 7) THEN 'Weekend' ELSE 'Non-weekend' END
    );
    
    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END

select * from dim_date;