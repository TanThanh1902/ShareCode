using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;

namespace ShareCode.Areas.Admin.Controllers
{
    public class SettingController : Controller
    {
        DBShareCodeEntities db = new DBShareCodeEntities();
        // GET: Admin/Setting
        public ActionResult EditHome()
        {
            tblCustom custom = db.tblCustoms.Find(1);
            return View(custom);
        }
        [HttpPost]
        public ActionResult EditHome([Bind(Include = "Custom_ID,ct_01,ct_02,ct_03,ct_04,ct_05,ct_06")] tblCustom custom)
        {
            if (ModelState.IsValid)
            {
                db.Entry(custom).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            return View(custom);
        }
    }
}