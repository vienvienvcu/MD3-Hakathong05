create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;
-- Bài 1: Tạo CSDL [20 điểm]:

-- Bảng STUDENT 
create table student(
   studentId  varchar(4) primary key not null,
   studentName varchar(100)not null,
   birthday date not null,
   gender bit default 1 not null,
   address text not null ,
   phoneNumber varchar(45) unique 
);
-- Bảng SUBJECT 
create table subjects (
   subjectId varchar(4) primary key not null,
   subjectName varchar(45) not null,
   priority int not null
);

-- Bảng MARK
create table Mark (
   subjectId varchar(4) not null,
   studentId varchar(4) not null,
   point double not null,
   primary key (subjectId,studentId),
   constraint FK_subject foreign key (subjectId) references subjects (subjectId),
   constraint FK_student foreign key (studentId) references  student(studentId)
);
-- Bài 2: Thêm , sửa , xoá dữ liệu [35 điểm]:
-- 1. Thêm dữ liệu vào các bảng như sau

--  Bảng STUDENT :
select * from student;
insert into student(studentId ,studentName,birthday,gender,address,phoneNumber) values
('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
('S004', 'Đỗ Tiến Mạnh', '1999-05-26', 1, 'Hà Nội', '983665353'),
('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '982654268'),
('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274673'),
('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');
-- Chèn dữ liệu vào bảng subjects
select * from subjects;
insert into subjects (subjectId, subjectName, priority) values
('MH01', 'Toán', 2),
('MH02', 'Lý', 2),
('MH03', 'Hóa', 1),
('MH04', 'Ngữ Văn', 1),
('MH05', 'Tiếng Anh', 2);

-- Chèn dữ liệu vào bảng Mark
select * from Mark;
insert into Mark (subjectId, studentId, point) values
('MH01', 'S001', 8.5),
('MH02', 'S001', 7),
('MH03', 'S001', 9),
('MH04', 'S001', 9),
('MH05', 'S001', 5),

('MH01', 'S002', 9),
('MH02', 'S002', 8),
('MH03', 'S002', 6.5),
('MH04', 'S002', 8),
('MH05', 'S002', 6),

('MH01', 'S003', 7.5),
('MH02', 'S003', 6.5),
('MH03', 'S003', 8),
('MH04', 'S003', 7),
('MH05', 'S003', 7),

('MH01', 'S004', 6),
('MH02', 'S004', 7),
('MH03', 'S004', 5),
('MH04', 'S004', 6.5),
('MH05', 'S004', 8),

('MH01', 'S005', 5.5),
('MH02', 'S005', 8),
('MH03', 'S005', 7.5),
('MH04', 'S005', 8.5),
('MH05', 'S005', 9),

('MH01', 'S006', 8),
('MH02', 'S006', 10),
('MH03', 'S006', 9),
('MH04', 'S006', 7.5),
('MH05', 'S006', 6.5),

('MH01', 'S007', 9.5),
('MH02', 'S007', 9),
('MH03', 'S007', 6),
('MH04', 'S007', 9),
('MH05', 'S007', 4),

('MH01', 'S008', 10),
('MH02', 'S008', 8.5),
('MH03', 'S008', 8.5),
('MH04', 'S008', 6),
('MH05', 'S008', 9.5),

('MH01', 'S009', 7.5),
('MH02', 'S009', 7),
('MH03', 'S009', 9),
('MH04', 'S009', 5),
('MH05', 'S009', 10),

('MH01', 'S010', 6.5),
('MH02', 'S010', 8),
('MH03', 'S010', 5.5),
('MH04', 'S010', 4),
('MH05', 'S010', 7);


-- 2. Cập nhật dữ liệu [10 điểm]:
--  Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.

update student
set studentName = 'Đỗ Đức Mạnh'
where studentId = 'S004';
select * from student;

-- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1

update subjects 
set subjectName = 'Ngoại Ngữ',priority = 1
where subjectId = 'MH05';
select * from subjects;

-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6,MH05 : 9).

update Mark
set point = 8.5
where studentId = 'S009' and subjectId = 'MH01';
update Mark
set point = 7
where studentId = 'S009' and subjectId = 'MH02';
update Mark
set point = 5.5
where studentId = 'S009' and subjectId = 'MH03';
update Mark
set point = 6
where studentId = 'S009' and subjectId = 'MH04';
update Mark
set point = 9
where studentId = 'S009' and subjectId = 'MH05';
 select * from Mark;
 
-- 3. Xoá dữ liệu[10 điểm]:

-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK 
-- và thông tin học sinh này ở bảng STUDENT

-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK 
delete from Mark
where studentId = 'S010';
 select * from Mark;
-- Xoá toàn bộ thông tin học sinh này ở bảng STUDENT
delete from student
where studentId = 'S010';
 select * from student;

-- Bài 3: Truy vấn dữ liệu [25 điểm]:

-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]

