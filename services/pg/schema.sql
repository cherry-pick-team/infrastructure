CREATE TABLE album(
        id      SERIAL  NOT NULL PRIMARY KEY,
        title   varchar(100)    NOT NULL,
        cover_id        varchar(50) NOT NULL,
        year    int NOT NULL,
        created_at      timestamp with time zone default(now()));

CREATE TABLE songs(
	id	SERIAL	NOT NULL PRIMARY KEY,
	author 	text	NOT NULL,
	title 	text	NOT NULL,
	lyrics 	text	NOT NULL,
	file_id	varchar(50)	NOT NULL,
        video_link	varchar(250)     NOT NULL,
        itunes_id	varchar(250)     NOT NULL,
	created_at	timestamp with time zone default(now()),
	album_id	int REFERENCES album);

CREATE TABLE transcription(
	id	SERIAL  NOT NULL PRIMARY KEY,
	songId 	int REFERENCES songs,
	start_time_ms	int NOT NULL,
	end_time_ms	int NOT NULL,
	phrase	text	NOT NULL,
	created_at	timestamp with time zone default(now()));

CREATE TABLE song_history(
	id	SERIAL  NOT NULL PRIMARY KEY,
	songId 	int REFERENCES songs,
	created_at	timestamp with time zone default(now()));

CREATE TABLE query_history(
	id	SERIAL  NOT NULL PRIMARY KEY,
	query 	text	NOT NULL,
	created_at	timestamp with time zone default(now()));

CREATE TABLE song_likes(
	id  SERIAL  NOT NULL PRIMARY KEY,
	song_id integer NOT NULL,
	user_id integer NOT NULL,
	created_at  timestamp with time zone default(now()));

CREATE UNIQUE INDEX uniq_songs ON songs (author, title);

