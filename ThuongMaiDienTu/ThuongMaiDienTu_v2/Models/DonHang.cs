//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ThuongMaiDienTu_v2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            this.ProductListCheckouts = new HashSet<ProductListCheckout>();
        }
    
        public int DonHang_id { get; set; }
        public Nullable<int> Account_ID { get; set; }
        public Nullable<System.DateTime> NgayGio { get; set; }
        public Nullable<int> TinhTrangDonHang_id { get; set; }
        public string PhuongThucThanhToan { get; set; }
        public string TinhTrangThanhToan { get; set; }
        public Nullable<int> Total { get; set; }
        public Nullable<int> DonHangInfor_id { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual DonHangInfor DonHangInfor { get; set; }
        public virtual TinhTrangDonHang TinhTrangDonHang { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductListCheckout> ProductListCheckouts { get; set; }
    }
}
