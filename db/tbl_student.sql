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

-- Dumping structure for table public.tbl_student
CREATE TABLE IF NOT EXISTS "tbl_student" (
	"id" INTEGER NOT NULL DEFAULT nextval('tbl_student_id_seq'::regclass) COMMENT E'',
	"active" BOOLEAN NULL DEFAULT true COMMENT E'',
	"address" CHARACTER VARYING(255) NULL DEFAULT NULL::character varying COMMENT E'',
	"caddress" CHARACTER VARYING(255) NULL DEFAULT NULL::character varying COMMENT E'',
	"dob" DATE NULL DEFAULT NULL COMMENT E'',
	"email" CHARACTER VARYING(100) NULL DEFAULT NULL::character varying COMMENT E'',
	"fstatus" BOOLEAN NULL DEFAULT NULL COMMENT E'',
	"gender" BOOLEAN NULL DEFAULT NULL COMMENT E'',
	"name" CHARACTER VARYING(255) NULL DEFAULT NULL::character varying COMMENT E'',
	"phone" CHARACTER VARYING(100) NULL DEFAULT NULL::character varying COMMENT E'',
	"pob" CHARACTER VARYING(200) NULL DEFAULT NULL::character varying COMMENT E'',
	PRIMARY KEY ("id")
);

-- Dumping data for table public.tbl_student: 0 rows
/*!40000 ALTER TABLE "tbl_student" DISABLE KEYS */;
INSERT INTO "tbl_student" ("id", "active", "address", "caddress", "dob", "email", "fstatus", "gender", "name", "phone", "pob") VALUES
	(1, E'true', E'Phnom Penh', E'Phnom Penh', E'1995-07-26', E'sophea.sok@gmail.com', E'true', E'false', E'Sok Sophea', E'011239833', E'PP');
/*!40000 ALTER TABLE "tbl_student" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
