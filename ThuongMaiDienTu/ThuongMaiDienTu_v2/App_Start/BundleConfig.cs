using System.Web;
using System.Web.Optimization;

namespace ThuongMaiDienTu_v2
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/bundles/css").Include(
                      "~/Resources/css/reset.css",
                      "~/Resources/css/style.css"));

            bundles.Add(new ScriptBundle("~/bundles/script").Include(
                "~/Resources/js/script.js",                
                "~/Resources/js/validator.js"));

            bundles.Add(new ScriptBundle("~/bundles/CountdownScript").Include(                
                "~/Resources/js/countdown.js"                
                ));

            bundles.Add(new ScriptBundle("~/bundles/SlideShow").Include(
                "~/Resources/js/changeSlideImg.js"
                ));


            //---------------------------------
            //----------- Admin ---------------
            //---------------------------------

            bundles.Add(new StyleBundle("~/bundles/admin/css").Include(
                      "~/Areas/Admin/Resources/vendors/bootstrap/dist/css/bootstrap.min.css",
                      "~/Areas/Admin/Resources/vendors/font-awesome/css/font-awesome.min.css",
                      "~/Areas/Admin/Resources/vendors/themify-icons/css/themify-icons.css",
                      "~/Areas/Admin/Resources/vendors/flag-icon-css/css/flag-icon.min.css",
                      "~/Areas/Admin/Resources/vendors/selectFX/css/cs-skin-elastic.css",

                      "~/Areas/Admin/Resources/vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css",
                       "~/Areas/Admin/Resources/vendors/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css",

                      "~/Areas/Admin/Resources/assets/css/style.css",
                      "~/Areas/Admin/Resources/vendors/jqvmap/dist/jqvmap.min.css"));


            //Layout Script
            bundles.Add(new ScriptBundle("~/bundles/LayoutScript").Include(
                "~/Areas/Admin/Resources/vendors/jquery/dist/jquery.min.js",
                "~/Areas/Admin/Resources/vendors/popper.js/dist/umd/popper.min.js",
                "~/Areas/Admin/Resources/vendors/bootstrap/dist/js/bootstrap.min.js",
                "~/Areas/Admin/Resources/assets/js/main.js"
                ));

            //Table Script
            bundles.Add(new ScriptBundle("~/bundles/TableScript").Include(
                "~/Areas/Admin/Resources/assets/js/modal.js",
                "~/Areas/Admin/Resources/assets/js/TableScript.js"
                ));

            //bundles.Add(new ScriptBundle("~/bundles/ToPrice").Include(
            //   "~/Areas/Admin/Resources/assets/js/modal.js",
            //   "~/Areas/Admin/Resources/assets/js/TableScript.js"
            //   ));
        }
        
    }
}
