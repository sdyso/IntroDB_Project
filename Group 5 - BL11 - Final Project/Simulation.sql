-- NAMA ANGGOTA : 
-- 2540134810 - Jonathan Christian
-- 2501960940 - Howie Ciuputra
-- 2540128152 - Louis Ignatius

--Rental Transaction Process

-- First
--Customers come to the showroom and want to rent a car along with the specifications and prices of the cars.
--customer that wants to purchase a product must already completed personal information like name, email, gender, address, and phone number.

USE JFAutomobile
GO

select
CarName,
CarPrice,
EngineCapacity,
SeatCapacity,
AvailabilityStatus,
BrandName
from CarRental cr
join CarBrand cb on cb.BrandID = cr.BrandID
ORDER BY AvailabilityStatus DESC

-- Second
-- If it matches then he will carry out the rent process, in which the staff will ask and fill in the customer's personal data such as customerID, name, gender, email, phone number, and address. Meanwhile, if it doesn't match, the customer will leave the showroom
INSERT INTO Customer VALUES 
('CS-016', 'Shawn Michaels', 'ShawnMike@yellowpages.com', 'Male', '29 Melvin Point', '+628122566789');

-- Third
-- After that, the Staff will fill in the data needed to make a Rent Transaction such as TransactionID, StaffID, CustomerID, CarID, StartDate, ReturnDate and Distance Traveled

INSERT INTO [RentalTransaction] VALUES
('TR-012', 'SF-007', 'CS-001', 'CR-001', '2022-11-10', '2022-11-13', '100');


--Service Transaction process

--First
-- Staff will talk to the in charge mechanic and the mechanic need to fill the data such as MechanicID, name, gender, email, phone number, and address
INSERT INTO Mechanic VALUES
('MC-016', 'Mike Wazouski', 'MikeAsep@gmail.com', 'Male', '201 Surrey Pass street', '+62816785833');


--Second
-- Staff will give the car to the mechanic for services

select
mc.mechanicID,
MechanicName,
cr.CarID,
CarName,
cb.BrandName,
EngineCapacity,
SeatCapacity
from Staff sf
join ServiceTransaction st on st.StaffID = sf.StaffID
join Mechanic mc on mc.MechanicID = st.MechanicID
join CarRental cr on cr.CarID = st.CarID
join CarBrand cb on cb.BrandID = cr.BrandID

--Third
-- The mechanic will give the service information to the staff

INSERT INTO CarService VALUES
('SV-011', 'Ganti Ban', '500000')

INSERT INTO ServiceTransaction VALUES
('TS-011', 'SF-006', 'MC-010', 'SV-011','CR-001', '2022-10-29');