use studydb;
show status;
CREATE TABLE SONG_MEMBER (
	MEMBER_ID INT NOT NULL auto_increment PRIMARY KEY
    ,MEMBER_NAME VARCHAR(20)
    ,MEMBER_PASSWORD VARCHAR(20)
	,MEMBER_GENDER VARCHAR(20)
    ,MEMBER_EMAIL1 VARCHAR(20)
    ,MEMBER_EMAIL2 VARCHAR(20)
	,MEMBER_TEL1 INT
	,MEMBER_TEL2 INT
	,MEMBER_TEL3 INT
    ,MEMBER_ADDRESS1 VARCHAR(40)
    ,MEMBER_ADDRESS2 VARCHAR(40)
    ,MEMBER_ZIPCODE INT
    ,MEMBER_TAG VARCHAR(80)
	,MEMBER_REGISTER_DATE DATE
);




CREATE TABLE SONG_LIST (
	SONG_ID INT NOT NULL auto_increment PRIMARY KEY
    ,SONG_NAME VARCHAR(20)
    ,SONG_ARTIST VARCHAR(20)
    ,SONG_ALBUM VARCHAR(20)
    ,SONG_TAG VARCHAR(80)
    ,SONG_TRAKNUM INT
    ,SONG_TITLEYN TINYINT
    ,SONG_ALBUMART VARCHAR(20)
    ,SONG_PLAYCOUNT INT
);


CREATE TABLE SONG_HASHTAG (
	TAG_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,TAG_NAME VARCHAR(20)
);

CREATE TABLE SONG_PLAYLIST (
	PLAYLIST_ID INT NOT NULL auto_increment primary KEY
    , SONG_ID VARCHAR(20)
    , MEMBER_ID VARCHAR(20)
    , PLAYLIST_NAME VARCHAR(40)
);


CREATE TABLE SONG_LIKE (
	MEMBER_ID VARCHAR(20)
    ,SONG_ID VARCHAR(20)
);

