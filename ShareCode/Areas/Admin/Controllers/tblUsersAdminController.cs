using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;

namespace ShareCode.Areas.Admin.Controllers
{
    public class tblUsersAdminController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();

        // GET: Admin/tblUsersAdmin
        public ActionResult Index()
        {
            var tblUsers = db.tblUsers.Include(t => t.tblRole);
            return View(tblUsers.ToList());
        }

        // GET: Admin/tblUsersAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            return View(tblUser);
        }

        // GET: Admin/tblUsersAdmin/Create
        public ActionResult Create()
        {
            ViewBag.User_Role = new SelectList(db.tblRoles, "Role_ID", "Role_Name");
            return View();
        }

        // POST: Admin/tblUsersAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "User_ID,User_DisplayName,User_Password,User_DateLogin,User_Active,User_Trash,User_Token,User_Role,User_Email,User_Avata,User_VIP,User_Phone,User_Point,User_Coin")] tblUser tblUser)
        {
            if (ModelState.IsValid)
            {
                db.tblUsers.Add(tblUser);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.User_Role = new SelectList(db.tblRoles, "Role_ID", "Role_Name", tblUser.User_Role);
            return View(tblUser);
        }

        // GET: Admin/tblUsersAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            ViewBag.User_Role = new SelectList(db.tblRoles, "Role_ID", "Role_Name", tblUser.User_Role);
            return View(tblUser);
        }

        // POST: Admin/tblUsersAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "User_ID,User_DisplayName,User_Password,User_DateLogin,User_Active,User_Trash,User_Token,User_Role,User_Email,User_Avata,User_VIP,User_Phone,User_Point,User_Coin")] tblUser tblUser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.User_Role = new SelectList(db.tblRoles, "Role_ID", "Role_Name", tblUser.User_Role);
            return View(tblUser);
        }

        // GET: Admin/tblUsersAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            return View(tblUser);
        }

        // POST: Admin/tblUsersAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblUser tblUser = db.tblUsers.Find(id);
            db.tblUsers.Remove(tblUser);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
