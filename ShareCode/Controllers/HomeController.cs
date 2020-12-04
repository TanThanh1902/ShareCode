using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;

namespace ShareCode.Controllers
{
    public class HomeController : Controller
    {
        DBShareCodeEntities db = new DBShareCodeEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Top8Cat()
        {
            List<tblCategory> categories = db.tblCategories.Take(10).ToList();
            return PartialView(categories);
        }
    }
}