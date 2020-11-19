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
    public class PostsController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();
        private const int PAGE_SIZE = 9;

        // GET: Posts
        public ActionResult Index()
        {
            var tblPosts = db.tblPosts.Include(t => t.tblCategory).Include(t => t.tblUser);
            return View(tblPosts.ToList());
        }

        public ActionResult FilterByCatID(int? id, int? page)
        {
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Cat == id).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }

        // GET: Posts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPost tblPost = db.tblPosts.Find(id);
            if (tblPost == null)
            {
                return HttpNotFound();
            }
            return View(tblPost);
        }

        // GET: Posts/Create
        public ActionResult Create()
        {
            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name");
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName");
            return View();
        }

        // POST: Posts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Post_ID,Post_Title,Post_Avata,Post_ViewMoreImage,Post_Description,Post_View,Post_Vote,Post_Rate,Post_CountDownLoad,Post_LinkDown,Post_DateCreate,Post_Cat,Post_User,Post_Favorite,Post_TutorialSetup")] tblPost tblPost)
        {
            if (ModelState.IsValid)
            {
                db.tblPosts.Add(tblPost);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name", tblPost.Post_Cat);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            return View(tblPost);
        }

        // GET: Posts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPost tblPost = db.tblPosts.Find(id);
            if (tblPost == null)
            {
                return HttpNotFound();
            }
            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name", tblPost.Post_Cat);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            return View(tblPost);
        }

        // POST: Posts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Post_ID,Post_Title,Post_Avata,Post_ViewMoreImage,Post_Description,Post_View,Post_Vote,Post_Rate,Post_CountDownLoad,Post_LinkDown,Post_DateCreate,Post_Cat,Post_User,Post_Favorite,Post_TutorialSetup")] tblPost tblPost)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblPost).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name", tblPost.Post_Cat);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            return View(tblPost);
        }

        // GET: Posts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblPost tblPost = db.tblPosts.Find(id);
            if (tblPost == null)
            {
                return HttpNotFound();
            }
            return View(tblPost);
        }

        // POST: Posts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblPost tblPost = db.tblPosts.Find(id);
            db.tblPosts.Remove(tblPost);
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