select * from student;

-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]

select sb.subjectName as Tên_môn_học,
sb.subjectId as Mã_môn_học,
sb.priority as Hệ_số
from subjects sb
where priority = 1;

-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi 
-- (bằng năm hiện tại trừ năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]

select studentId AS Mã_học_sinh,
studentName AS Tên_học_sinh,
year(curdate())-year(birthday) as Tuổi  , 
case 
   when gender = 1  then 'Nam'
   else 'Nữ' 
   end as Giới_tính,
   address AS Quê_quán 
   from student;
   
-- Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của 
-- môn Toán và sắp xếp theo điểm giảm dần. [4 điểm]

select st.studentName AS Tên_học_sinh,
  sb.subjectName AS Tên_môn_học ,
  m.point AS Điểm_thi
from
 Mark m
join 
student st on st.studentId = m.studentId
join 
subjects sb on sb.subjectId = m.subjectId
where sb.subjectName =  'Toán'
order by m.point desc;

-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).

select case 
  when gender = 1 then 'Nam'
  else 'Nữ'
  end as giới_tính,
  count(gender) as số_lượng 
from student
group by gender;

-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) 
-- bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]

select 
st.studentId as Mã_học_sinh,
st.studentName AS Tên_hoc_sinh,
sum(m.point) as Tổng_điểm,
avg(m.point) as Điểm_trung_bình
from Mark m
join student st on st.studentId = m.studentId
group by st.studentId,st.studentName;

-- Bài 4: Tạo View, Index, Procedure [20 điểm]
-- 1.Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán . [3 điểm]

create view STUDENT_VIEW as
select 
   studentId as Mã_học_sinh,
   studentName as Tên_học_sinh,
   case
     when gender = 1 then 'Nam'
     else 'Nữ'
     end as Giới_tính,
	address as quê_quán 
 from student;   
 
 --  Xem nội dung của VIEW STUDENT_VIEW
select * from STUDENT_VIEW;

-- 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,điểm trung bình các môn học . [3 điểm]

create view AVERAGE_MARK_VIEW as
select 
  st.studentId as Mã_học_sinh,
  st.studentName as Tên_học_sinh,
  avg(m.point) as Điểm_trung_bình
from Mark m
join student st on 
st.studentId = m.studentId
group by st.studentId, st.studentName;
  
--  Xem nội dung của VIEW AVERAGE_MARK_VIEW
select * from AVERAGE_MARK_VIEW;

-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
create index idx_phoneNumber on student(phoneNumber);
show index from student;

-- 4. Tạo các PROCEDURE sau:
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó. [3 điểm]
DELIMITER //
create procedure PROC_INSERTSTUDENT(
in in_studentId varchar(4),
in in_studentName varchar(100),
in in_birthday date,
in in_gender bit,
in in_address text,
in in_phoneNumber varchar(45)
)
begin 
  insert into student (studentId,studentName, birthday, gender, address, phoneNumber) values
  (in_studentId,in_studentName,in_birthday,in_gender, in_address,in_phoneNumber);
end // 
DELIMITER ;
CALL PROC_INSERTSTUDENT('S011', 'Nguyễn Văn Phú', '2000-11-01', 1, 'Hải Dương', '0123456780');

select * from student;

-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.[3 điểm]
DELIMITER //
create procedure PROC_UPDATESUBJECT(
  in in_subjectId VARCHAR(4),
  in in_subjectName VARCHAR(45)
)
begin
   update subjects
   SET subjectName = in_subjectName
   where subjectId = in_subjectId;
end //
DELIMITER ;
select * from subjects;

 call PROC_UPDATESUBJECT('MH01','Toán cao cấp');

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh. [3 điểm]

delimiter //
create procedure PROC_DELETEMARK(
  in in_studentId varchar(4)
)
begin
 delete from Mark
 where studentId = in_studentId;
end//
delimiter ;
call PROC_DELETEMARK('S001');

select * from mark;
select * from student;



















