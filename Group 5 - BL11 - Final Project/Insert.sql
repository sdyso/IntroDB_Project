-- NAMA ANGGOTA : 
-- 2540134810 - Jonathan Christian
-- 2501960940 - Howie Ciuputra
-- 2540128152 - Louis Ignatius

USE JFAutomobile

INSERT INTO Staff VALUES 
('SF-001', 'Dirk Titterell', 'dtitterell0@yellowpages.com', 'Male', '74 Melvin Point', '+628123456789'),
('SF-002', 'Dukey Diano', 'ddiano1@state.com', 'Male', '92 Sugar Alley', '+628134567890'),
('SF-003', 'Alex Meekins', 'ameekins2@blogs.com', 'Male', '577 Dovetail Park', '+628145678901'),
('SF-004', 'Cherice Jermey', 'cjermey3@guardian.com', 'Female', '811 Debs Street', '+628156789012'),
('SF-005', 'Ingamar Carlin', 'icarlin4@shareasale.com', 'Male', '389 Surrey Pass', '+628167890123'),
('SF-006', 'Pooh McSTtcheon', 'pmcSTtcheon5@salon.com', 'Male', '7 Melby Trail', '+628178901234'),
('SF-007', 'Silvain Jozsa', 'sjozsa6@omniture.com', 'Female', '19269 Maryland Hill', '+628189012345'),
('SF-008', 'Javier Drewson', 'jdrewson7@home.com', 'Female', '8 Moulton Point', '+628190123456'),
('SF-009', 'Wilbur Francino', 'wfrancino8@wunderground.com', 'Female', '21840 Golden Leaf Avenue', '+628101234567'),
('SF-010', 'Sadie Snow', 'ssnow9@github.com', 'Female', '70 Eagle Crest Hill', '+628112345678'),
('SF-011', 'Sofie Carmen', 'scarmena@gov.com', 'Female', '20196 Springview Plaza', '+628212345678'),
('SF-012', 'Amy Grenkov', 'agrenkovb@aol.com', 'Male', '2263 Weeping Birch Center', '+628223456789'),
('SF-013', 'Gabriela Scarf', 'gscarfc@skype.com', 'Female', '920 Bobwhite Trail', '+628234567890'),
('SF-014', 'Westley Boram', 'wboramd@sun.com', 'Female', '47 Darwin Terrace', '+628245678901'),
('SF-015', 'Hadleigh Playfoot', 'hplayfoote@msu.com', 'Female', '49 6th Junction', '+628256789012');

INSERT INTO Customer VALUES 
('CS-001', 'Dirk Titterell', 'dtitterell0@yellowpages.com', 'Male', '74 Melvin Point', '+628123456789'),
('CS-002', 'Dukey Diano', 'ddiano1@CUate.com', 'Male', '92 Sugar Alley', '+628134567890'),
('CS-003', 'Alex Meekins', 'ameekins2@blogs.com', 'Male', '577 Dovetail Park', '+628145678901'),
('CS-004', 'Cherice Jermey', 'cjermey3@guardian.com', 'Female', '811 Debs CUreet', '+628156789012'),
('CS-005', 'Ingamar Carlin', 'icarlin4@shareasale.com', 'Male', '389 Surrey Pass', '+628167890123'),
('CS-006', 'Pooh McCUtcheon', 'pmcCUtcheon5@salon.com', 'Male', '7 Melby Trail', '+628178901234'),
('CS-007', 'Silvain Jozsa', 'sjozsa6@omniture.com', 'Female', '19269 Maryland Hill', '+628189012345'),
('CS-008', 'Javier Drewson', 'jdrewson7@home.com', 'Female', '8 Moulton Point', '+628190123456'),
('CS-009', 'Wilbur Francino', 'wfrancino8@wunderground.com', 'Female', '21840 Golden Leaf Avenue', '+628101234567'),
('CS-010', 'Sadie Snow', 'ssnow9@github.com', 'Female', '70 Eagle CreCU Hill', '+628112345678'),
('CS-011', 'Sofie Carmen', 'scarmena@gov.com', 'Female', '20196 Springview Plaza', '+628212345678'),
('CS-012', 'Amy Grenkov', 'agrenkovb@aol.com', 'Male', '2263 Weeping Birch Center', '+628223456789'),
('CS-013', 'Gabriela Scarf', 'gscarfc@skype.com', 'Female', '920 Bobwhite Trail', '+628234567890'),
('CS-014', 'WeCUley Boram', 'wboramd@sun.com', 'Female', '47 Darwin Terrace', '+628245678901'),
('CS-015', 'Hadleigh Playfoot', 'hplayfoote@msu.com', 'Female', '49 6th Junction', '+628256789012');

