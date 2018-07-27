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

-- Dumping structure for table public.tbl_subject
CREATE TABLE IF NOT EXISTS "tbl_subject" (
	"id" INTEGER NOT NULL DEFAULT nextval('tbl_subject_id_seq'::regclass) COMMENT E'',
	"active" BOOLEAN NULL DEFAULT true COMMENT E'',
	"abbr" CHARACTER VARYING(20) NULL DEFAULT NULL::character varying COMMENT E'',
	"name" CHARACTER VARYING(255) NULL DEFAULT NULL::character varying COMMENT E'',
	"description" CHARACTER VARYING(500) NULL DEFAULT NULL::character varying COMMENT E'',
	PRIMARY KEY ("id")
);

-- Dumping data for table public.tbl_subject: 0 rows
/*!40000 ALTER TABLE "tbl_subject" DISABLE KEYS */;
INSERT INTO "tbl_subject" ("id", "active", "abbr", "name", "description") VALUES
	(2, E'true', E'CS02', E'Mobile App Development', E'Required: Java, Gradle, and Maven knowledge '),
	(3, E'true', E'CS04', E'C Programming Language', E'CPL'),
	(4, E'true', E'CS05', E'C++', E'C++'),
	(5, E'true', E'CS06', E'PHP', E'PHP'),
	(1, E'true', E'CS015', E'Enterprise Web Architecture', E'Enterprise Web Architecture');
/*!40000 ALTER TABLE "tbl_subject" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
