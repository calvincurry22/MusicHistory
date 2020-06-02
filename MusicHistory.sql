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
LEFT JOIN Song ON song.AlbumId = Album.Id
WHERE song.AlbumId IS NULL


