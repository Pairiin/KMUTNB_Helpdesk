DROP TABLE IF EXISTS admin;

CREATE TABLE `admin` (
  `id_admin` int(10) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_lname` varchar(50) NOT NULL,
  `admin_phone` varchar(10) DEFAULT NULL,
  `admin_email` varchar(50) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO admin VALUES("7","ชาลิสา","หน่อแก้ว","0844992767","","admin","1234"),
("22","ไพรินทร์","ชินสร้อย","0844992767","","admin","pairin");



DROP TABLE IF EXISTS department;

CREATE TABLE `department` (
  `id_department` int(2) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_name_en` varchar(10) NOT NULL COMMENT 'ตัวย่อภาษาอังกฤษ',
  `id_faculty` int(2) NOT NULL,
  PRIMARY KEY (`id_department`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO department VALUES("1","สาขาวิชาการจัดการอุตสาหกรรม","IM","1"),
("3","สาขาวิชาเทคโนโลยีสารสนเทศ","IT","1"),
("2","สาขาวิชาการจัดการอุตสาหกรรม (ต่อเนื่อง)","IMT","1"),
("5","สาขาวิชาเทคโนโลยีสารสนเทศ (ต่อเนื่อง)","ITI","1"),
("4","สาขาวิชาคอมพิวเตอร์ช่วยออกแบบและบริหารงานก่อสร้าง","CA","1"),
("6","สาขาวิชาเทคโนโลยีเครื่องจักรกลเกษตร","TA","1"),
("7","สาขาวิชาเทคโนโลยีเครื่องจักรกลเกษตร","TAM","1"),
("8","สาขาวิชาเทคโนโลยีอุตสาหกรรมเกษตรและการจัดการ","ATM","2"),
("9","สาขาวิชาวิทยาศาสตร์การอาหารและโภชนาการ","FSN","2"),
("10","สาขาวิชาวิทยาศาสตร์การอาหารและการจัดการ","FSM","2"),
("11","สาขาวิชาพัฒนาผลิตภัณฑ์อุตสาหกรรมเกษตร","APD","2"),
("12","สาขาวิชานวัตกรรมและเทคโนโลยีการพัฒนาผลิตภัณฑ์","IPD","2"),
("13","สาขาวิชาการจัดการอุตสาหกรรมการท่องเที่ยวและการโรงแรม","TH","3"),
("14","สาขาวิชาบริหารธุรกิจอุตสาหกรรมและการค้า","IBT","3"),
("15","สาขาวิชาบริหารธุรกิจอุตสาหกรรมและการค้า","IBTT","3");



DROP TABLE IF EXISTS detail_repair;

CREATE TABLE `detail_repair` (
  `id_detail` int(10) NOT NULL,
  `id_repair` int(10) NOT NULL,
  `id_device` int(10) DEFAULT NULL COMMENT 'รหัสอุปกรณ์',
  `id_status` int(10) DEFAULT NULL COMMENT 'สถานะการซ่อม',
  `id_problem` int(10) DEFAULT NULL COMMENT 'ปัญหา',
  `device_name_s` varchar(100) NOT NULL COMMENT 'ชื่ออุปกรณ์',
  `date_evalue` date DEFAULT NULL COMMENT 'วันที่ประเมิน',
  `date_comple` date DEFAULT NULL COMMENT 'วันที่คาดว่าจะเสร็จ',
  `problem` varchar(200) NOT NULL COMMENT 'ปัญหา',
  `status_evalue` varchar(50) DEFAULT NULL COMMENT 'สถานะการรับงาน',
  `image` varchar(100) DEFAULT NULL COMMENT 'รูปภาพ',
  `solution` varchar(500) DEFAULT NULL COMMENT 'วิธีแก้ปัญหา',
  `effect` varchar(500) DEFAULT NULL COMMENT 'ผลกระทบ',
  `confirm_effect` varchar(1) DEFAULT NULL COMMENT 'ยืนยันผลกระทบ',
  `description` varchar(500) DEFAULT NULL COMMENT 'หมายเหตุ',
  `id_tokens` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO detail_repair VALUES("0","1","0","7","4","acer B32","2018-04-28","2018-04-30","หน้าจอเสีย","รับ","images.jpg","ลงวินโดว์ใหม่","ข้อมูลหาย","","								","0");



DROP TABLE IF EXISTS detail_satisfaction;

CREATE TABLE `detail_satisfaction` (
  `id_detail_satisfaction` int(20) NOT NULL,
  `id_satisfaction` int(10) NOT NULL COMMENT 'รหัสความพึงพอใจ',
  `id_question` int(10) NOT NULL COMMENT 'รหัสหัวข้อ',
  `id_point` int(1) NOT NULL COMMENT 'คะแนน',
  PRIMARY KEY (`id_detail_satisfaction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS device;

CREATE TABLE `device` (
  `id_device` int(10) NOT NULL,
  `serial_number` varchar(30) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `id_device_category` int(10) NOT NULL COMMENT 'รหัสหมวดหมู่อุปกรณ์',
  `id_device_type` int(10) NOT NULL COMMENT 'รหัสประเภทอุปกรณ์',
  PRIMARY KEY (`id_device`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO device VALUES("1","7440-001-04-071-00338","เครื่อง PC","1","1"),
("2","PF0EM7LL","Lenovo 300","2","2"),
("3","1638HS01L198","เมาส์ DELL","4","2"),
("4","CN-OP702271581-472-OOS7-A01","HP","2","2"),
("11","123456789","testy","1","2"),
("12","1122334455667788","rrrrr","1","1"),
("13","12345","eeee","2","1"),
("14","PF0EM7LL","ddd","1","1"),
("15","dd","rrr","2","2"),
("16","assssssss","sasasasas","1","1"),
("0","S32FRWQ","ACER","2","2");



DROP TABLE IF EXISTS device_category;

CREATE TABLE `device_category` (
  `id_device_category` int(10) NOT NULL,
  `device_category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_device_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='หมวดหมู่อุปกรณ์';

INSERT INTO device_category VALUES("1","Desktop Computer (คอมพิวเตอร์ตั้งโต๊ะ)"),
("2","Notebook"),
("3","Moblie"),
("4","อุปกรณ์ต่อพ่วง");



DROP TABLE IF EXISTS device_type;

CREATE TABLE `device_type` (
  `id_device_type` int(10) NOT NULL,
  `device_type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_device_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ประเภทอุปกรณ์';

INSERT INTO device_type VALUES("1","อุปกรณ์ของทางมหาวิทยาลัย"),
("2","อุปกรณ์ส่วนตัว");



DROP TABLE IF EXISTS email;

CREATE TABLE `email` (
  `id_email` int(10) NOT NULL,
  `email_name` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `email_password` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO email VALUES("1","Helpdesk KMUTNB","pinkcls39@gmail.com","04072539pink");



DROP TABLE IF EXISTS faculty;

CREATE TABLE `faculty` (
  `id_faculty` int(2) NOT NULL,
  `faculty_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_faculty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO faculty VALUES("1","คณะเทคโนโลยีและการจัดการอุตสาหกรรม"),
("2","คณะอุตสาหกรรมเกษตร"),
("3","คณะบริหารธุรกิจและอุตสาหกรรมบริการ");



DROP TABLE IF EXISTS month;

CREATE TABLE `month` (
  `month` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO month VALUES("มกราคม"),
("กุมภาพันธ์"),
("มีนาคม"),
("เมษายน"),
("พฤษภาคม"),
("มิถุนายน"),
("กรกฎาคม"),
("สิงหาคม"),
("กันยายน"),
("ตุลาคม"),
("พฤศจิกายน"),
("ธันวาคม");



DROP TABLE IF EXISTS point;

CREATE TABLE `point` (
  `id_point` int(1) NOT NULL,
  `point_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO point VALUES("1","น้อยที่สุด"),
("2","น้อย"),
("3","ปานกลาง"),
("4","มาก"),
("5","มากที่สุด");



DROP TABLE IF EXISTS problem;

CREATE TABLE `problem` (
  `id_problem` int(10) NOT NULL,
  `problem_name` varchar(500) NOT NULL,
  `solution_problem` varchar(500) DEFAULT NULL,
  `id_problem_type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_problem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO problem VALUES("1","boot เข้าหน้า windows ไม่ได้","ลงวินโดวส์ใหม่","2"),
("2","ไม่สามารถพิมพ์เอกสารได้","ลงไดร์ฟเวอร์ใหม่","1"),
("3","ลง OS พร้อมโปรแกรม","ลง OS","2"),
("4","โดนไวรัส","ลงวินโดวส์ใหม่","2"),
("5","พัง","ซ่อม","1"),
("6","เปิด word ไม่ได้","install word","2"),
("0","หน้าจอเสีย","เปลี่ยนหน้าจอใหม่","1");



DROP TABLE IF EXISTS problem_type;

CREATE TABLE `problem_type` (
  `id_problem_type` int(10) NOT NULL,
  `problem_type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_problem_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO problem_type VALUES("1","ฮาร์ดแวร์"),
("2","ซอฟต์แวร์");



DROP TABLE IF EXISTS question;

CREATE TABLE `question` (
  `id_question` int(10) NOT NULL,
  `question_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ตารางคำถามความพึงพอใจ';

INSERT INTO question VALUES("1","การให้บริการในการซ่อมบำรุงรักษาเครื่องคอมพิวเตอร์"),
("2","การให้บริการในส่วนของการให้คำปรึกษาด้านคอมพิวเตอร์"),
("3","ระยะเวลาในการให้บริการมีควมเหมาะสม"),
("4","ให้บริการตรงตามความต้องการของผู้ใช้งานได้อย่างครบถ้วน"),
("5","ความสุภาพในการให้บริการของเจ้าหน้าที่"),
("6","ความพึงพอใจในภาพรวมของการให้บริการ");



DROP TABLE IF EXISTS repair;

CREATE TABLE `repair` (
  `id_repair` int(10) NOT NULL,
  `id_admin` int(10) DEFAULT NULL COMMENT 'รหัสเจ้าหน้าที่',
  `user_name` varchar(20) DEFAULT NULL COMMENT 'username',
  `user_display` varchar(80) NOT NULL COMMENT 'ชื่อผู้แจ้ง',
  `user_email` varchar(50) NOT NULL COMMENT 'email',
  `user_phone` varchar(10) NOT NULL COMMENT 'เบอร์โทรผู้แจ้งซ่อม',
  `id_user_status` varchar(50) NOT NULL COMMENT 'ประเภทผู้แจ้งซ่อม',
  `room` varchar(50) DEFAULT NULL,
  `class` int(2) DEFAULT NULL,
  `building` varchar(50) DEFAULT NULL,
  `date_s` date DEFAULT NULL COMMENT 'วันที่แจ้งซ่อม',
  `time_s` time DEFAULT NULL COMMENT 'เวลาที่แจ้งซ่อม',
  `status_satis` varchar(50) DEFAULT NULL COMMENT 'สถานะการประเมิน',
  PRIMARY KEY (`id_repair`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO repair VALUES("1","22","s5706021620172","ไพรินทร์ ชินสร้อย","watmai-pairin@hotmail.com","0939726732","2","B402","4","FITM","2018-04-28","21:45:16","1");



DROP TABLE IF EXISTS satisfaction;

CREATE TABLE `satisfaction` (
  `id_satisfaction` int(10) NOT NULL,
  `id_repair` int(10) NOT NULL,
  `date_assessment` date NOT NULL,
  `id_user_status` int(20) DEFAULT NULL COMMENT 'สถานะภาพ',
  `gender` varchar(10) NOT NULL COMMENT 'เพศ',
  `education` varchar(50) NOT NULL COMMENT 'ระดับการศึกษา',
  `id_faculty` int(2) DEFAULT NULL COMMENT 'คณะ',
  `id_department` int(2) DEFAULT NULL COMMENT 'สาขา',
  `sugges` varchar(500) DEFAULT NULL COMMENT 'ข้อเสนอแนะ'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS status;

CREATE TABLE `status` (
  `id_status` int(10) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO status VALUES("1","รอการรับงาน"),
("2","รอการประเมินอาการ"),
("3","ดำเนินการซ่อม"),
("4","สำเร็จ"),
("5","ไม่สำเร็จ"),
("6","ไม่รับงาน"),
("7","รอการยืนยัน"),
("8","ยกเลิก");



DROP TABLE IF EXISTS token;

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL COMMENT 'username user',
  `tokens` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL DEFAULT '0000-00-00',
  `status_tokens` varchar(1) DEFAULT NULL,
  `id_detail` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO token VALUES("0","s5706021620172","ece635e1ca3d982c","0000-00-00","","0");



DROP TABLE IF EXISTS user_status;

CREATE TABLE `user_status` (
  `id_user_status` int(20) NOT NULL,
  `name_user_status` varchar(20) NOT NULL,
  PRIMARY KEY (`id_user_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO user_status VALUES("1","personel"),
("2","student"),
("3","templecturer");



