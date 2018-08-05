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

-- Dumping structure for table public.tbl_teacher_att
CREATE TABLE IF NOT EXISTS "tbl_teacher_att" (
	"id" INTEGER NOT NULL DEFAULT nextval('tbl_teacher_att_id_seq'::regclass) COMMENT E'',
	"schedule_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"schedule_date" DATE NULL DEFAULT NULL COMMENT E'',
	"absent" SMALLINT NULL DEFAULT NULL COMMENT E'',
	"remark" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	PRIMARY KEY ("id")
);

-- Dumping data for table public.tbl_teacher_att: 0 rows
/*!40000 ALTER TABLE "tbl_teacher_att" DISABLE KEYS */;
INSERT INTO "tbl_teacher_att" ("id", "schedule_id", "schedule_date", "absent", "remark") VALUES
	(4, 28, E'2018-08-04', 1, E''),
	(5, 28, E'2018-08-08', 1, E''),
	(6, 29, E'2018-08-07', 2, E'សុំច្បាប់ទៅស្រុកកំណើត');
/*!40000 ALTER TABLE "tbl_teacher_att" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
