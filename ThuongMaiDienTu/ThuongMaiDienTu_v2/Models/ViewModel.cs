using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace ThuongMaiDienTu_v2.Models
{
    public class ViewModel
    {
        public  List<SanPham> NewProduct { get; set; }
        public List<SanPham> LikeProduct { get; set; }

        public IEnumerable<SanPham> New
        {
            get { return NewProduct; }
        }

        //public int GetTotal(SanPham sp)
        //{
        //    int total=0;
        //    //var productDetail = 5;
        //    var sizeS = sp.SanPhamDetail.S;
        //    var sizeM = sp.SanPhamDetail.M;
        //    var sizeL = sp.SanPhamDetail.L;
        //    var sizeXl = sp.SanPhamDetail.XL;
        //    var sizeXXl = sp.SanPhamDetail.XXL;
        //    sizeS = int.Parse(sizeS.ToString());
        //    sizeM = int.Parse(sizeM.ToString());
        //    sizeL = int.Parse(sizeL.ToString());
        //    sizeXl = int.Parse(sizeXl.ToString());
        //    sizeXXl = int.Parse(sizeXXl.ToString());
        //    total = Convert.ToInt32(sizeS + sizeM + sizeL + sizeXl + sizeXXl);
        //    return total;
        //}

        //public SanPham FormatNumber( SanPham SpOld)
        //{
        //    int price = int.Parse(SpOld.SanPham_Price.ToString());
        //    CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");
        //    //string a = b.ToString("#,###", cul.NumberFormat);
        //    SanPham SpNew=SpOld;            
        //    SpNew.PriceConvert = price.ToString("#,###", cul.NumberFormat);
        //    return SpNew;

        //}
    }
}