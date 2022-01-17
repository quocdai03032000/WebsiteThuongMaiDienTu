using Commom;
using Newtonsoft.Json.Linq;
using PagedList;
using PagedList.Mvc;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThuongMaiDienTu_v2.Models;
using ThuongMaiDienTu_v2.Momo;


namespace ThuongMaiDienTu_v2.Controllers
{
    public class UserController : Controller
    {
        ThuongMaiDienTuEntities database = new ThuongMaiDienTuEntities();

        // Index
        public ActionResult Index()
        {
            TempData["ReturnUrl"] = "Index";

            var Product = database.SanPhams.ToList().OrderByDescending(a => a.SanPham_Id).ToList().ToArray();
            var Product2 = database.SanPhams.ToList().ToArray();

            SanPham[] NewProduct = new SanPham[4];
            SanPham[] LikeProduct = new SanPham[4];

            var viewModel = new ViewModel();
            for (int i = 0; i < 4; i++)
            {
                NewProduct[i] = Product[i];
                LikeProduct[i] = Product2[i];
            }
            
            viewModel.NewProduct = NewProduct.ToList();
            viewModel.LikeProduct = LikeProduct.ToList();
            
            return View(viewModel);
        }

        // All Product
        public ActionResult AllProduct(int? page)
        {
            TempData["ReturnUrl"] = "AllProduct";
            var Product = database.SanPhams.ToList().OrderByDescending(a => a.SanPham_Id).ToList();
            int pageSize = 12;
            int pageNum = (page ?? 1);
            return View(Product.ToPagedList(pageNum, pageSize));
        }

        public ActionResult TeeProduct()
        {
            TempData["ReturnUrl"] = "TeeProduct";
            var Product = database.SanPhams.Where(a => a.Type_SanPham_id == 1);
            return View(Product);
        }

        public ActionResult PantProduct()
        {
            TempData["ReturnUrl"] = "PantProduct";
            var Product = database.SanPhams.Where(a => a.Type_SanPham_id == 2);
            return View(Product);
        }

        public ActionResult JacketProduct()
        {
            TempData["ReturnUrl"] = "JacketProduct";
            var Product = database.SanPhams.Where(a => a.Type_SanPham_id == 3);
            return View(Product);
        }

        public ActionResult AccessoryProduct()
        {
            TempData["ReturnUrl"] = "AccessoryProduct";
            var Product = database.SanPhams.Where(a => a.Type_SanPham_id == 4);
            return View(Product);
        }

        // Product detail
        public ActionResult ProductDetail(int id)
        {
            TempData["ReturnUrl"] = "ProductDetail";
            var detail = database.SanPhams.Where(a => a.SanPham_Id == id).SingleOrDefault();
            ViewBag.ProductDetail = detail;
            TempData["ProductDetail"] = id;
            return View();
        }       


        // Checkout
        public ActionResult Checkout()
        {
            //TempData["ReturnUrl"] = "Checkout";
            //return View();
            //--------------------------------------

            Cart ca = Session["Cart"] as Cart;
            // Đặt hàng khi chưa login
            if (Session["User"] == null)
            {
                TempData["ReturnUrl"] = "Checkout";

                return View(ca);

            }
            else if (Session["User"] != null)
            {
                TempData["ReturnUrl"] = "Checkout";

                Account user = Session["User"] as Account;

                /* account = database.Accounts.Where(a => a.Account_user == user).SingleOrDefault();*/
                Infor infoccount = database.Infors.Where(b => b.Account_id == user.id).SingleOrDefault();

                ViewBag.diachitinh = infoccount.TinhThanh;
                ViewBag.diachihuyen = infoccount.QuanHuyen;
                ViewBag.phuongxa = infoccount.PhuongXa;
                ViewBag.tenKH = infoccount.Name;
                ViewBag.sdtKH = infoccount.Phone;
                ViewBag.diachiKH = infoccount.DiaChi;
                ViewBag.emailKH = user.Account_user;
            }
            return View(ca);
        }

