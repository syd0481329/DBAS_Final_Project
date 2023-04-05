CREATE TABLE CandidateInfo(
candidate_id varchar(50) NOT NULL UNIQUE,
f_name varchar(100) NOT NULL,
l_name varchar(100) NOT NULL,
organization varchar(220),
PRIMARY KEY (candidate_id)
);

CREATE TABLE VoterInfo(
voter_id varchar(50) NOT NULL UNIQUE,
f_name varchar(100) NOT NULL,
l_name varchar(100) NOT NULL,
age int NOT NULL,
PRIMARY KEY (voter_id)
);

CREATE TABLE AdminInfo(
admin_id varchar(50) NOT NULL UNIQUE,
f_name varchar(100) NOT NULL,
l_name varchar(100) NOT NULL,
PRIMARY KEY (admin_id)
);

CREATE TABLE Address (
address_id varchar(50) NOT NULL PRIMARY KEY,
voter_id varchar(50),
admin_id varchar(50),
street_num int NOT NULL,
street_name varchar(100) NOT NULL,
apt_num int,
city varchar(50) NOT NULL,
postal_code varchar(10) NOT NULL,
);

CREATE TABLE VoterLogin (
voter_login_id int NOT NULL PRIMARY KEY,
voter_email varchar(200) NOT NULL,
voter_password varchar(200) NOT NULL UNIQUE,
voter_id varchar(50) NOT NULL UNIQUE
);

CREATE TABLE AdminLogin(
admin_login_id int NOT NULL PRIMARY KEY,
admin_email varchar(200) NOT NULL UNIQUE,
admin_password varchar(200) NOT NULL UNIQUE,
admin_id varchar(50) NOT NULL UNIQUE
);

CREATE TABLE Votes(
vote_id varchar(50) NOT NULL PRIMARY KEY,
voter_id varchar(50) NOT NULL UNIQUE,
candidate_id varchar(50) NOT NULL,
);

ALTER TABLE VoterLogin
ADD FOREIGN KEY (voter_id) REFERENCES VoterInfo(voter_id);

ALTER TABLE AdminLogin
ADD FOREIGN KEY (admin_id) REFERENCES AdminInfo(admin_id);

ALTER TABLE Votes
ADD FOREIGN KEY (voter_id) REFERENCES VoterInfo(voter_id),
FOREIGN KEY (candidate_id) REFERENCES CandidateInfo(candidate_id);

ALTER TABLE Address
ADD FOREIGN KEY (voter_id) REFERENCES VoterInfo(voter_id),
FOREIGN KEY (admin_id) REFERENCES AdminInfo(admin_id);

INSERT INTO CandidateInfo
VALUES ('CAND1', 'Bob', 'Belcher', 'Bobs Burgers'),
('CAND2', 'Spongebob', 'Squarepants', 'Krusty Krab'),
('CAND3', 'Remy', 'Therat', 'La Ratatouille'),
('CAND4', 'Luke', 'Danes', 'Lukes Diner');

INSERT INTO VoterInfo
VALUES ('V001', 'Linda', 'Belcher', 44),
('V002', 'Patrick', 'Star', 37),
('V003', 'Auguste', 'Gusteau', 45),
('V004', 'Rory', 'Gilmour', 24),
('V005', 'Lance', 'McCaine', 22),
('V006', 'Kevin', 'Schofield', 26),
('V007', 'Joy', 'Power', 62),
('V008', 'Julie', 'Peters', 47),
('V009', 'Topher', 'Katt', 32),
('V010', 'Nyla', 'Speedy', 19),
('V011', 'Jimmy', 'Pesto', 43),
('V012', 'Chris', 'Mass', 26),
('V013', 'Mario', 'Bro', 54),
('V014', 'Luigi', 'Bro', 42),
('V015', 'Shelley', 'Cake', 67);

INSERT INTO AdminInfo
VALUES ('A1', 'Sydney', 'Peters');

