using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using ThuongMaiDienTu_v2.Models;

namespace ThuongMaiDienTu_v2.Areas.Admin.Models
{
    public class LisSanPham
    {
        public ProductListCheckout listSp { get; set; }
        public string StringPrice { get; set; }        
    }

    public class Bill
    {
        ThuongMaiDienTuEntities database = new ThuongMaiDienTuEntities();
        public List<ProductListCheckout> listSp { get; set; }
        public DonHang DonHang { get; set; }
        public string Total { get; set; }

        //public List<LisSanPham> items { get; set; }
        
        public void ToStringPrice(int id)
        {
            var a = database.ProductListCheckouts.Where(i => i.DonHang_id == id).ToList();
            //foreach(var i in a)
            //{
            //    int StPrice = (int)i.Price;
            //    items.Add(new LisSanPham
            //    {
            //        listSp = i,
            //        StringPrice = TotalToCurrency(StPrice)
            //    });
            //}
        }
        public string TotalToCurrency(int price)
        {
            CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");
            return  price.ToString("#,###", cul.NumberFormat);
        }
        //---------------------------------------
        //public List<ProductListCheckout> dsSanPham { get; set; }
        

    }

}