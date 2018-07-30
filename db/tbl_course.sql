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

-- Dumping structure for table public.tbl_course
CREATE TABLE IF NOT EXISTS "tbl_course" (
	"id" INTEGER NOT NULL DEFAULT nextval('tbl_course_id_seq'::regclass) COMMENT E'',
	"name" CHARACTER VARYING(255) NULL DEFAULT NULL COMMENT E'',
	"duration" SMALLINT NULL DEFAULT NULL COMMENT E'',
	"start_date" DATE NULL DEFAULT NULL COMMENT E'',
	"end_date" DATE NULL DEFAULT NULL COMMENT E'',
	"status" SMALLINT NULL DEFAULT '1'::smallint COMMENT E'',
	"active" BOOLEAN NULL DEFAULT true COMMENT E'',
	PRIMARY KEY ("id")
);

-- Dumping data for table public.tbl_course: 1 rows
/*!40000 ALTER TABLE "tbl_course" DISABLE KEYS */;
INSERT INTO "tbl_course" ("id", "name", "duration", "start_date", "end_date", "status", "active") VALUES
	(1, E'App Development with Java', 3, E'2018-03-01', E'2018-07-29', 0, E'true');
/*!40000 ALTER TABLE "tbl_course" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
