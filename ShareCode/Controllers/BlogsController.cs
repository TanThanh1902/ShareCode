using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;
using PagedList;
using PagedList.Mvc;

namespace ShareCode.Controllers
{
    public class BlogsController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();
        private const int PAGE_SIZE = 7;
        // GET: Blogs
        public ActionResult Index(int? page)
        {
            return View(db.tblBlogs.Where(t => t.Blog_Trash == false).OrderByDescending(t => t.BLog_DatePost).ToPagedList(page ?? 1, PAGE_SIZE));
        }

        // GET: Blogs/Details/5
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

        // GET: Blogs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Blogs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BLog_ID,Blog_Title,Blog_Contents,BLog_Tag,Blog_View,BLog_DatePost")] tblBlog tblBlog)
        {
            if (ModelState.IsValid)
            {
                db.tblBlogs.Add(tblBlog);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblBlog);
        }

        // GET: Blogs/Edit/5
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

        // POST: Blogs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BLog_ID,Blog_Title,Blog_Contents,BLog_Tag,Blog_View,BLog_DatePost")] tblBlog tblBlog)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblBlog).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblBlog);
        }

        // GET: Blogs/Delete/5
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

        // POST: Blogs/Delete/5
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
