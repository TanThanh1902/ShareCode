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
    public class tblCommentsAdminController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();

        // GET: Admin/tblCommentsAdmin
        public ActionResult Index()
        {
            var tblComments = db.tblComments.Include(t => t.tblBlog).Include(t => t.tblPost).Include(t => t.tblUser);
            return View(tblComments.ToList());
        }

        // GET: Admin/tblCommentsAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblComment tblComment = db.tblComments.Find(id);
            if (tblComment == null)
            {
                return HttpNotFound();
            }
            return View(tblComment);
        }

        // GET: Admin/tblCommentsAdmin/Create
        public ActionResult Create()
        {
            ViewBag.Comment_Blog = new SelectList(db.tblBlogs, "BLog_ID", "Blog_Title");
            ViewBag.Comment_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title");
            ViewBag.Comment_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName");
            return View();
        }

        // POST: Admin/tblCommentsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Comment_ID,Comment_Contents,Comment_User,Comment_DatePost,Comment_Blog,Comment_Post,Comment_Trash")] tblComment tblComment)
        {
            if (ModelState.IsValid)
            {
                db.tblComments.Add(tblComment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Comment_Blog = new SelectList(db.tblBlogs, "BLog_ID", "Blog_Title", tblComment.Comment_Blog);
            ViewBag.Comment_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblComment.Comment_Post);
            ViewBag.Comment_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblComment.Comment_User);
            return View(tblComment);
        }

        // GET: Admin/tblCommentsAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblComment tblComment = db.tblComments.Find(id);
            if (tblComment == null)
            {
                return HttpNotFound();
            }
            ViewBag.Comment_Blog = new SelectList(db.tblBlogs, "BLog_ID", "Blog_Title", tblComment.Comment_Blog);
            ViewBag.Comment_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblComment.Comment_Post);
            ViewBag.Comment_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblComment.Comment_User);
            return View(tblComment);
        }

        // POST: Admin/tblCommentsAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Comment_ID,Comment_Contents,Comment_User,Comment_DatePost,Comment_Blog,Comment_Post,Comment_Trash")] tblComment tblComment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblComment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Comment_Blog = new SelectList(db.tblBlogs, "BLog_ID", "Blog_Title", tblComment.Comment_Blog);
            ViewBag.Comment_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblComment.Comment_Post);
            ViewBag.Comment_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblComment.Comment_User);
            return View(tblComment);
        }

        // GET: Admin/tblCommentsAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblComment tblComment = db.tblComments.Find(id);
            if (tblComment == null)
            {
                return HttpNotFound();
            }
            return View(tblComment);
        }

        // POST: Admin/tblCommentsAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblComment tblComment = db.tblComments.Find(id);
            db.tblComments.Remove(tblComment);
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
