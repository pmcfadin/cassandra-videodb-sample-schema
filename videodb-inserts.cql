//Users
INSERT INTO users (username, firstname, lastname, email, password, created_date) 
VALUES ('tcodd','Ted','Codd', ['tcodd@relational.com', 'ted.codd@relational.com'],'5f4dcc3b5aa765d61d8327deb882cf99','2011-06-01 08:00:00');

INSERT INTO users (username, firstname, lastname, email, password, created_date)
VALUES ('cdate','Chris','Date', ['cdate@relational.com','chris.date@relational.com'],'6cb75f652a9b52798eb6cf2201057c73','2011-06-20 13:50:00');

INSERT INTO users (username, firstname, lastname, email, password, created_date)
VALUES ('pmcfadin','Patrick','McFadin', ['patrick@datastax.com'],'ba27e03fd95e507daf2937c937d499ab','2011-06-20 13:50:00');

//Videos
INSERT INTO videos (videoid, videoname, username, description, location, tags, upload_date) 
VALUES (99051fe9-6a9c-46c2-b949-38ef78858dd0,'My funny cat','tcodd', 'My cat likes to play the piano! So funny.',{'US':'/us/vid/99/99051fe9-6a9c-46c2-b949-38ef78858dd0'},{'cats','piano','lol'},'2012-06-01 08:00:00');

INSERT INTO videos (videoid, videoname, username, description, location, tags, upload_date) 
VALUES (b3a76c6b-7c7f-4af6-964f-803a9283c401,'Now my dog plays piano!','tcodd', 'My dog learned to play the piano because of the cat.',{'US':'/us/vid/b3/b3a76c6b-7c7f-4af6-964f-803a9283c401'},{'dogs','piano','lol'},'2012-08-30 16:50:00');

INSERT INTO videos (videoid, videoname, username, description, location, tags, upload_date) 
VALUES (0c3f7e87-f6b6-41d2-9668-2b64d117102c,'An Introduction to Database Systems','cdate', 'An overview of my book',{'US':'/us/vid/0c/0c3f7e87-f6b6-41d2-9668-2b64d117102c'},{'database','relational','book'},'2012-09-03 10:30:00');

INSERT INTO videos (videoid, videoname, username, description, location, tags, upload_date) 
VALUES (416a5ddc-00a5-49ed-adde-d99da9a27c0c,'Intro to CAP theorem','cdate', 'I think there might be something to this.',{'US':'/us/vid/41/416a5ddc-00a5-49ed-adde-d99da9a27c0c'},{'database','cap','brewer'},'2012-12-01 11:29:00');

INSERT INTO videos (videoid, videoname, username, description, location, tags, upload_date) 
VALUES (06049cbb-dfed-421f-b889-5f649a0de1ed,'The data model is dead. Long live the data model.','pmcfadin', 'First in a three part series for Cassandra Data Modeling',{'YouTube':'http://www.youtube.com/watch?v=px6U2n74q3g'},{'cassandra','data model','relational','instruction'},'2013-05-02 12:30:29');

INSERT INTO videos (videoid, videoname, username, description, location, tags, upload_date) 
VALUES (873ff430-9c23-4e60-be5f-278ea2bb21bd,'Become a Super Modeler','pmcfadin', 'Second in a three part series for Cassandra Data Modeling',{'YouTube':'http://www.youtube.com/watch?v=qphhxujn5Es'},{'cassandra','data model','cql','instruction'},'2013-05-16 16:50:00');

INSERT INTO videos (videoid, videoname, username, description, location, tags, upload_date) 
VALUES (49f64d40-7d89-4890-b910-dbf923563a33,'The World''s Next Top Data Model','pmcfadin', 'Third in a three part series for Cassandra Data Modeling',{'YouTube':'http://www.youtube.com/watch?v=HdJlsOZVGwM'},{'cassandra','data model','examples','instruction'},'2013-06-11 11:00:00');

// username_video_index - Every video a user uploads is indexed into a single partition by username
INSERT INTO username_video_index (username, videoid, upload_date, videoname) 
VALUES ('tcodd',99051fe9-6a9c-46c2-b949-38ef78858dd0,'2012-06-01 08:00:00','My funny cat');

INSERT INTO username_video_index (username, videoid, upload_date, videoname) 
VALUES ('tcodd',b3a76c6b-7c7f-4af6-964f-803a9283c401,'2012-08-30 16:50:00','Now my dog plays piano!');

INSERT INTO username_video_index (username, videoid, upload_date, videoname) 
VALUES ('cdate',0c3f7e87-f6b6-41d2-9668-2b64d117102c,'2013-05-02 12:30:29','An Introduction to Database Systems');

INSERT INTO username_video_index (username, videoid, upload_date, videoname) 
VALUES ('cdate',416a5ddc-00a5-49ed-adde-d99da9a27c0c,'2012-12-01 11:29:00','Intro to CAP theorem');

INSERT INTO username_video_index (username, videoid, upload_date, videoname) 
VALUES ('pmcfadin',06049cbb-dfed-421f-b889-5f649a0de1ed,'2013-05-02 12:30:29','The data model is dead. Long live the data model.');

INSERT INTO username_video_index (username, videoid, upload_date, videoname) 
VALUES ('pmcfadin',873ff430-9c23-4e60-be5f-278ea2bb21bd,'2013-05-16 16:50:00','Become a Super Modeler');

