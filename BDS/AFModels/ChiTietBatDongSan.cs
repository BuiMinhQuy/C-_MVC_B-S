namespace AFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietBatDongSan")]
    public partial class ChiTietBatDongSan
    {
        [Key]
        public int STT { get; set; }

        public int? MaBDS { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "Giá phải lớn hơn 0")]
        [DisplayFormat(DataFormatString = "{0:#,##0}")]
        [Required(ErrorMessage = "Giá không được để trống")]
        public decimal? Gia { get; set; }

        [StringLength(50)]
        [Range(0, int.MaxValue, ErrorMessage = "Diện tích phải lớn hơn 0")]
        [Required(ErrorMessage = "Diện tích không được để trống")]
        public string DienTich { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Địa chỉ không được để trống")]
        public string DiaChiBDS { get; set; }

        [StringLength(1000)]
        [Required(ErrorMessage = "Mô tả không được để trống")]
        public string Mota { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Khu vực không được để trống")]
        public string KhuVuc { get; set; }

        [StringLength(255)]
        [Required(ErrorMessage = "Ảnh không được để trống")]
        public string Anh { get; set; }

        [Range(0, int.MaxValue, ErrorMessage = "Số lượng phòng tắm phải là số không âm.")]
        [Required(ErrorMessage = "Phòng tắm không được để trống")]
        public int? PhongTam { get; set; }

        [Range(0, int.MaxValue, ErrorMessage = "Số lượng phòng ngủ phải là số không âm.")]
        [Required(ErrorMessage = "Phòng ngủ không được để trống")]
        public int? PhongNgu { get; set; }

        [StringLength(10)]
        public string Paking { get; set; }

        public virtual BatDongSan BatDongSan { get; set; }

        public int Max(Func<object, object> p)
        {
            throw new NotImplementedException();
        }
    }
}