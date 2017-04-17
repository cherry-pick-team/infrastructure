CREATE TABLE songs(
	id	SERIAL	NOT NULL PRIMARY KEY,
	author 	varchar(100)	NOT NULL,
	title 	varchar(100)	NOT NULL,
	lyrics 	varchar(5000)	NOT NULL,
	file_id	varchar(50)	NOT NULL,
	genius_id int UNIQUE NOT NULL ,
	created_at	timestamp with time zone default(now()));

CREATE TABLE transcription(
	id	SERIAL  NOT NULL PRIMARY KEY,
	songId 	int REFERENCES songs,
	start_time_ms	int NOT NULL,
	end_time_ms	int NOT NULL,
	phrase	varchar(250)	NOT NULL,
	created_at	timestamp with time zone default(now()));