INSERT INTO CarBrand VALUES
('CB-001', 'Toyota', 'Japan'),
('CB-002', 'Mazda', 'Japan'),
('CB-003', 'Honda', 'Japan'),
('CB-004', 'Nissan', 'Japan'),
('CB-005', 'Suzuki', 'Japan'),
('CB-006', 'Subaru', 'Japan'),
('CB-007', 'Volkswagen', 'German'),
('CB-008', 'Mercedes-Benz', 'German'),
('CB-009', 'Audi', 'German'),
('CB-010', 'BMW', 'German'),
('CB-011', 'Porsche', 'German'),
('CB-012', 'Tesla', 'United States'),
('CB-013', 'Ford', 'United States'),
('CB-014', 'Chevrolet', 'United States'),
('CB-015', 'Jeep', 'United States');

INSERT INTO CarRental VALUES 
('CR-001', 'CB-001', 'Kijang Innova', '2500', '6', '2000', '1'),
('CR-002', 'CB-008', 'Mercedes C-Class', '4000', '4', '2500', '1'),
('CR-003', 'CB-005', 'Ertiga', '2000', '5', '2000', '1'),
('CR-004', 'CB-010', 'BMW X3', '3500', '5', '3000', '0'),
('CR-005', 'CB-002', 'RX-8', '3000', '4', '3000', '1'),
('CR-006', 'CB-006', 'BRZ', '3500', '2', '3000', '1'),
('CR-007', 'CB-011', 'Panamera', '3500', '4', '3000', '0'),
('CR-008', 'CB-004', 'Juke', '2000', '5', '2000', '1'),
('CR-009', 'CB-015', 'Wrangler', '4000', '6', '3000', '0'),
('CR-010', 'CB-013', 'Focus RS', '3000', '4', '2500', '1'),
('CR-011', 'CB-003', 'Civic RS', '3000', '4', '2500', '0'),
('CR-012', 'CB-007', 'Beetle', '3000', '4', '2000', '1'),
('CR-013', 'CB-009', 'Q3', '3000', '4', '2500', '1'),
('CR-014', 'CB-012', 'Model S', '4000', '4', '1000', '0'),
('CR-015', 'CB-014', 'Camaro', '3500', '2', '2500', '1');

INSERT INTO Mechanic VALUES 
('MC-001', 'Dirk Titterell', 'dtitterell0@yellowmail.com', 'Male', '74 Melvin Point street', '+628123456789'),
('MC-002', 'Dukey Diano', 'ddiano1@gmail.com', 'Male', '92 Sugar Alley street', '+628134567890'),
('MC-003', 'Alex Meekins', 'ameekins2@gmail.com', 'Male', '577 Dovetail Park street', '+628145678901'),
('MC-004', 'Cherice Jermey', 'cjermey3@gmail.com', 'Female', '811 Debs street', '+628156789012'),
('MC-005', 'Ingamar Carlin', 'icarlin4@gmail.com', 'Male', '389 Surrey Pass street', '+628167890123'),
('MC-006', 'Pooh McCUtcheon', 'pmcCUtcheon5@gmail.com', 'Male', '7 Melby Trail street', '+628178901234'),
('MC-007', 'Silvain Jozsa', 'sjozsa6@gmail.com', 'Female', '19269 Maryland Hill street', '+628189012345'),
('MC-008', 'Javier Drewson', 'jdrewson7@gmail.com', 'Female', '8 Moulton Point street', '+628190123456'),
('MC-009', 'Wilbur Francino', 'wfrancino8@gmail.com', 'Female', '21840 Golden Leaf Avenue street', '+628101234567'),
('MC-010', 'Sadie Snow', 'ssnow9@gmail.com', 'Female', '70 Eagle CreCU Hill street', '+628112345678'),
('MC-011', 'Sofie Carmen', 'scarmena@gmail.com', 'Female', '20196 Springview Plaza street', '+628212345678'),
('MC-012', 'Amy Grenkov', 'agrenkovb@gmail.com', 'Male', '2263 Weeping Birch Center street', '+628223456789'),
('MC-013', 'Gabriela Scarf', 'gscarfc@gmail.com', 'Female', '920 Bobwhite Trail street', '+628234567890'),
('MC-014', 'WeCUley Boram', 'wboramd@gmail.com', 'Female', '47 Darwin Terrace street', '+628245678901'),
('MC-015', 'Hadleigh Playfoot', 'hplayfoote@gmail.com', 'Female', '49 6th Junction street', '+628256789012');