        public ActionResult Payment(string name, string email, string diachi, string sodienthoai, string calc_shipping_provinces, string calc_shipping_district, string phuongxa, string payment)
        {
            //Lưu Thông Tin đơn hàng
            BillDemo billDemo = new BillDemo();
            billDemo.name = name;
            billDemo.email = email;
            billDemo.diachi = email;
            billDemo.sodienthoai = sodienthoai;
            billDemo.calc_shipping_provinces = calc_shipping_provinces;
            billDemo.calc_shipping_district = calc_shipping_district;
            billDemo.phuongxa = phuongxa;
            Session["billDemo"] = billDemo;


            Cart cart = Session["Cart"] as Cart;
            string total = cart.Total.ToString();
            if (payment == "momo")
            {
                //request params need to request to MoMo system
                string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
                string partnerCode = "MOMOK2RA20220110";
                string accessKey = "sP0Km9bblZXsA7qd";
                string serectkey = "lbTW63bM58jtMSuH4U0GIBnqwSllLcae";
                string orderInfo = "Thanh toan online";
                string returnUrl = "https://localhost:44394/Home/ConfirmPaymentClient";
                string notifyurl = "http://ba1adf48beba.ngrok.io/Home/SavePayment"; //lưu ý: notifyurl không được sử dụng localhost, có thể sử dụng ngrok để public localhost trong quá trình test

                string amount = total;
                string orderid = DateTime.Now.Ticks.ToString();
                string requestId = DateTime.Now.Ticks.ToString();
                string extraData = "";

                //Before sign HMAC SHA256 signature
                string rawHash = "partnerCode=" +
                    partnerCode + "&accessKey=" +
                    accessKey + "&requestId=" +
                    requestId + "&amount=" +
                    amount + "&orderId=" +
                    orderid + "&orderInfo=" +
                    orderInfo + "&returnUrl=" +
                    returnUrl + "&notifyUrl=" +
                    notifyurl + "&extraData=" +
                    extraData;

                MoMoSecurity crypto = new MoMoSecurity();
                //sign signature SHA256
                string signature = crypto.signSHA256(rawHash, serectkey);

                //build body json request
                JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }

                };

                string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());

                JObject jmessage = JObject.Parse(responseFromMomo);

