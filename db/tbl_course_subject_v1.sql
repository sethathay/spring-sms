-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               PostgreSQL 10.4, compiled by Visual C++ build 1800, 64-bit
-- Server OS:                    
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table public.tbl_course_subject
CREATE TABLE IF NOT EXISTS "tbl_course_subject" (
	"id" INTEGER NOT NULL DEFAULT nextval('tbl_course_subject_id_seq'::regclass) COMMENT E'',
	"course_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"subject_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"teacher_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"dayofweek" INTEGER NULL DEFAULT NULL COMMENT E'',
	"studytime" INTEGER NULL DEFAULT NULL COMMENT E'',
	"starttime" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"endtime" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	PRIMARY KEY ("id")
);

-- Dumping data for table public.tbl_course_subject: 0 rows
/*!40000 ALTER TABLE "tbl_course_subject" DISABLE KEYS */;
INSERT INTO "tbl_course_subject" ("id", "course_id", "subject_id", "teacher_id", "dayofweek", "studytime", "starttime", "endtime") VALUES
	(16, 6, 2, 8, 1, 2, E'8:00AM', E'10:00AM'),
	(11, 5, 1, 7, 2, 2, E'8:00AM', E'10:00AM'),
	(17, 5, 3, 5, 1, 3, E'8:00AM', E'10:00AM'),
	(19, 2, 6, 6, 1, 2, E'3:00PM', E'5:00PM');
/*!40000 ALTER TABLE "tbl_course_subject" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
