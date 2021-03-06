--1  bảng hssv
--Thêm
 Alter proc tblHSSV_Them
@MaHSSV nvarchar(30),
@HoTen nvarchar(30),
@MaLop nvarchar(30),
@GioiTinh bit,
@NgaySinh date,
@NoiSinh nvarchar(100),
@QueQuan nvarchar(100),
@NoiOHienNay nvarchar(100),
@DienThoai nvarchar(30),
@EMail nvarchar(30),
@urlPhoto nvarchar(150),
@GhiChu nvarchar(max),
@MatKhau nvarchar(30),
@TrangThai bit
as
begin
insert into tblHSSV values(@MaHSSV,@HoTen,@MaLop,@GioiTinh,@NgaySinh,@NoiSinh,@QueQuan,@NoiOHienNay,@DienThoai,@EMail,@urlPhoto,@GhiChu,@MatKhau,@TrangThai)
end
--S?A
Alter proc tblHSSV_Sua
@MaHSSV nvarchar(30),
@HoTen nvarchar(30),
@MaLop nvarchar(30),
@GioiTinh bit,
@NgaySinh date,
@NoiSinh nvarchar(100),
@QueQuan nvarchar(100),
@NoiOHienNay nvarchar(100),
@DienThoai nvarchar(30),
@EMail nvarchar(30),
@urlPhoto nvarchar(150),
@GhiChu nvarchar(max),
@MatKhau nvarchar(30),
@TrangThai bit
as
begin
update tblHSSV set HoTen=@HoTen,MaLop=@MaLop,GioiTinh=@GioiTinh,NgaySinh=@NgaySinh,NoiSinh=@NoiSinh,QueQuan=@QueQuan,NoiOHienNay=@NoiOHienNay,DienThoai=@DienThoai,EMail=@EMail,urlPhoto=@urlPhoto,GhiChu=@GhiChu,MatKhau=@MatKhau,TrangThai=@TrangThai where MaHSSV=@MaHSSV 
end
--xoa
 Alter proc tblHSSV_Xoa
@MaHSSV nvarchar(30)
as
begin
delete tblHSSV where MaHSSV=@MaHSSV
end
--Lấy
 Alter proc tblHSSV_DS
as
 begin
 select * from tblHSSV
end
--lấyY THEO KHÓA
Alter proc tblHSSV_Lay1
@MaHSSV nvarchar(30)
as
begin
select * from tblHSSV where MaHSSV=@MaHSSV
end

--2 BảnNG LớP HọcC
--Thêm
Alter proc tblLopHoc_Them
@MaLop nvarchar(30),
@MaKhoa nvarchar(30),
@TenLop nvarchar(30),
@MaHeDaoTao nvarchar(30),
@Khoa nvarchar (30)
as
begin
Insert into tblLopHoc Values (@MaLop,@MaKhoa,@TenLop,@MaHeDaoTao,@Khoa)
end
--S?a
 Alter proc tblLopHoc_Sua
@MaLop nvarchar(30),
@MaKhoa nvarchar(30),
@TenLop nvarchar(30),
@MaHeDaoTao nvarchar(30),
@Khoa nvarchar (30)
as
begin
update tblLopHoc set MaKhoa=@MaKhoa,TenLop=@TenLop,MaHeDaoTao=@MaHeDaoTao,Khoa=@Khoa where MaLop=@MaLop
end
--Xóa
Alter proc tblLopHoc_Xoa
@MaLop nvarchar (30)
as
begin
delete tblLopHoc Where MaLop=@MaLop
end
--L?y
Alter proc tblLopHoc_DS
as
 begin
 select * from tblLopHoc
end
--L?Y 1 DÒNG
Alter proc tblLopHoc_Lay1
@MaLop nvarchar (30)
as
begin
select * from tblLopHoc where MaLop=@MaLop
end

