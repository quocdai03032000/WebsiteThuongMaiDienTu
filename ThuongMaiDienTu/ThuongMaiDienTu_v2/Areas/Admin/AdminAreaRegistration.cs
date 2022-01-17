﻿using System.Web.Mvc;

namespace ThuongMaiDienTu_v2.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                "Admin",
                "Admin/{controller}/{action}/{id}",
                new { Controller = "Admin", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}