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
    public class tblReportsAdminController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();

        // GET: Admin/tblReportsAdmin
        public ActionResult Index()
        {
            var tblReports = db.tblReports.Include(t => t.tblBlog).Include(t => t.tblPost);
            return View(tblReports.ToList());
        }

        // GET: Admin/tblReportsAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblReport tblReport = db.tblReports.Find(id);
            if (tblReport == null)
            {
                return HttpNotFound();
            }
            return View(tblReport);
        }

        // GET: Admin/tblReportsAdmin/Create
        public ActionResult Create()
        {
            ViewBag.Report_Blog = new SelectList(db.tblBlogs, "BLog_ID", "Blog_Title");
            ViewBag.Report_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title");
            return View();
        }

        // POST: Admin/tblReportsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Report_ID,Report_Contents,Report_DateSend,Report_User,Report_Blog,Report_Post")] tblReport tblReport)
        {
            if (ModelState.IsValid)
            {
                db.tblReports.Add(tblReport);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Report_Blog = new SelectList(db.tblBlogs, "BLog_ID", "Blog_Title", tblReport.Report_Blog);
            ViewBag.Report_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblReport.Report_Post);
            return View(tblReport);
        }

        // GET: Admin/tblReportsAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblReport tblReport = db.tblReports.Find(id);
            if (tblReport == null)
            {
                return HttpNotFound();
            }
            ViewBag.Report_Blog = new SelectList(db.tblBlogs, "BLog_ID", "Blog_Title", tblReport.Report_Blog);
            ViewBag.Report_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblReport.Report_Post);
            return View(tblReport);
        }

        // POST: Admin/tblReportsAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Report_ID,Report_Contents,Report_DateSend,Report_User,Report_Blog,Report_Post")] tblReport tblReport)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblReport).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Report_Blog = new SelectList(db.tblBlogs, "BLog_ID", "Blog_Title", tblReport.Report_Blog);
            ViewBag.Report_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblReport.Report_Post);
            return View(tblReport);
        }

        // GET: Admin/tblReportsAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblReport tblReport = db.tblReports.Find(id);
            if (tblReport == null)
            {
                return HttpNotFound();
            }
            return View(tblReport);
        }

        // POST: Admin/tblReportsAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblReport tblReport = db.tblReports.Find(id);
            db.tblReports.Remove(tblReport);
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
