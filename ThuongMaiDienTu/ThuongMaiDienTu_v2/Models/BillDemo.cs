using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ThuongMaiDienTu_v2.Models
{
    public class BillDemo
    {
        public string name { get; set; }
        public string email { get; set; }
        public string diachi { get; set; }
        public string sodienthoai { get; set; }
        public string calc_shipping_provinces { get; set; }
        public string calc_shipping_district { get; set; }
        public string phuongxa { get; set; }
    }
}