/* Choose a song from Track table and insert into Track2 table, make yourself the composer */
insert into "Track2" ("TrackId", "Name", "AlbumId", "MediaTypeId", "GenreId", "Composer", "Milliseconds", "Bytes", "UnitPrice")
values
(87, 'Gasoline', 10, 1, 1, 'Jacob T', 279457, 6709793, 0.99);

/* Delete the original song from the track table */
delete from "Track" t
where t."Name" = 'Gasoline';
