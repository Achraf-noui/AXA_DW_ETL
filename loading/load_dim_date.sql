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

--select * from dim_date;

-- Date echeance table ===============================

drop table if exists dim_date_effective;

create table dim_date_effective(
date_eff_id INT PRIMARY KEY, 
date_eff DATE, 
annee_eff INT, 
trimestre_eff INT,
mois_eff INT,
jour_eff INT,
jour_semaine_eff INT,
lib_jour_eff NVARCHAR(20),
jour_mois_eff int,
jour_annee_eff int,
semaine_annee_eff int,
lib_mois_eff NVARCHAR(20),
lib_trimestre_eff NVARCHAR(20),
IsWeekend_eff varchar(15)
);

insert into dim_date_effective
select * from dim_date;

select * from dim_date_effective;

-- Date echeance table ===============================

drop table if exists dim_date_echeance;

create table dim_date_echeance(
date_ech_id INT PRIMARY KEY, 
date_ech DATE, 
annee_ech INT, 
trimestre_ech INT,
mois_ech INT,
jour_ech INT,
jour_semaine_ech INT,
lib_jour_ech NVARCHAR(20),
jour_mois_ech int,
jour_annee_ech int,
semaine_annee_ech int,
lib_mois_ech NVARCHAR(20),
lib_trimestre_ech NVARCHAR(20),
IsWeekend_ech varchar(15)
);

insert into dim_date_echeance
select * from dim_date;

select count(*) from dim_date_echeance;

-- Date souscription table ===============================

drop table if exists dim_date_souscription;

create table dim_date_souscription(
date_sous_id INT PRIMARY KEY, 
date_sous DATE, 
annee_sous INT, 
trimestre_sous INT,
mois_sous INT,
jour_sous INT,
jour_semaine_sous INT,
lib_jour_sous NVARCHAR(20),
jour_mois_sous int,
jour_annee_sous int,
semaine_annee_sous int,
lib_mois_sous NVARCHAR(20),
lib_trimestre_sous NVARCHAR(20),
IsWeekend_sous varchar(15)
);

insert into dim_date_souscription
select * from dim_date;

select count(*) from dim_date_souscription;




