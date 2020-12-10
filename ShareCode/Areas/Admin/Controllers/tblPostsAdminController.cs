using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;

namespace ShareCode.Areas.Admin.Controllers
{
    public class tblPostsAdminController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();

        // GET: Admin/tblPostsAdmin
        public ActionResult Index()
        {
            var tblPosts = db.tblPosts.Include(t => t.tblCategory).Include(t => t.tblGenre).Include(t => t.tblGroupCode).Include(t => t.tblUser);
            return View(tblPosts.ToList());
        }

        // GET: Admin/tblPostsAdmin/Details/5
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

        // GET: Admin/tblPostsAdmin/Create
        public ActionResult Create()
        {
            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name");
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name");
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name");
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName");
            return View();
        }

        // POST: Admin/tblPostsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Post_ID,Post_Title,Post_Avata,Post_ViewMoreImage,Post_Description,Post_View,Post_Vote,Post_Rate,Post_CountDownLoad,Post_LinkDown,Post_DateCreate,Post_Cat,Post_User,Post_Favorite,Post_TutorialSetup,Post_Price,Post_Genres,Post_Group,Post_Active,Post_Trash,Post_Code")] tblPost tblPost)
        {
            if (ModelState.IsValid)
            {
                db.tblPosts.Add(tblPost);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name", tblPost.Post_Cat);
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name", tblPost.Post_Genres);
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name", tblPost.Post_Group);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            return View(tblPost);
        }

        // GET: Admin/tblPostsAdmin/Edit/5
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
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name", tblPost.Post_Genres);
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name", tblPost.Post_Group);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            return View(tblPost);
        }

        // POST: Admin/tblPostsAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Post_ID,Post_Title,Post_Avata,Post_ViewMoreImage,Post_Description,Post_View,Post_Vote,Post_Rate,Post_CountDownLoad,Post_LinkDown,Post_DateCreate,Post_Cat,Post_User,Post_Favorite,Post_TutorialSetup,Post_Price,Post_Genres,Post_Group,Post_Active,Post_Trash,Post_Code")] tblPost tblPost, HttpPostedFileBase file_img)
        {
            if (ModelState.IsValid)
            {
                // update avata
                if (file_img != null)
                {
                    // delete old image
                    if (tblPost.Post_Avata != null)
                    {
                        string fullPath = Request.MapPath("~/Content/Layout/img/post/" + tblPost.Post_Avata);
                        System.IO.File.Delete(fullPath);
                    }
                    // update new image
                    var img = Guid.NewGuid().ToString() + Path.GetExtension(file_img.FileName);
                    var pathimg = Path.Combine(Server.MapPath("~/Content/Layout/img/post"), img);
                    file_img.SaveAs(pathimg);
                    tblPost.Post_Avata = img;
                }
                db.Entry(tblPost).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name", tblPost.Post_Cat);
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name", tblPost.Post_Genres);
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name", tblPost.Post_Group);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            return View(tblPost);
        }

        // GET: Admin/tblPostsAdmin/Delete/5
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

        // POST: Admin/tblPostsAdmin/Delete/5
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