                return Redirect(jmessage.GetValue("payUrl").ToString());

            }
            else if(payment=="cod")
            {   //add đơn k login             
                if (Session["User"] == null)
                {
                    int aa = cart.Items.Count();
                    DonHang donhang = new DonHang();
                    DonHangInfor dhinfo = new DonHangInfor();

                    // add đơn hàng
                    donhang.NgayGio = DateTime.Now;
                    donhang.TinhTrangDonHang_id = 1;
                    donhang.PhuongThucThanhToan = "COD";
                    donhang.TinhTrangThanhToan = "Chưa thanh toán";
                    donhang.Total = cart.Total;
                    database.DonHangs.Add(donhang);

                    // add đơn hàng infor
                    dhinfo.HoTen = name;
                    dhinfo.Email = email;
                    dhinfo.DiaChi = diachi;
                    dhinfo.Sdt = sodienthoai;
                    dhinfo.TinhThanh = calc_shipping_provinces;
                    dhinfo.QuanHuyen = calc_shipping_district;
                    dhinfo.PhuongXa = phuongxa;
                    database.DonHangInfors.Add(dhinfo);

                    donhang.DonHangInfor_id = dhinfo.DonHangInfor_id;
                    database.SaveChanges();

                    // add ds sản phẩm đã đặt
                    foreach (var item in cart.Items)
                    {

                        var sanpham = database.SanPhams.FirstOrDefault(a => a.SanPham_Id == item.sp.SanPham_Id);
                        var sanphamDetail = database.SanPhamDetails.FirstOrDefault(a => a.SanPhamDetail_id == sanpham.SanPhamDetail_id);
                        if (item.Size.Contains("S") && sanphamDetail.S > 0)
                        {
                            sanphamDetail.S -= item.SoLuong;
                        }
                        if (item.Size.Contains("M") && sanphamDetail.M > 0)
                        {
                            sanphamDetail.M -= item.SoLuong;
                        }
                        if (item.Size.Contains("L") && sanphamDetail.L > 0)
                        {
                            sanphamDetail.L -= item.SoLuong;
                        }
                        if (item.Size.Contains("XL") && sanphamDetail.XL > 0)
                        {
                            sanphamDetail.XL -= item.SoLuong;
                        }
                        if (item.Size.Contains("XXL") && sanphamDetail.XXL > 0)
                        {
                            sanphamDetail.XXL -= item.SoLuong;
                        }
                        sanpham.SoLuong -= item.SoLuong;

                        ProductListCheckout proList = new ProductListCheckout();
                        proList.DonHang_id = donhang.DonHang_id;
                        proList.SanPham_id = item.sp.SanPham_Id;
                        proList.SoLuong = item.SoLuong;
                        proList.Size = item.Size;
                        proList.Price = item.sp.SanPham_Price * item.SoLuong;
                        proList.StringPrice = item.TotalxSoLuong;
                        database.ProductListCheckouts.Add(proList);
                        database.SaveChanges();

                    }
                }
                //add đơn khi login
                else
                {
                    int aa = cart.Items.Count();
                    DonHang donhang = new DonHang();
                    DonHangInfor dhinfo = new DonHangInfor();
                    Account user = Session["User"] as Account;
                    // add đơn hàng
                    donhang.NgayGio = DateTime.Now;
                    donhang.Account_ID = user.id;
                    donhang.TinhTrangDonHang_id = 1;
                    donhang.PhuongThucThanhToan = "COD";
                    donhang.TinhTrangThanhToan = "Chưa thanh toán";
                    donhang.Total = cart.Total;
                    database.DonHangs.Add(donhang);

                    // add đơn hàng infor
                    dhinfo.HoTen = name;
                    dhinfo.Email = email;
                    dhinfo.DiaChi = diachi;
                    dhinfo.Sdt = sodienthoai;
                    dhinfo.TinhThanh = calc_shipping_provinces;
                    dhinfo.QuanHuyen = calc_shipping_district;
                    dhinfo.PhuongXa = phuongxa;
                    database.DonHangInfors.Add(dhinfo);

                    donhang.DonHangInfor_id = dhinfo.DonHangInfor_id;
                    database.SaveChanges();

                    // add ds sản phẩm đã đặt
                    foreach (var item in cart.Items)
                    {

                        var sanpham = database.SanPhams.FirstOrDefault(a => a.SanPham_Id == item.sp.SanPham_Id);
                        var sanphamDetail = database.SanPhamDetails.FirstOrDefault(a => a.SanPhamDetail_id == sanpham.SanPhamDetail_id);
                        if (item.Size.Contains("S") && sanphamDetail.S > 0)
                        {
                            sanphamDetail.S -= item.SoLuong;
                        }
                        if (item.Size.Contains("M") && sanphamDetail.M > 0)
                        {
                            sanphamDetail.M -= item.SoLuong;
                        }
                        if (item.Size.Contains("L") && sanphamDetail.L > 0)
                        {
                            sanphamDetail.L -= item.SoLuong;
                        }
                        if (item.Size.Contains("XL") && sanphamDetail.XL > 0)
                        {
                            sanphamDetail.XL -= item.SoLuong;
                        }
                        if (item.Size.Contains("XXL") && sanphamDetail.XXL > 0)
                        {
                            sanphamDetail.XXL -= item.SoLuong;
                        }
                        sanpham.SoLuong -= item.SoLuong;

                        ProductListCheckout proList = new ProductListCheckout();
                        proList.DonHang_id = donhang.DonHang_id;
                        proList.SanPham_id = item.sp.SanPham_Id;
                        proList.SoLuong = item.SoLuong;
                        proList.Size = item.Size;
                        proList.Price = item.sp.SanPham_Price * item.SoLuong;
                        proList.StringPrice = item.TotalxSoLuong;
                        database.ProductListCheckouts.Add(proList);
                        database.SaveChanges();
                    }
                }
                database.SaveChanges();
                Session["ThanhCong"] = "suss";
                cart.RemoveCartAll();
                return RedirectToAction("Index", "User");
            }
            else
            {
                return View("Checkout");
            }           
        }

        //Hàm add Bill k login
        public void addToBillNoLogin(string name, string email, string diachi, string sodienthoai, string calc_shipping_provinces, string calc_shipping_district, string phuongxa)
        {
            Cart cart = Session["Cart"] as Cart;
            int aa = cart.Items.Count();
            DonHang donhang = new DonHang();
            DonHangInfor dhinfo = new DonHangInfor();

            // add đơn hàng
            donhang.NgayGio = DateTime.Now;
            donhang.TinhTrangDonHang_id = 1;
            donhang.PhuongThucThanhToan = "COD";
            donhang.TinhTrangThanhToan = "Chưa thanh toán";
            donhang.Total = cart.Total;
            database.DonHangs.Add(donhang);

            // add đơn hàng infor
            dhinfo.HoTen = name;
            dhinfo.Email = email;
            dhinfo.DiaChi = diachi;
            dhinfo.Sdt = sodienthoai;
            dhinfo.TinhThanh = calc_shipping_provinces;
            dhinfo.QuanHuyen = calc_shipping_district;
            dhinfo.PhuongXa = phuongxa;
            database.DonHangInfors.Add(dhinfo);

            donhang.DonHangInfor_id = dhinfo.DonHangInfor_id;
            database.SaveChanges();

            // add ds sản phẩm đã đặt
            foreach (var item in cart.Items)
            {
                ProductListCheckout proList = new ProductListCheckout();
                proList.DonHang_id = donhang.DonHang_id;
                proList.SanPham_id = item.sp.SanPham_Id;
                proList.SoLuong = item.SoLuong;
                proList.Size = item.Size;
                proList.Price = item.sp.SanPham_Price * item.SoLuong;
                proList.StringPrice = item.TotalxSoLuong;
                database.ProductListCheckouts.Add(proList);
                database.SaveChanges();
            }

        }
                   




        // Login
        public ActionResult Login()
        {
            return View();
        }

        // Logout        
        public ActionResult Logout()
        {
            Session["User"] = null;
            return RedirectToAction("Index", "User");
        }

        // Register
        public ActionResult Register()
        {
            return View();
        }

        //Contact
        public ActionResult Contact ()
        {
            ViewData["ReturnUrl"] = "AllProduct";
            return View();
        }

        // Cart
        public ActionResult Cart()
        {
            TempData["ReturnUrl"] = "Cart";
            Cart _cart = Session["Cart"] as Cart;
            if (_cart == null)
            {
                return RedirectToAction("CartNull", "User");
            }
            else if(_cart.Items.Count()<1)
            {
                return RedirectToAction("CartNull", "User");
            }
            else
            {
                ViewBag.Currency = GetCart().TotalCurrency;
                return View(_cart);
            }
        }
        public ActionResult CartNull()
        {
            return View();
        }
        //------------------------------
        // Product Child
        //------------------------------

        //------------------------------
        // HTTP POST

        // Login
        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            var check = database.Accounts.Where(a => a.Account_user == email && a.Account_password == password).SingleOrDefault();
            string ReturnUrl;
            if(TempData["ReturnUrl"] == null)
            {
                ReturnUrl = "Index";
            }
            else
            {
                ReturnUrl = TempData["ReturnUrl"].ToString();
            }
            if (check != null)
            {
                Account ac = database.Accounts.Where(a => a.Account_user == email).SingleOrDefault();
                Session["User"] = ac;
                Session["UserInfor"] = database.Infors.Where(a => a.Account_id == ac.id).SingleOrDefault();
                return RedirectToAction(ReturnUrl);
            }
            else
            {
                TempData["ErrorLogin"] = "Sai tên tài khoản hoặc mật khẩu";
                return View("Login");
            }
            
        }        

        // Register
        [HttpPost]
        public ActionResult Register(string name, string phone, string email, string password)
        {
            var check = database.Accounts.Where(a => a.Account_user == email).SingleOrDefault();
            if(check == null)
            {
                Account ac = new Account();                
                ac.Account_user = email;
                ac.Account_password = password;
                ac.Account_role_id = 2;
                database.Accounts.Add(ac);

                Infor infor = new Infor();
                infor.Account_id = ac.id;
                infor.Name = name;
                infor.Phone = phone;

                // Gửi gmail cho khách hàng
                string content = System.IO.File.ReadAllText(Server.MapPath("~/Views/Email/newoder.html"));
                content = content.Replace("{{Email}}", ac.Account_user);
                content = content.Replace("{{Phone}}", phone);

                var toEmail = email;
                new Class1().SendMail(toEmail, "Kích hoạt tài khoản thành công", content);

                database.Infors.Add(infor);
                database.SaveChanges();
                return RedirectToAction("Login", "User");
            }
            else
            {
                TempData["ErrorRegister"] = "Đã tồn tại Email này! Vui lòng đăng ký lại";
                return View("Register");
            }
            
        }

        [HttpPost]
        public ActionResult AddToCart(int size, int soLuong, int id)
        {

            return View("ProductDetail");
        }

        //Giỏ hàng
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }

        
        public ActionResult AddToCart(int soLuong, string size)
        {
            int id = int.Parse(TempData["ProductDetail"].ToString());
            var sp = database.SanPhams.Where(a => a.SanPham_Id == id).SingleOrDefault();
            if(sp!=null)
            {
                if(sp.SoLuong!=0)
                {
                    GetCart().AddToCart(sp, soLuong, size);
                    TempData["AddCartSuss"] = 1;
                    return Redirect("/User/ProductDetail/" + id);
                }
            }
            return View();
        }
        public ActionResult DelCart(int id, string size)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.RemoveCartItem(id,size);
            return RedirectToAction("Cart", "User");
        }



        //--------------------------------------------------
        //Payment
        //--------------------------------------------------

        //public ActionResult Payment()
        //{
        //    //request params need to request to MoMo system
        //    string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
        //    string partnerCode = "MOMOK2RA20220110";
        //    string accessKey = "sP0Km9bblZXsA7qd";
        //    string serectkey = "lbTW63bM58jtMSuH4U0GIBnqwSllLcae";
        //    string orderInfo = "Thanh toan online";
        //    string returnUrl = "https://localhost:44394/Home/ConfirmPaymentClient";
        //    string notifyurl = "http://ba1adf48beba.ngrok.io/Home/SavePayment"; //lưu ý: notifyurl không được sử dụng localhost, có thể sử dụng ngrok để public localhost trong quá trình test

        //    string amount = "1000";
        //    string orderid = DateTime.Now.Ticks.ToString();
        //    string requestId = DateTime.Now.Ticks.ToString();
        //    string extraData = "";

        //    //Before sign HMAC SHA256 signature
        //    string rawHash = "partnerCode=" +
        //        partnerCode + "&accessKey=" +
        //        accessKey + "&requestId=" +
        //        requestId + "&amount=" +
        //        amount + "&orderId=" +
        //        orderid + "&orderInfo=" +
        //        orderInfo + "&returnUrl=" +
        //        returnUrl + "&notifyUrl=" +
        //        notifyurl + "&extraData=" +
        //        extraData;

        //    MoMoSecurity crypto = new MoMoSecurity();
        //    //sign signature SHA256
        //    string signature = crypto.signSHA256(rawHash, serectkey);

        //    //build body json request
        //    JObject message = new JObject
        //    {
        //        { "partnerCode", partnerCode },
        //        { "accessKey", accessKey },
        //        { "requestId", requestId },
        //        { "amount", amount },
        //        { "orderId", orderid },
        //        { "orderInfo", orderInfo },
        //        { "returnUrl", returnUrl },
        //        { "notifyUrl", notifyurl },
        //        { "extraData", extraData },
        //        { "requestType", "captureMoMoWallet" },
        //        { "signature", signature }

        //    };

        //    string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());

        //    JObject jmessage = JObject.Parse(responseFromMomo);

        //    return Redirect(jmessage.GetValue("payUrl").ToString());
        //}

        public ActionResult ConfirmPaymentClient()
        {
            //hiển thị thông báo cho người dùng
            return View();
        }

        [HttpPost]
        public void SavePayment()
        {
            //cập nhật dữ liệu vào db
            BillDemo billDemo = Session["billDemo"] as BillDemo;
            addToBillNoLogin(billDemo.name,billDemo.email,billDemo.diachi,billDemo.sodienthoai, billDemo.calc_shipping_provinces, billDemo.calc_shipping_district,billDemo.phuongxa);
        }

        //Payment Paypal
        //Payment
        private Payment payment;

        //Create a payment using APIContext
        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            var lstItems = new ItemList() { items = new List<Item>() };
            Cart cart = Session["Cart"] as Cart;

            foreach (var item in cart.Items)
            {
                lstItems.items.Add(new Item()
                {
                    name = item.sp.SanPham_Name,
                    currency = "USD",
                    price = (item.sp.SanPham_Price / 23000).ToString(),
                    quantity = item.SoLuong.ToString(),
                    sku = "sku"
                });
            }

            var payer = new Payer() { payment_method = "paypal" };

            //Do the configuration RedirectURLs here
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl,
                return_url = redirectUrl
            };

            //Create details object
            var details = new Details()
            {
                tax = "1",
                shipping = "2",
                subtotal = (cart.Items.Sum(a => a.sp.SanPham_Price * a.SoLuong) / 23000).ToString()
            };

            //Create amount object
            var amount = new Amount()
            {
                currency = "USD",
                total = (Convert.ToDouble(details.tax) + Convert.ToDouble(details.shipping) + Convert.ToDouble(details.subtotal)).ToString(), //tax + shipping + subtotal
                details = details
            };

            //Create transaction
            var transactionList = new List<PayPal.Api.Transaction>();
            transactionList.Add(new PayPal.Api.Transaction()
            {
                description = "Testing Transaction - NamLe",
                invoice_number = Convert.ToString((new Random()).Next(100000)),
                amount = amount,
                item_list = lstItems
            });

            payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };

            return payment.Create(apiContext);
        }

        //Create Execute Payment method
        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };

            payment = new Payment() { id = paymentId };
            return payment.Execute(apiContext, paymentExecution);
        }

        //Create Payment with Paypal
        public ActionResult PaymentWithPaypal()
        {
            APIContext apiContext = PaypalConfiguration.GetAPIContext();

            try
            {
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    //create Payment
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/User/PaymentWithPaypal?";
                    var guid = Convert.ToString((new Random()).Next(100000));
                    var createPayment = CreatePayment(apiContext, baseURI + "guid=" + guid);

                    //get links returned from paypal respone to create call function
                    var links = createPayment.links.GetEnumerator();
                    string paypalRedirectUrl = string.Empty;

                    while (links.MoveNext())
                    {
                        Links link = links.Current;
                        if (link.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            paypalRedirectUrl = link.href;
                        }
                    }
                    Session.Add(guid, createPayment.id);
                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    //this one will be execute when we have received all the payment params from previous call
                    var guid = Request.Params["guid"];
                    var executePayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    if (executePayment.state.ToLower() != "approved")
                    {
                        Session.Remove("Cart");
                        return View("Failure");
                    }
                }
            }
            catch (Exception ex)
            {
                PaypalLogger.Log("Error : " + ex.Message);
                Session.Remove("Cart");
                return View("Failure");
            }

            Session.Remove("Cart");
            return View("Success");
        }
    }
}