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

-- Dumping structure for table public.tbl_teacher_subject
CREATE TABLE IF NOT EXISTS "tbl_teacher_subject" (
	"teacher_id" INTEGER NOT NULL COMMENT E'',
	"subject_id" INTEGER NOT NULL COMMENT E'',
	PRIMARY KEY ("teacher_id","subject_id")
);

-- Dumping data for table public.tbl_teacher_subject: 0 rows
/*!40000 ALTER TABLE "tbl_teacher_subject" DISABLE KEYS */;
INSERT INTO "tbl_teacher_subject" ("teacher_id", "subject_id") VALUES
	(4, 1);
/*!40000 ALTER TABLE "tbl_teacher_subject" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
