using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;

namespace ShareCode.Controllers
{
    public class CommentsController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();

        // GET: Comments
        public ActionResult Index()
        {
            var tblComments = db.tblComments.Include(t => t.tblPost).Include(t => t.tblUser);
            return View(tblComments.ToList());
        }

        // GET: Comments/Details/5
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

        // GET: Comments/Create
        public ActionResult Create()
        {
            ViewBag.Comment_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title");
            ViewBag.Comment_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName");
            return View();
        }

        // POST: Comments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Comment_ID,Comment_Contents,Comment_User,Comment_Post,Comment_DatePost")] tblComment tblComment)
        {
            if (ModelState.IsValid)
            {
                db.tblComments.Add(tblComment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Comment_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblComment.Comment_Post);
            ViewBag.Comment_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblComment.Comment_User);
            return View(tblComment);
        }

        // GET: Comments/Edit/5
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
            ViewBag.Comment_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblComment.Comment_Post);
            ViewBag.Comment_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblComment.Comment_User);
            return View(tblComment);
        }

        // POST: Comments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Comment_ID,Comment_Contents,Comment_User,Comment_Post,Comment_DatePost")] tblComment tblComment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblComment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Comment_Post = new SelectList(db.tblPosts, "Post_ID", "Post_Title", tblComment.Comment_Post);
            ViewBag.Comment_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblComment.Comment_User);
            return View(tblComment);
        }

        // GET: Comments/Delete/5
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

        // POST: Comments/Delete/5
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
