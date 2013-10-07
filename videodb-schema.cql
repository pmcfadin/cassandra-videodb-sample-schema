CREATE KEYSPACE videodb WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

use videodb;

// Basic entity table for a user
// Includes a LIST of email addresses
CREATE TABLE users (
   username varchar,
   firstname varchar,
   lastname varchar,
   email list<varchar>,
   password varchar,
   created_date timestamp,
   PRIMARY KEY (username)
);

//  Entity table that will store many videos for a unique user
CREATE TABLE videos (
   videoid uuid,
   videoname varchar,
   username varchar,
   description varchar,
   location map<varchar,varchar>,
   tags set<varchar>,
   upload_date timestamp,
   PRIMARY KEY (videoid)
);

// One-to-many from the user point of view
// Also know as a lookup table
CREATE TABLE username_video_index (
   username varchar,
   videoid uuid,
   upload_date timestamp,
   videoname varchar,
   PRIMARY KEY (username,upload_date,videoid)
) WITH CLUSTERING ORDER BY (upload_date DESC);

// Counter table
CREATE TABLE video_rating (
   videoid uuid,
   rating_counter counter,
   rating_total counter,
   PRIMARY KEY (videoid)
);

// Creating index tables for tab keywords
CREATE TABLE tag_index (
   tag varchar, 
   videoid uuid,
   tag_ts timestamp,
   PRIMARY KEY (tag, videoid)
);

// Comments as a many-to-many 
// Looking from the video side to many users
CREATE TABLE comments_by_video (
   videoid uuid,
   username varchar,
   comment_ts timeuuid,
   comment varchar,
   PRIMARY KEY (videoid,comment_ts,username)
) WITH CLUSTERING ORDER BY (comment_ts DESC, username ASC);

// looking from the user side to many videos
CREATE TABLE comments_by_user (
   username varchar,
   videoid uuid,
   comment_ts timeuuid,
   comment varchar,
   PRIMARY KEY (username,comment_ts,videoid)
) WITH CLUSTERING ORDER BY (comment_ts DESC, videoid ASC);


// Time series wide row with reverse comparator
CREATE TABLE video_event (
   videoid uuid,
   username varchar,
   event varchar,
   event_timestamp timeuuid,
   video_timestamp bigint,
   PRIMARY KEY ((videoid,username),event_timestamp,event)
) WITH CLUSTERING ORDER BY (event_timestamp DESC,event ASC);



