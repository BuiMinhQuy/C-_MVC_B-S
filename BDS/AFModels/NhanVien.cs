namespace AFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhanVien")]
    public partial class NhanVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NhanVien()
        {
            HoaDons = new HashSet<HoaDon>();
            HoaDonKhachHangs = new HashSet<HoaDonKhachHang>();
        }

        [Key]
        public int MaNV { get; set; }

        [Required(ErrorMessage = "Họ tên không được để trống")]
        [StringLength(50)]
        public string HoTenNV { get; set; }

        [Required(ErrorMessage = "Chức vụ không được để trống")]
        [StringLength(50)]
        public string ChucVu { get; set; }

        [StringLength(12)]
        [Required(ErrorMessage = "Số điện thoại không được để trống")]
        public string DienThoai { get; set; }

        [Required(ErrorMessage = "Giới tính không được để trống")]
        [StringLength(6)]
        public string GioiTinh { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Địa chỉ không được để trống")]
        public string DiaChi { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [Required(ErrorMessage = "Username không được để trống")]
        [StringLength(50)]
        public string UserName { get; set; }

        [StringLength(255)]
        public string Facebook { get; set; }

        [StringLength(255)]
        public string Googleplus { get; set; }

        [StringLength(255)]
        public string Twitter { get; set; }

        [StringLength(255)]
        public string Instagram { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDonKhachHang> HoaDonKhachHangs { get; set; }

        public virtual QuanTri QuanTri { get; set; }
    }
}