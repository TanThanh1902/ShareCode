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
    public class tblOrdersAdminController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();

        // GET: Admin/tblOrdersAdmin
        public ActionResult Index()
        {
            var tblOrders = db.tblOrders.Include(t => t.tblPost).Include(t => t.tblUser);
            return View(tblOrders.ToList());
        }

        // GET: Admin/tblOrdersAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblOrder tblOrder = db.tblOrders.Find(id);
            if (tblOrder == null)
            {
                return HttpNotFound();
            }
            return View(tblOrder);
        }

        // GET: Admin/tblOrdersAdmin/Create
        public ActionResult Create()
        {
            ViewBag.Order_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title");
            ViewBag.Order_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName");
            return View();
        }

        // POST: Admin/tblOrdersAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Order_ID,Order_User,Order_TotalPrice,Order_Post,Order_DateAdd")] tblOrder tblOrder)
        {
            if (ModelState.IsValid)
            {
                db.tblOrders.Add(tblOrder);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Order_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblOrder.Order_Post);
            ViewBag.Order_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblOrder.Order_User);
            return View(tblOrder);
        }

        // GET: Admin/tblOrdersAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblOrder tblOrder = db.tblOrders.Find(id);
            if (tblOrder == null)
            {
                return HttpNotFound();
            }
            ViewBag.Order_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblOrder.Order_Post);
            ViewBag.Order_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblOrder.Order_User);
            return View(tblOrder);
        }

        // POST: Admin/tblOrdersAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Order_ID,Order_User,Order_TotalPrice,Order_Post,Order_DateAdd")] tblOrder tblOrder)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblOrder).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Order_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblOrder.Order_Post);
            ViewBag.Order_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblOrder.Order_User);
            return View(tblOrder);
        }

        // GET: Admin/tblOrdersAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblOrder tblOrder = db.tblOrders.Find(id);
            if (tblOrder == null)
            {
                return HttpNotFound();
            }
            return View(tblOrder);
        }

        // POST: Admin/tblOrdersAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblOrder tblOrder = db.tblOrders.Find(id);
            db.tblOrders.Remove(tblOrder);
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