INSERT INTO CarService VALUES
('SV-001', 'Tambal Ban', '500000'),
('SV-002', 'Servis Mesin', '1000000'),
('SV-003', 'Ganti Rem', '800000'),
('SV-004', 'Ganti Aki', '350000'),
('SV-005', 'Pasang Lampu', '500000'),
('SV-006', 'Pasang Power Audio', '300000'),
('SV-007', 'Cuci Mobil', '300000'),
('SV-008', 'Ganti Bumper', '400000'),
('SV-009', 'Cat Mobil', '650000'),
('SV-010', 'Ganti Busi', '600000');

INSERT INTO ServiceTransaction VALUES
('TS-001', 'SF-006', 'MC-010', 'SV-001','CR-006', '2022-10-29'),
('TS-002', 'SF-006', 'MC-009', 'SV-002','CR-002', '2022-10-30'),
('TS-003', 'SF-006', 'MC-008', 'SV-003','CR-012', '2022-11-01'),
('TS-004', 'SF-006', 'MC-007', 'SV-004','CR-001', '2022-11-02'),
('TS-005', 'SF-005', 'MC-006', 'SV-005','CR-005', '2022-11-03'),
('TS-006', 'SF-004', 'MC-005', 'SV-006','CR-003', '2022-11-05'),
('TS-007', 'SF-012', 'MC-004', 'SV-007','CR-008', '2022-11-07'),
('TS-008', 'SF-015', 'MC-003', 'SV-008','CR-010', '2022-11-09'),
('TS-009', 'SF-011', 'MC-002', 'SV-009','CR-015', '2022-11-10'),
('TS-010', 'SF-002', 'MC-001', 'SV-010','CR-013', '2022-11-11');

INSERT INTO [RentalTransaction] VALUES
('TR-001', 'SF-007', 'CS-001', 'CR-001', '2022-06-18', '2022-06-30', '100'),
('TR-002', 'SF-007', 'CS-001', 'CR-005', '2022-06-18', '2022-07-01', '60'),
('TR-003', 'SF-013', 'CS-003', 'CR-015', '2022-07-12', '2022-07-25', '90'),
('TR-004', 'SF-001', 'CS-003', 'CR-015', '2022-07-17', '2022-07-30', '95'),
('TR-005', 'SF-005', 'CS-005', 'CR-003', '2022-08-21', '2022-08-30', '95'),
('TR-006', 'SF-011', 'CS-006', 'CR-002', '2022-09-15', '2022-09-21', '65'),
('TR-007', 'SF-014', 'CS-007', 'CR-010', '2022-10-01', '2022-10-18', '70'),
('TR-008', 'SF-012', 'CS-008', 'CR-008', '2022-10-02', '2022-10-20', '90'),
('TR-009', 'SF-002', 'CS-009', 'CR-013', '2022-11-13', '2022-11-20', '50'),
('TR-010', 'SF-010', 'CS-010', 'CR-012', '2022-11-12', '2022-11-22', '80'),
('TR-011', 'SF-009', 'CS-011', 'CR-015', '2022-01-01', '2022-09-02', '50');

INSERT INTO RentalTransactionDetail VALUES
('TR-001', 'CR-001'),
('TR-001', 'CR-011'),
('TR-002', 'CR-005'),
('TR-002', 'CR-009'),
('TR-003', 'CR-015'),
('TR-004', 'CR-015'),
('TR-005', 'CR-003'),
('TR-006', 'CR-002'),
('TR-007', 'CR-010'),
('TR-008', 'CR-008'),
('TR-009', 'CR-013'),
('TR-010', 'CR-012'),
('TR-011', 'CR-015')