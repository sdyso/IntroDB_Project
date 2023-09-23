-- NAMA ANGGOTA : 
-- 2540134810 - Jonathan Christian
-- 2501960940 - Howie Ciuputra
-- 2540128152 - Louis Ignatius


USE JFAutomobile

-- 1.	Display CarBrandCountry and Times Rent (obtained from the total number of different car is rented in one transaction) and ordered in descending by Time Rent for every rental transaction that starts in quarter 2 of 2022.

SELECT
	OriginCountry,
	[Times Rent] = COUNT(TransactionID)
FROM CarBrand cb
	join CarRental cr on cb.BrandID = cr.BrandID
	join [RentalTransaction] rt on cr.CarID = rt.CarID
WHERE DATEPART(QUARTER, StartDate) = 2
GROUP BY OriginCountry
ORDER BY [Times Rent] DESC

--2.	Display MechanicId, MechanicName, Email (obtained by replacing ‘mail.com’ with ‘mecha.com’), and Total Earning (obtained by adding ‘IDR ’ in front of the sum of the CarServicePrice) for every car service price that is greater than 300000 and the sum of car service price  is greater than 3000000.

SELECT
	mc.MechanicID,
	MechanicName,
	[Email] = REPLACE(MechanicEmail, 'mail.com', 'mecha.com'),
	[Total Earning] = CONCAT('IDR ', ServicePrice)
FROM Mechanic mc
join ServiceTransaction st on st.MechanicID = mc.MechanicID
join [CarService] cs on cs.CarServiceID = st.CarServiceID
where cs.ServicePrice > 300000

--3.	Display top 5 TransactionId and Total Distance (obtained from sum of distance) in descending for every rental transaction that starts in 2022 and have 2 different cars rent.

SELECT TOP(5)
	TransactionID,
	DistanceTraveled
FROM [RentalTransaction]
WHERE YEAR(StartDate) = '2022'


--4.	Display CarId, Car (obtained by adding “.” between CarBrandName and CarName), Country Code (obtained by adding the first and the last character of CarBrandCountry), and Time Rent (obtained from the total number of different car rented in one transaction) for every car that has a higher engine capacity than the average engine capacity of every car and Time Rent more than one. 

SELECT 
	CarID,
	[Car] = CONCAT(cb.BrandName, '.', CarName),
	[Country Code] = UPPER(concat(left(OriginCountry, 1), right(OriginCountry, 1))),
	[Time Rent] = COUNT(*)
FROM CarRental cr
	join CarBrand cb on cr.BrandID = cb.BrandID
Group by CarID, CarName, BrandName, OriginCountry


--5.	Display CarServiceName, Old Price (obtained from CarServicePrice), and New Price (obtained from CarServicePrice + AdditionalPrice). Additional price is determined by how many times a service is used on weekdays of 2022. Show the data by the biggest price increase in descending.
--(alias subquery)

SELECT
	CarServices,
	[Old Price] = ServicePrice,
	[New Price] = CASE WHEN subquery.[Total Services] < 5 then ((ServicePrice * 5/100) + ServicePrice)
		WHEN subquery.[Total Services] between 5 and 10 then ((ServicePrice * 10/100) + ServicePrice)
		WHEN subquery.[Total Services] > 10 then ((ServicePrice * 15/100) + ServicePrice) END
FROM CarService cs
	join ServiceTransaction st on cs.CarServiceID = st.CarServiceID,
(
	SELECT
		[Total Services] = COUNT(*)
	FROM ServiceTransaction
) as subquery
WHERE DATEPART(weekday, TransactionDate) between '2' and '6'
	and YEAR(TransactionDate) = '2022'
GROUP BY CarServices, ServicePrice, [Total Services]
ORDER BY MAX(ServicePrice) DESC



--6.	Display TransactionId, Customer Name (obtained from CustomerName in lowercase format), Start Date (obtained from StartDate in “mm dd, yyyy” format), CarId, and Transaction Price (obtained from total price multiply by distance) for every transaction that has a higher Transaction Price than the average Transaction Price of each car that is returned within 7 days.
--(alias subquery)

SELECT
	rt.TransactionID,
	[Customer Name] = LOWER(CustomerName),
	[Start Date] = CONVERT(nvarchar, StartDate, 101),
	cr.CarID,
	[Transaction Price] = (CarPrice * DistanceTraveled)
FROM Customer c
	join RentalTransaction rt on c.CustomerID = rt.CustomerID
	join RentalTransactionDetail rtd on rt.TransactionID = rtd.TransactionID
	join CarRental cr on rtd.CarID = cr.CarID
WHERE (CarPrice * DistanceTraveled)  > (
		SELECT 
			AVG(subquery1.[Transaction Price])
		FROM 
			RentalTransaction rt
			join RentalTransactionDetail rtd on rt.TransactionID = rtd.TransactionID
			join CarRental cr on rtd.CarID = cr.CarID,
		(
			SELECT
				[Transaction Price] = (CarPrice * DistanceTraveled)
			FROM RentalTransaction rt 
				join RentalTransactionDetail rtd on rt.TransactionID = rtd.TransactionID
				join CarRental cr on rtd.CarID = cr.CarID
			WHERE DATEDIFF(day, StartDate, ReturnDate) <= 7
		) as subquery1
	) 



