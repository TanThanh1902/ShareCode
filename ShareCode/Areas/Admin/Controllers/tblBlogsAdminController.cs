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
    public class tblBlogsAdminController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();

        // GET: Admin/tblBlogsAdmin
        public ActionResult Index()
        {
            return View(db.tblBlogs.ToList());
        }

        // GET: Admin/tblBlogsAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblBlog tblBlog = db.tblBlogs.Find(id);
            if (tblBlog == null)
            {
                return HttpNotFound();
            }
            return View(tblBlog);
        }

        // GET: Admin/tblBlogsAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/tblBlogsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BLog_ID,Blog_Title,Blog_Contents,BLog_Tag,Blog_View,BLog_DatePost,Blog_Image,Blog_Trash")] tblBlog tblBlog)
        {
            if (ModelState.IsValid)
            {
                db.tblBlogs.Add(tblBlog);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblBlog);
        }

        // GET: Admin/tblBlogsAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblBlog tblBlog = db.tblBlogs.Find(id);
            if (tblBlog == null)
            {
                return HttpNotFound();
            }
            return View(tblBlog);
        }

        // POST: Admin/tblBlogsAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BLog_ID,Blog_Title,Blog_Contents,BLog_Tag,Blog_View,BLog_DatePost,Blog_Image,Blog_Trash")] tblBlog tblBlog)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblBlog).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblBlog);
        }

        // GET: Admin/tblBlogsAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblBlog tblBlog = db.tblBlogs.Find(id);
            if (tblBlog == null)
            {
                return HttpNotFound();
            }
            return View(tblBlog);
        }

        // POST: Admin/tblBlogsAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblBlog tblBlog = db.tblBlogs.Find(id);
            db.tblBlogs.Remove(tblBlog);
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
