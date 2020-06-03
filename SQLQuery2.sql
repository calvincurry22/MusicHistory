SELECT
    [Id],
    [Label]
FROM Genre

SELECT
    [Id],
    [ArtistName],
    [YearEstablished]
FROM Artist
ORDER BY ArtistName

SELECT
    [Title],
    [ArtistName]
FROM Song
JOIN Artist artist ON artist.Id = Song.ArtistId


SELECT
	ArtistName,
	genre.Label
FROM Album album 
JOIN Artist artist ON artist.id = album.ArtistId
JOIN Genre genre ON genre.id = album.GenreId
WHERE genre.Label = 'Rock'
GROUP BY artist.ArtistName, genre.Label



SELECT
	ArtistName,
	genre.Label
FROM Album album 
JOIN Artist artist ON artist.id = album.ArtistId
JOIN Genre genre ON genre.id = album.GenreId
WHERE genre.Label = 'Rock' OR genre.Label = 'Rap'
GROUP BY artist.ArtistName, genre.Label


SELECT
	album.Title
FROM Album album
LEFT JOIN Song song ON song.AlbumId = Album.Id
WHERE song.AlbumId IS NULL

INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('A Tribe Called Quest', 1991)

SELECT
*
FROM Album

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
Values ('The Low End Theory', '9/24/1991', 2322, 'Jive Records', 28, 13) , ('Midnight Marauders', '11/9/1993', 2400, 'Jive Records', 28, 13)

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Check the Rhime', 217, '9/24/1991', 3, 28, 23),
('Electric Relaxation', 227, '11/9/1993', 3, 28, 24)

SELECT 
    ArtistName,
    album.Title,
    song.Title
FROM Artist
LEFT JOIN Album album ON Artist.Id = album.ArtistId
LEFT JOIN Song song ON album.Id = song.AlbumId
WHERE Artist.Id = 28


SELECT 
    album.Title AS AlbumTitle,
    COUNT(song.Title) AS SongCount
FROM Album
JOIN Song song ON album.Id = song.AlbumId
GROUP BY album.Title


SELECT
    ArtistName,
    COUNT(Title) AS SongCount
FROM Artist
JOIN Song ON Song.ArtistId = Artist.Id
GROUP BY ArtistName

SELECT
    ArtistName,
    COUNT(DISTINCT album.Label) AS Labels
FROM Artist
JOIN Album album ON album.ArtistId = Artist.Id
GROUP BY ArtistName
HAVING COUNT(DISTINCT album.Label) > 1;


SELECT 
    Title,
    AlbumLength
FROM Album
WHERE AlbumLength = (
    SELECT
        MAX(AlbumLength)
    FROM Album
)


SELECT
    song.Title AS SongTitle,
    SongLength,
    album.Title AS AlbumTitle
FROM Song song
JOIN Album album ON album.Id = song.AlbumId
WHERE SongLength = (
    SELECT
        MAX(SongLength)
    FROM Song
)