INSERT INTO username_video_index (username, videoid, upload_date, videoname) 
VALUES ('pmcfadin',49f64d40-7d89-4890-b910-dbf923563a33,'2013-06-11 11:00:00','The World''s Next Top Data Model');


// tag_index
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('cats',99051fe9-6a9c-46c2-b949-38ef78858dd0, '2012-05-25 08:30:29');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('piano',99051fe9-6a9c-46c2-b949-38ef78858dd0, '2012-05-25 08:30:29');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('lol',99051fe9-6a9c-46c2-b949-38ef78858dd0, '2012-05-25 08:30:29');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('dogs',b3a76c6b-7c7f-4af6-964f-803a9283c401, '2012-08-30 16:50:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('piano',b3a76c6b-7c7f-4af6-964f-803a9283c401, '2012-08-30 16:50:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('lol',b3a76c6b-7c7f-4af6-964f-803a9283c401, '2012-08-30 16:50:00');

INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('database',0c3f7e87-f6b6-41d2-9668-2b64d117102c, '2012-09-03 10:30:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('relational',0c3f7e87-f6b6-41d2-9668-2b64d117102c, '2012-09-03 10:30:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('book',0c3f7e87-f6b6-41d2-9668-2b64d117102c, '2012-09-03 10:30:00');

INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('database',416a5ddc-00a5-49ed-adde-d99da9a27c0c, '2012-12-01 11:29:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('cap',416a5ddc-00a5-49ed-adde-d99da9a27c0c, '2012-12-01 11:29:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('brewer',416a5ddc-00a5-49ed-adde-d99da9a27c0c, '2012-12-01 11:29:00');

INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('cassandra',06049cbb-dfed-421f-b889-5f649a0de1ed, '2013-05-02 12:30:29');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('data model',06049cbb-dfed-421f-b889-5f649a0de1ed, '2013-05-02 12:30:29');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('relational',06049cbb-dfed-421f-b889-5f649a0de1ed, '2013-05-02 12:30:29');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('instruction',06049cbb-dfed-421f-b889-5f649a0de1ed, '2013-05-02 12:30:29');

INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('cassandra',873ff430-9c23-4e60-be5f-278ea2bb21bd, '2013-05-16 16:50:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('data model',873ff430-9c23-4e60-be5f-278ea2bb21bd, '2013-05-16 16:50:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('relational',873ff430-9c23-4e60-be5f-278ea2bb21bd, '2013-05-16 16:50:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('instruction',873ff430-9c23-4e60-be5f-278ea2bb21bd, '2013-05-16 16:50:00');

INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('cassandra',49f64d40-7d89-4890-b910-dbf923563a33, '2013-06-11 11:00:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('data model',49f64d40-7d89-4890-b910-dbf923563a33, '2013-06-11 11:00:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('examples',49f64d40-7d89-4890-b910-dbf923563a33, '2013-06-11 11:00:00');
INSERT INTO tag_index (tag, videoid, tag_ts) VALUES ('instruction',49f64d40-7d89-4890-b910-dbf923563a33, '2013-06-11 11:00:00');

// Video Rating counters
UPDATE video_rating SET rating_counter = rating_counter + 3, rating_total = rating_total + 1 
WHERE videoid = 99051fe9-6a9c-46c2-b949-38ef78858dd0;

UPDATE video_rating SET rating_counter = rating_counter + 5, rating_total = rating_total + 1 
WHERE videoid = 99051fe9-6a9c-46c2-b949-38ef78858dd0;

UPDATE video_rating SET rating_counter = rating_counter + 4, rating_total = rating_total + 1 
WHERE videoid = 99051fe9-6a9c-46c2-b949-38ef78858dd0;

// Video Comments. One for each side of the view.
// Insert in pairs
// This is done using the batch command to group our operations.
BEGIN BATCH
   INSERT INTO comments_by_video (videoid,username,comment_ts, comment) 
   VALUES (99051fe9-6a9c-46c2-b949-38ef78858dd0,'tcodd',now(), 'Worst. Video. Ever.')
   INSERT INTO comments_by_user (videoid,username,comment_ts, comment) 
   VALUES (99051fe9-6a9c-46c2-b949-38ef78858dd0,'tcodd',now(), 'Worst. Video. Ever.')
APPLY BATCH;

BEGIN BATCH
   INSERT INTO comments_by_video (videoid,username,comment_ts, comment) 
   VALUES (99051fe9-6a9c-46c2-b949-38ef78858dd0,'cdate',now(), 'It is amazing')
   INSERT INTO comments_by_user (videoid,username,comment_ts, comment) 
   VALUES (99051fe9-6a9c-46c2-b949-38ef78858dd0,'cdate',now(), 'It is amazing')
APPLY BATCH;

// Video events
INSERT INTO video_event (videoid, username, event, event_timestamp, video_timestamp) 
VALUES (99051fe9-6a9c-46c2-b949-38ef78858dd0,'tcodd','start',now(),0);
INSERT INTO video_event (videoid, username, event, event_timestamp, video_timestamp) 
VALUES (99051fe9-6a9c-46c2-b949-38ef78858dd0,'tcodd','stop',now(),30000);
INSERT INTO video_event (videoid, username, event, event_timestamp, video_timestamp) 
VALUES (99051fe9-6a9c-46c2-b949-38ef78858dd0,'tcodd','start',now(),3000);
INSERT INTO video_event (videoid, username, event, event_timestamp, video_timestamp) 
VALUES (99051fe9-6a9c-46c2-b949-38ef78858dd0,'tcodd','stop',now(),230000);