--7.	Display Staff ID (obtained by replacing characters before ‘-‘ with “Employee”), First Name (obtained from the first word before space in StaffName), Total Handled Transaction (obtained from total number of service transactions), and Gained Service Fee (obtained from the sum of service fee per transaction (Transaction service fee is gained from the sum of 5% CarServicePrice)) for every staff whose gender is male and has handled at least 4 service transactions. 
--(alias subquery)

SELECT
	[Staff ID] = REPLACE(s.StaffID, 'SF', 'Employee'),
	[First Name] = LEFT(StaffName, CHARINDEX(' ', StaffName)),
	[Total Handled Transaction] = Count(*),
	[Gained Service Fee] = SUM(subquery1.TransactionFee)
FROM Staff s
	join ServiceTransaction st on s.StaffID = st.StaffID,
	(
		SELECT [TransactionFee] = SUM(ServicePrice * 5/100)
		FROM CarService
	) as subquery1
WHERE StaffGender like 'Male'
GROUP BY s.StaffID, StaffName
HAVING COUNT(*) >= 4



--8.	Display CustomerName, Customer Phone (obtained by replacing “+62” with “IDN - ”), Total Spent (obtained from the sum of rental transaction price (rental transaction price obtained by multiplying car price and distance)), Maximum Spent in 1 Transaction (obtained from the highest rental transaction price (rental transaction price obtained by multiplying car price and distance)), and Membership Status for every male customer who has a highest rental transaction price higher than 1500000. 
--(alias subquery)

SELECT
	CustomerName,
	[Customer Phone] = STUFF(CustomerPhone, 1, 3, 'IDN - '),
	[Total Spend] = SUM(CarPrice * DistanceTraveled),
	[Maximum Spend in 1 Transaction] = subquery2.[Highest Rental Transaction Price],
	[Membership Status] = case when SUM(CarPrice * DistanceTraveled) < 3000000 then 'Member'
		when SUM(CarPrice * DistanceTraveled) between 3000000 and 5000000 then 'Silver Member'
		when SUM(CarPrice * DistanceTraveled) >= 5000000 then 'Gold Member' end
FROM Customer c
	join RentalTransaction rt on c.CustomerID = rt.CustomerID
	join RentalTransactionDetail rtd on rt.TransactionID = rtd.TransactionID
	join CarRental cr on rtd.CarID = cr.CarID,
	(
		SELECT [Highest Rental Transaction Price] = MAX(subquery1.[Rental Transaction Price])
		FROM RentalTransaction rt,
			(
				SELECT [Rental Transaction Price] = SUM(CarPrice * DistanceTraveled)
				FROM RentalTransaction rt
					join RentalTransactionDetail rtd on rt.TransactionID = rtd.TransactionID
					join CarRental cr on rtd.CarID = cr.CarID
			) as subquery1
	) as subquery2
GROUP BY CustomerName, CustomerPhone, [Highest Rental Transaction Price]

		

--9.	Create a view named ViewMinAndMaxDistance that shows Min Distance (obtained from adding “ km”  after the minimum distance traveled in a rental transaction), Max Distance (obtained from adding “ km”  after the maximum distance traveled in a rental transaction) for rental transaction that starts in the first quarter of 2022.

GO
CREATE OR ALTER VIEW ViewMinAndMaxDistance as 
	SELECT
		[Min Distance] = CONCAT(MIN(DistanceTraveled), 'km'),
		[Max Distance] = CONCAT(MAX(DistanceTraveled), 'km')
	FROM RentalTransaction
	WHERE DATEPART(QUARTER, StartDate) = 1
		and YEAR(StartDate) = '2022'
GO
SELECT * FROM ViewMinAndMaxDistance



--10.	Create a view named ViewAverageShortRentalEarning that display Average Earning (obtained by adding “Rp. ” before the average of rental price multiply by quantity and “.-” after the average rental price) for every car that originates from Japan and has a rental duration less than equals to the minimum rental duration added by one in rental transaction.

GO
CREATE or ALTER VIEW ViewAverageShortRentalEarning as
	SELECT 
		DISTINCT [Average Earning] = CONCAT('Rp. ', AVG(CarPrice) * subquery1.Quantity, '.-')
	FROM RentalTransaction rt
		join RentalTransactionDetail rtd on rt.TransactionID = rtd.TransactionID
		join CarRental cr on rtd.CarID = cr.CarID
		join CarBrand cb on cr.BrandID = cb.BrandID,
		(
			SELECT
				[Quantity] = COUNT(*)
			FROM RentalTransaction
		) as subquery1,
		(
			SELECT
				[Rental Duration] = DATEDIFF(DAY, StartDate, ReturnDate)
			FROM RentalTransaction
		) as subquery2
	GROUP BY OriginCountry, [Rental Duration], Quantity	
	HAVING OriginCountry = 'Japan' 
		AND subquery2.[Rental Duration] <= MIN(subquery2.[Rental Duration]) + 1
	
GO

SELECT * FROM ViewAverageShortRentalEarning

	