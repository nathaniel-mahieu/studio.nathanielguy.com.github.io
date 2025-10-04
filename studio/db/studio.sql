drop table if exists pictures;
create table pictures (
 id			int(6) unsigned		auto_increment not null,
 title			varchar(255)		not null,
 description		text				,
 keywords		varchar(255)		,
 date_added	timestamp		,
 camera		varchar(255)		,
 resolution		varchar(255)		,
 mode		varchar(255)		,
 shutter_speed	varchar(255)		,
 flash			varchar(255)		,
 exposure_time	varchar(255)		,
 iso			varchar(255)		,
 metering		varchar(255)		,
 aperture		varchar(255)		,
 focal_length	varchar(255)		,
 artist		varchar(255)		,
 copyright		varchar(255)		,
 primary key(id)
 );

drop table if exists catagories;
create table catagories (
 id			int(6) unsigned		auto_increment not null,
 name		varchar(255)		not null,
 description		text				,
 primary key(id)
 );

drop table if exists catagories_pictures;
create table catagories_pictures (
 catagory_id	int(6) unsigned		not null,
 picture_id		int(6) unsigned		not null,
 primary key(picture_id)
 );