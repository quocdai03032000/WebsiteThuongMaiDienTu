using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThuongMaiDienTu_v2.Models;
using ThuongMaiDienTu_v2.Areas.Admin.Models;
using System.Globalization;

namespace ThuongMaiDienTu_v2.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        ThuongMaiDienTuEntities database = new ThuongMaiDienTuEntities();

        //Index
        public ActionResult Index()
        {
            if (Session["admin"] !=null)
            {
                return View();
            }
            return RedirectToAction("Login", "Admin");
        }

        //Login
        public ActionResult Login()
        {
            return View();
        }

        //User Management
        public ActionResult UserManagement()
        {
            return View();
        }

        //Product Management
        public ActionResult ProductManagement()
        {
            ViewModel view = new ViewModel();
            var sp = database.SanPhams.OrderByDescending(a => a.SanPham_Id).ToList();
            var total = from s in database.SanPhamDetails
                        select s.L + s.S + s.M + s.XL + s.XXL;
            var number = database.SanPhamDetails.ToList().ToArray();

            //Code them so luong vao sao pham
            //for (int i = 0; i < sp.Length; i++)
            //{
            //    int total = int.Parse(number[i].S.ToString()) + int.Parse(number[i].M.ToString()) + int.Parse(number[i].L.ToString()) + int.Parse(number[i].XL.ToString()) + int.Parse(number[i].XXL.ToString());
            //    sp[i].SoLuong = total;
            //}

            return View(sp);
        }

        //Product Detail
        public ActionResult ProductDetail(int id)
        {
            TempData["IdProductDetai"] = id;
            return View(database.SanPhams.Where(a => a.SanPham_Id == id).FirstOrDefault());
        }

        //Order
        public ActionResult Order()
        {
            return View(database.DonHangs.ToList());
        }

        //Order detail
        public ActionResult OderDetail(int id)
        {
            //id : của đơn hàng
            //Lấy ra bill
            var DonHang = database.DonHangs.Where(a => a.DonHang_id == id).SingleOrDefault();
            //Lấy ra ds sản phẩm của bill
            var ListSP = database.ProductListCheckouts.Where(a => a.DonHang_id == id).ToList();            

            Bill bill = new Bill();
            bill.listSp = ListSP;
            bill.DonHang = DonHang;
            bill.Total = bill.TotalToCurrency((int)DonHang.Total);
            //bill.dsSanPham = dsSanPham;            
            TempData["IdDonHang"] = id;
            return View(bill);
        }

        //Log out
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Login", "Admin");
        }
        //------------------------------------
        //------------- Http Post ------------

        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            var check = database.Accounts.Where(a => a.Account_user == email && a.Account_password == password).SingleOrDefault();
            if(check !=null)
            {
                Session["admin"] = check;
                return RedirectToAction("Index","Admin");
            }
            TempData["ErrorLogin"] = "Sai tên tài khoản hoặc mật khẩu !";
            return View("Login");
        }

        //Thêm sản phẩm
        [HttpPost]
        public ActionResult ThemSanPham(SanPham sp, SanPhamDetail spDetail ,string name, string desc, int price, int tyleID, string imageUploader, string imageUploader2, string imageUploader3, string imageUploader4, string imageUploader5)
        {
            if (sp.imageUploader != null)
            {
                var check = database.SanPhams.Where(a => a.SanPham_Name == name).SingleOrDefault();
                if (check == null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(sp.imageUploader.FileName);
                    string extension = Path.GetExtension(sp.imageUploader.FileName);
                    fileName = fileName + extension;
                    string fileName2 = Path.GetFileNameWithoutExtension(sp.imageUploader2.FileName);
                    string extension2 = Path.GetExtension(sp.imageUploader2.FileName);
                    fileName2 = fileName2 + extension2;
                    string fileName3 = Path.GetFileNameWithoutExtension(sp.imageUploader3.FileName);
                    string extension3 = Path.GetExtension(sp.imageUploader3.FileName);
                    fileName3 = fileName3 + extension3;
                    string fileName4 = Path.GetFileNameWithoutExtension(sp.imageUploader4.FileName);
                    string extension4 = Path.GetExtension(sp.imageUploader4.FileName);
                    fileName4 = fileName4 + extension4;
                    string fileName5 = Path.GetFileNameWithoutExtension(sp.imageUploader5.FileName);
                    string extension5 = Path.GetExtension(sp.imageUploader5.FileName);
                    fileName5 = fileName5 + extension5;

                    sp.Main_img = "~/Content/Image_SanPham/" + fileName;
                    sp.Img1 = "~/Content/Image_SanPham/" + fileName2;
                    sp.Img2 = "~/Content/Image_SanPham/" + fileName3;
                    sp.Img3 = "~/Content/Image_SanPham/" + fileName4;
                    sp.Img4 = "~/Content/Image_SanPham/" + fileName5;
                    sp.imageUploader.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName));

                    sp.imageUploader2.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName2));
                    sp.imageUploader3.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName3));
                    sp.imageUploader4.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName4));
                    sp.imageUploader5.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName5));
                    sp.SanPham_Name = name;
                    sp.SanPham_description = desc;
                    sp.SanPham_Price = price;
                    sp.SetStringPrice();
                    sp.SanPham_priceSale = 0;
                    sp.SoLuong = 0;
                    sp.Type_SanPham_id = tyleID;
                    sp.Sale_key = false;
                    //sp.SanPhamDetail_id = sp.SanPham_Id;
                    database.SanPhams.Add(sp);
                    //Thêm sản phẩm detail
                    database.SaveChanges();
                    spDetail.S = 0;
                    spDetail.M = 0;
                    spDetail.L = 0;
                    spDetail.XL = 0;
                    spDetail.XXL = 0;
                    database.SanPhamDetails.Add(spDetail);              
                    database.SaveChanges();

                    sp.SanPhamDetail_id = spDetail.SanPhamDetail_id;
                    database.Entry(sp).State = System.Data.Entity.EntityState.Modified;
                    database.SaveChanges();
                    TempData["AddProductSuss"] = 1;
                }
            }

            return RedirectToAction("ProductManagement", "Admin");
        }
        

        // Sửa sản phẩm
        [HttpPost]
        public ActionResult ProductDetail(int id, SanPham sp, string imageUploader, string imageUploader2, string imageUploader3, string imageUploader4, string imageUploader5, int typeID, string name, string desc, int price)
        {
            sp = database.SanPhams.Where(a => a.SanPham_Id == id).SingleOrDefault();
            sp.Main_img = "~/Content/Image_SanPham/" + imageUploader;
            sp.Img1 = "~/Content/Image_SanPham/" + imageUploader2;
            sp.Img2 = "~/Content/Image_SanPham/" + imageUploader3;
            sp.Img3 = "~/Content/Image_SanPham/" + imageUploader4;
            sp.Img4 = "~/Content/Image_SanPham/" + imageUploader5;
            sp.SanPham_Name = name;
            sp.SanPham_description = desc;
            sp.SanPham_Price = price;
            sp._SetStringPrice(price);
            //sp.SanPham_priceSale = priceSales;
            sp.Type_SanPham_id = typeID;
            database.Entry(sp).State = System.Data.Entity.EntityState.Modified;
            database.SaveChanges();
            ViewBag.EditThanhCong = "Chỉnh sửa thành công!";
            return RedirectToAction("ProductDetail", "Admin");
        }
        //Xóa Sản phẩm
        public ActionResult XoaSanPham(int id)
        {
            var delSanpham = database.SanPhams.Where(a => a.SanPham_Id == id).SingleOrDefault();
            database.SanPhams.Remove(delSanpham);
            database.SaveChanges();
            return RedirectToAction("ProductManagement", "Admin");
        }

        //Add Size
        [HttpPost]
        public ActionResult AddSize(string size, int soLuong)
        {
            int id = int.Parse(TempData["IdProductDetai"].ToString());
            var ProductDetail = database.SanPhams.Where(a => a.SanPham_Id == id).SingleOrDefault();
            var item = database.SanPhamDetails.Where(a => a.SanPhamDetail_id == ProductDetail.SanPhamDetail_id).SingleOrDefault();
            switch (size)
            {
                case "S":
                    item.S = item.S+soLuong;
                    ProductDetail.SoLuong+=soLuong;
                    database.Entry(ProductDetail).State = System.Data.Entity.EntityState.Modified;
                    database.Entry(item).State = System.Data.Entity.EntityState.Modified;
                    database.SaveChanges();
                    break;
                case "M":
                    item.M = item.M + soLuong;
                    ProductDetail.SoLuong +=soLuong;
                    database.Entry(ProductDetail).State = System.Data.Entity.EntityState.Modified;
                    database.Entry(item).State = System.Data.Entity.EntityState.Modified;
                    database.SaveChanges();
                    break;
                case "L":
                    item.L = item.L + soLuong;
                    ProductDetail.SoLuong +=soLuong;
                    database.Entry(ProductDetail).State = System.Data.Entity.EntityState.Modified;
                    database.Entry(item).State = System.Data.Entity.EntityState.Modified;
                    database.SaveChanges();
                    break;
                case "XL":
                    item.XL = item.XL + soLuong;
                    ProductDetail.SoLuong +=soLuong;
                    database.Entry(ProductDetail).State = System.Data.Entity.EntityState.Modified;
                    database.Entry(item).State = System.Data.Entity.EntityState.Modified;
                    database.SaveChanges();
                    break;
                case "XXL":
                    item.XXL = item.XXL + soLuong;
                    ProductDetail.SoLuong +=soLuong;
                    database.Entry(ProductDetail).State = System.Data.Entity.EntityState.Modified;
                    database.Entry(item).State = System.Data.Entity.EntityState.Modified;
                    database.SaveChanges();
                    break;
            }

            return Redirect("/Admin/Admin/ProductDetail/"+id);
        }



        public ActionResult ConfirmBill(int id)
        {
            var item = database.DonHangs.Where(a => a.DonHang_id == id).SingleOrDefault();
            item.TinhTrangDonHang_id = 2;
            database.Entry(item).State = System.Data.Entity.EntityState.Modified;
            database.SaveChanges();
            TempData["ConfirmBill"] = 2;            
            return RedirectToAction("Order","Admin");
        }
        public ActionResult GoShip(int id)
        {
            var item = database.DonHangs.Where(a => a.DonHang_id == id).SingleOrDefault();
            item.TinhTrangDonHang_id = 3;
            database.Entry(item).State = System.Data.Entity.EntityState.Modified;
            database.SaveChanges();
            TempData["GoShip"] = 3;
            return RedirectToAction("Order", "Admin");
        }
        public ActionResult ShipSuss(int id)
        {
            var item = database.DonHangs.Where(a => a.DonHang_id == id).SingleOrDefault();
            item.TinhTrangDonHang_id = 4;
            database.Entry(item).State = System.Data.Entity.EntityState.Modified;
            database.SaveChanges();
            TempData["ShipSuss"] = 4;
            return RedirectToAction("Order", "Admin");
        }
    }
}