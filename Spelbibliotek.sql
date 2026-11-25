CREATE DATABASE Spelbibliotek
GO

USE Spelbibliotek
GO

CREATE TABLE Utvecklare(
	Id INT IDENTITY PRIMARY KEY,
	Namn NVARCHAR(50),
	Land NVARCHAR(50),
	Grundat INT
);

INSERT INTO Utvecklare (Namn, Land, Grundat)
VALUES
('Rockstar Games', 'USA', 1998),
('Electronic Arts', 'USA', 1982),
('PlayStation Studios', 'Japan', 1993),
('Xbox Game Studios', 'USA', 2000),
('Epic Games', 'USA', 1991),
('Activision Blizzard', 'USA', 2008);

--SELECT * FROM Utvecklare

CREATE TABLE Spel(
	Id INT IDENTITY PRIMARY KEY,
	Titel NVARCHAR(100),
	Genre NVARCHAR(50),
	Utgivningsår INT,
	UtvecklareId INT FOREIGN KEY REFERENCES Utvecklare(Id)
);

INSERT INTO Spel (Titel, Genre, Utgivningsår, UtvecklareId)
VALUES
('Grand Theft Auto V', 'Action/Äventyr', 2013, 1),
('Grand Theft Auto: San Andreas', 'Action/Äventyr', 2004, 1),
('Red Dead Redemption', 'Action/Äventyr', 2010, 1),
('FIFA 16', 'Sport', 2015, 2),
('Madden NFL 16', 'Sport', 2015, 2),
('The Sims 4', 'Simulering', 2014, 2),
('The Last of Us', 'Action/Äventyr', 2013, 3),
('Marvel''s Spider-Man 2', 'Action/Äventyr', 2023, 3),
('Horizon Zero Dawn', 'Action/Rollspel', 2017, 3),
('Halo: Combat Evolved', 'Förstapersonsskjutare', 2001, 4),
('Forza Horizon 5', 'Racing', 2021, 4),
('Minecraft', 'Sandlåda', 2011, 4),
('Fortnite', 'Battle royale', 2017, 5),
('Rocket League', 'Sport/Racing', 2015, 5),
('Fall Guys', 'Party/Plattform', 2020, 5),
('Call of Duty: Modern Warfare 2', 'Förstapersonsskjutare', 2009, 6),
('World of Warcraft', 'MMORPG', 2004, 6),
('Overwatch', 'Förstapersonsskjutare', 2016, 6);

--SELECT * FROM Spel

--Visar varje spel med utvecklare och utgivningsår (JOIN kopplar ihop tabellerna via UtvecklareId)
--SELECT S.Titel, U.Namn AS Utvecklare, S.Utgivningsår
--FROM 
--	Spel S 
--JOIN 
--	Utvecklare U
--ON
--	S.UtvecklareId = U.Id

--Räknar hur många spel varje utvecklare har, flest först (COUNT + GROUP BY)
--SELECT U.Namn, COUNT(S.Id) AS AntalSpel
--FROM 
--	Spel S 
--JOIN 
--	Utvecklare U
--ON
--	S.UtvecklareId = U.Id
--GROUP BY 
--	U.Namn
--ORDER BY 
--	AntalSpel DESC

--Visar bara spel som kom ut efter 2015, äldst först (WHERE filtrerar)
--SELECT S.Titel, U.Namn AS Utvecklare, S.Utgivningsår
--FROM 
--	Spel S
--JOIN 
--	Utvecklare U 
--ON
--	S.UtvecklareId = U.Id
--WHERE 
--	S.Utgivningsår > 2015
--ORDER BY 
--	S.Utgivningsår

--Visar en rad per utvecklare med alla spel i en lista, med | emellan (STRING_AGG)
--SELECT U.Namn AS Utvecklare, STRING_AGG(S.Titel, ' | ') AS Spel
--FROM 
--	Spel S 
--JOIN 
--	Utvecklare U
--ON
--	S.UtvecklareId = U.Id
--GROUP BY 
--	U.Namn

-- Test: lägg till Nintendo (inget spel) och se att LEFT JOIN visar 0
--INSERT INTO Utvecklare (Namn, Land, Grundat)
--VALUES ('Nintendo', 'Japan', 1889);

--LEFT JOIN visar alla utvecklare, även de utan spel (de får 0)
--SELECT U.Namn, COUNT(S.Id) AS AntalSpel
--FROM 
--	Utvecklare U
--LEFT JOIN 
--	Spel S 
--ON 
--	S.UtvecklareId = U.Id
--GROUP BY 
--	U.Namn
--ORDER BY 
--	AntalSpel DESC

--Test: Tar bort Nintendo från Utvecklare, funkar eftersom Nintendo har 0 spel
--DELETE FROM Utvecklare
--WHERE Namn = 'Nintendo'

--Kontrollera att Nintendo är borta
--SELECT * FROM Utvecklare