using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ThuongMaiDienTu_v2.Models
{
    public class ChangeCurrency
    {
        ThuongMaiDienTuEntities database = new ThuongMaiDienTuEntities();
        public class Item
        {
            public int id { get; set; }
            public string price { get; set; }
        }

    }
}