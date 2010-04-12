DROP database IF EXISTS chieftain;
CREATE database chieftain;
USE chieftain;

DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs` (
	`id` int(11) unsigned NOT NULL auto_increment,
	`full_name` varchar(255) NOT NULL,
	`alias` varchar(255) default NULL,
	`birth_date` date NOT NULL,
	`email_address` varchar(255) NOT NULL,
	`password` varchar(32) NOT NULL,
	`is_active` tinyint(1) default NULL,
	-- `created` datetime NOT NULL,
	-- `created_by` char(36) default NULL,
	-- `modified` datetime NOT NULL,
	-- `modified_by` char(36) default NULL,
	PRIMARY KEY  (`id`)
);
-- Keep insert statements for Staffs empty.

DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
	`id` int(11) unsigned NOT NULL auto_increment,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY  (`id`)
);
INSERT INTO `sections` (`name`) VALUES ('Filipiniana'),('Computer'),('General'),('HRIM'),('Nursing');

DROP TABLE IF EXISTS `editions`;
CREATE TABLE `editions` (
	`id` int(11) unsigned NOT NULL auto_increment,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY  (`id`)
);
INSERT INTO `editions` (`name`) VALUES ('1'),('2'),('3');

-- Dependencies:
-- * Sections
-- * Editions
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
	`id` int(11) unsigned NOT NULL auto_increment,
	`title` varchar(255) NOT NULL,
	`sub_title` varchar(255) default NULL,
	`copyright_year` varchar(255) default NULL,
	`pagination` varchar(255) default NULL,
	`section_id` int(11) unsigned default NULL,
	`edition_id` int(11) unsigned default NULL,
	--  `created` datetime NOT NULL,
	--  `created_by` int(11) unsigned NOT NULL,
	--  `modified` datetime NOT NULL,
	--  `modified_by` int(11) unsigned NOT NULL,
	PRIMARY KEY  (`id`),
	FULLTEXT KEY `title` (`title`),
	FULLTEXT KEY `sub_title` (`sub_title`)
);
INSERT INTO `books` (`title`,`sub_title`,`copyright_year`) VALUES
('MySQL','Crash Course','2005');

-- Dependencies:
-- * Books
CREATE TABLE `book_identifiers` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `book_id` int (11) unsigned NOT NULL,
  `call_number` varchar(255) default NULL,
  `isbn_10` char(10) default NULL,
  `isbn_13` char(13) default NULL,
);