INSERT INTO Address (address_id, voter_id, street_num, street_name, apt_num, city, postal_code)
VALUES ('AD001', 'V001', 111, 'First', 2, 'Wolfville', '1A2 1A2'),
('AD002', 'V002', 123, 'Second', 76, 'Halifax', '2B3 2B3'),
('AD003', 'V003', 234, 'Third', 3, 'Kentville', '3C4 4D5'),
('AD004', 'V004', 345, 'Fourth', 12, 'New Minas', '4D5 5E6'),
('AD005', 'V005', 456, 'Fifth', 45, 'Wolfville', '5E6 6F7'),
('AD006', 'V006', 567, 'Sixth', 86, 'Halifax', '6F7 7G8'),
('AD007', 'V007', 678, 'Seventh', 90, 'Kentville', '7G8 8H9'),
('AD008', 'V008', 789, 'Eighth', 5, 'New Minas', '8H9 1J2'),
('AD009', 'V009', 890, 'Ninth', 7, 'Wolfville', '1J2 2K3'),
('AD010', 'V010', 098, 'Tenth', 9, 'Halifax', '2K3 3L4'),
('AD011', 'V011', 987, 'Eleventh', 1, 'Kentville', '3L4 4M5'),
('AD012', 'V012', 876, 'Twelfth', 4, 'New Minas', '4M5 5N6'),
('AD013', 'V013', 765, 'Thirteenth', 10, 'Wolfville', '6N7 7P8'),
('AD014', 'V014', 654, 'Fouteenth', 13, 'Halifax', '7P8 8Q9'),
('AD015', 'V015', 543, 'Fifteenth', 8, 'Kentville', '8Q9 1R2');

INSERT INTO Address (address_id, admin_id, street_num, street_name, apt_num, city, postal_code)
VALUES ('AD000', 'A1', 99, 'Main', 1, 'Wolfville', 'L1G 7C7');

INSERT INTO AdminLogin
VALUES (1, 'sample@email.com', 'password2023', 'A1');

INSERT INTO VoterLogin
VALUES (001, 'sample1000@email.com', 'abc123', 'V001'),
(002, 'sample1111@email.com', 'dogcat10', 'V002'),
(003, 'sample1222@email.com', 'pass10word', 'V003'),
(004, 'sample1333@email.com', 'login5678', 'V004'),
(005, 'sample1444@email.com', 'soccerstar87', 'V005'),
(006, 'sample1555@email.com', 'horselover45', 'V006'),
(007, 'sample1666@email.com', 'petname2', 'V007'),
(008, 'sample1777@email.com', '123456789', 'V008'),
(009, 'sample1888@email.com', 'votingpass', 'V009'),
(010, 'sample1999@email.com', 'wordpass', 'V010'),
(011, 'sample2000@email.com', 'user9265452', 'V011'),
(012, 'sample2111@email.com', 'plantlover55', 'V012'),
(013, 'sample2222@email.com', '12345abcde', 'V013'),
(014, 'sample2333@email.com', 'asdfghjkl', 'V014'),
(015, 'sample2444@email.com', 'zxcvbnm', 'V015');

INSERT INTO Votes (vote_id, voter_id)
VALUES ('VT111', 'V001'),
('VT112', 'V002'),
('VT113', 'V003'),
('VT114', 'V004'),
('VT115', 'V005'),
('VT116', 'V006'),
('VT117', 'V007'),
('VT118', 'V008'),
('VT119', 'V009'),
('VT120', 'V010'),
('VT121', 'V011'),
('VT122', 'V012'),
('VT123', 'V013'),
('VT124', 'V014'),
('VT125', 'V015');


/*Added to test db*/
INSERT INTO Votes (candidate_id)
VALUES ('CAND1'),
('CAND1'),
('CAND4'),
('CAND1'),
('CAND2'),
('CAND3'),
('CAND1'),
('CAND4'),
('CAND4'),
('CAND4'),
('CAND4'),
('CAND1'),
('CAND1'),
('CAND3'),
('CAND3');