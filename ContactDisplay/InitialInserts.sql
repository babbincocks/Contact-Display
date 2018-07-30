USE Sandbox

CREATE TABLE ContactInfo
(
ContactID INT NOT NULL IDENTITY(1,1),
Name VARCHAR(50) NOT NULL,
Address1 VARCHAR(50) NOT NULL,
Address2 VARCHAR(50) NULL,
City VARCHAR(40) NOT NULL,
Phone VARCHAR(15) NOT NULL,
Email VARCHAR(65) NULL

CONSTRAINT PK_Contact PRIMARY KEY (ContactID)
)

INSERT ContactInfo (Name, Address1, Address2, City, Phone, Email)
VALUES('Shipiffany', '1244 Watula Ave.', NULL, 'Brimbia', '1-467-223-5572', NULL), 
('Krusty Kruck', '89 Tootaloo Ln.', NULL, 'Brimbia', '1-467-423-5411', NULL),
('Edgar Vautrine', '12 Market Way', NULL, 'Imperial City', '1-400-739-8487', 'cheapspellsquick@tamriel.com')

GO
CREATE PROC [dbo].[sp_InsertContact]
(@Name VARCHAR(50), @Address1 VARCHAR(50), @Address2 VARCHAR(50) = null, @City VARCHAR(40), @Phone VARCHAR(15), @Email VARCHAR(65) = null)
AS
BEGIN
INSERT ContactInfo
VALUES (@Name, @Address1, @Address2, @City, @Phone, @Email)
END

