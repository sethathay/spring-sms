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
	"course_id" INTEGER NOT NULL COMMENT E'',
	"subject_id" INTEGER NOT NULL COMMENT E'',
	"teacher_id" INTEGER NOT NULL COMMENT E'',
	PRIMARY KEY ("id"),
	UNIQUE KEY ("subject_id")
);

-- Dumping data for table public.tbl_course_subject: 0 rows
/*!40000 ALTER TABLE "tbl_course_subject" DISABLE KEYS */;
INSERT INTO "tbl_course_subject" ("id", "course_id", "subject_id", "teacher_id") VALUES
	(1, 1, 5, 4),
	(3, 1, 2, 5);
/*!40000 ALTER TABLE "tbl_course_subject" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
