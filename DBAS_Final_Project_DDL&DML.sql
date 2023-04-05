/*To register a Candidate*/
/*The # refers to a number the admin will add based 
on how many candidates are in the db*/
BEGIN TRANSACTION;
INSERT INTO CandidateInfo
VALUES ('CAND#', 'First Name', 'Last Name', 'Organization');
ROLLBACK;
COMMIT;

/*If the candidate does not have an associated organization*/
BEGIN TRANSACTION;
INSERT INTO CandidateInfo (candidate_id, f_name, l_name)
VALUES ('CAND#', 'First Name', 'Last Name');
ROLLBACK;
COMMIT;

/*To register a new voter*/
BEGIN TRANSACTION;
INSERT INTO VoterInfo
VALUES ('V###', 'First Name', 'Last Name', age);
ROLLBACK;
COMMIT;
/*RUN THE ABOVE CODE BEFORE ADDING THE VOTER ADDRESS*/

/*If the voter has an address with an apartment number*/
BEGIN TRANSACTION;
INSERT INTO Address (address_id, voter_id, street_num, street_name, apt_num, city, postal_code)
VALUES ('AD###', 'V###', street_num, 'Street Name', apt_num, 'City', 'Postal Code');
ROLLBACK;
COMMIT;

/*If the voter does NOT have an address with an apartment number*/
BEGIN TRANSACTION;
INSERT INTO Address (address_id, voter_id, street_num, street_name, city, postal_code)
VALUES ('AD###', 'V###', street_num, 'Street Name', 'City', 'Postal Code');
ROLLBACK;
COMMIT;

/*To make changes to existing Candidate Information*/
/*You do not need to update all the values in the given axample. Delete the columns you 
do not wish to change*/
BEGIN TRANSACTION;
UPDATE CandidateInfo
SET f_name = 'new name', l_name = 'new name', organization = 'new orgnaization'
WHERE candidate_id = 'CAND#';
ROLLBACK;
COMMIT;

/*To make changes to existing Voter Information*/
/*You do not need to update all the values in the given axample. Delete the columns you 
do not wish to change*/
BEGIN TRANSACTION;
UPDATE VoterInfo
SET f_name = 'new name', l_name = 'new name', age = new_age
WHERE voter_id = 'V###';
ROLLBACK;
COMMIT;

/*To make changes to user login credentials*/
/*You do not need to update all the values in the given axample. Delete the columns you 
do not wish to change*/
BEGIN TRANSACTION;
UPDATE VoterLogin
SET voter_email = 'new email', voter_password = 'new password'
WHERE voter_id = 'V###';
ROLLBACK;
COMMIT;

/*To delete a voter*/
BEGIN TRANSACTION;
DELETE FROM Address 
WHERE voter_id = desired voter_id;
ROLLBACK;
COMMIT;

BEGIN TRANSACTION;
DELETE FROM VoterLogin 
WHERE voter_id = desired voter_id;
ROLLBACK;
COMMIT;

BEGIN TRANSACTION;
DELETE FROM VoterInfo 
WHERE voter_id = desired voter_id;
ROLLBACK;
COMMIT;

/*To delete a candidate*/
BEGIN TRANSACTION;
DELETE FROM CandidateInfo 
WHERE candidate_id = desired candidate_id;
ROLLBACK;
COMMIT;

/*To delete ALL voters and candidates*/
BEGIN TRANSACTION;
DELETE FROM CandidateInfo;
SAVE TRANSACTION Save1;
DELETE FROM Address WHERE admin_id = null;
SAVE TRANSACTION Save2;
DELETE FROM VoterLogin;
SAVE TRANSACTION Save3;
DELETE FROM VoterInfo;
SAVE TRANSACTION Save4;
DELETE FROM Votes;
SAVE TRANSACTION Save5;
ROLLBACK TRANSACTION Save1;
COMMIT;

/*Creation of Views*/
/*To count the number of times each candidate_id appears in the Votes table*/
CREATE VIEW NumOfVotes AS
SELECT candidate_id AS Candidate, COUNT(candidate_id) AS TotalVotes
FROM Votes
GROUP BY candidate_id;

/*To view the number of votes per candidate with names included*/
CREATE VIEW NumVoteswNames AS
SELECT CandidateInfo.f_name, CandidateInfo.l_name, CandidateInfo.organization, NumOfVotes.TotalVotes
FROM CandidateInfo
INNER JOIN NumOfVotes ON CandidateInfo.candidate_id = NumOfVotes.Candidate;

/*To fetch the top two candidates*/
SELECT TOP 2 *
FROM NumVoteswNames
Order By TotalVotes DESC;

/*To fetch the bottom candidate*/
SELECT TOP 1 *
FROM NumVoteswNames
Order By TotalVotes;

/*To fetch candidates who receive 5 to 15 votes*/
SELECT *
FROM NumVoteswNames
WHERE TotalVotes BETWEEN 5 AND 15
Order By TotalVotes DESC;

/*To fetch all votes for each candidate*/
SELECT *
FROM NumVoteswNames
ORDER BY TotalVotes DESC;

/*To fetch the top candidate*/
SELECT TOP 1 *
FROM NumVoteswNames
Order By TotalVotes DESC;
