using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;

namespace ShareCode.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        DBShareCodeEntities db = new DBShareCodeEntities();
        // GET: Admin/HomeAdmin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string us, string pa)
        {
            tblUser user = db.tblUsers.FirstOrDefault(t => t.User_Email == us && t.User_Password == pa && t.User_Role == 1);
            if(user != null)
            {
                HttpCookie cookie = new HttpCookie("member_id", user.User_ID.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);
                return RedirectToAction("Index");
            }
            return View();
        }
    }
}