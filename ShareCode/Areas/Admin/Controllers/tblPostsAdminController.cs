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
            List<tblPost> tblPosts = db.tblPosts.Where(t => t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToList();
            return View(tblPosts);
        }
        [HttpPost]
        public JsonResult ApprovalPost(int? id)
        {
            if ((bool)db.tblPosts.Find(id).Post_Active)
            {
                db.tblPosts.Find(id).Post_Active = false;
            }
            else
            {
                db.tblPosts.Find(id).Post_Active = true;
                db.tblPosts.Find(id).Post_Code = "Code-" + id;
            }
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
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
        public ActionResult Create([Bind(Include = "Post_ID,Post_Title,Post_Avata,Post_ViewMoreImage,Post_Description,Post_View,Post_Vote,Post_Rate,Post_CountDownLoad,Post_LinkDown,Post_DateCreate,Post_Cat,Post_User,Post_Favorite,Post_TutorialSetup,Post_Price,Post_Genres,Post_Group,Post_Active,Post_Trash,Post_Code")] tblPost tblPost, HttpPostedFileBase fileimg, int[] lan_id)
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            if (ModelState.IsValid)
            {
                // add properties hidden
                tblPost.Post_Active = false;
                tblPost.Post_CountDownLoad = 0;
                tblPost.Post_DateCreate = DateTime.Now;
                tblPost.Post_Favorite = 0;
                tblPost.Post_Trash = false;
                tblPost.Post_User = user.User_ID;
                tblPost.Post_View = 0;
                if (tblPost.Post_Price == 0)
                {
                    tblPost.Post_Group = 3;
                }
                else if (tblPost.Post_Price > 0 && tblPost.Post_Price < 100)
                {
                    tblPost.Post_Group = 2;
                }
                else
                {
                    tblPost.Post_Group = 1;
                }

                // add image 
                // add single image

                string fileNameSingle = Guid.NewGuid() + Path.GetExtension(fileimg.FileName);
                var pathimgSingle = Path.Combine(Server.MapPath("~/Content/Layout/img/post"), fileNameSingle);
                fileimg.SaveAs(pathimgSingle);
                tblPost.Post_Avata = fileNameSingle;

                // adđ multiple images

                //string mulImages = "";
                //foreach(var item in fileimg_viewmoreimage)
                //{
                //    string fileNameMultiple = Guid.NewGuid() + Path.GetExtension(item.FileName);
                //    var pathimgMul = Path.Combine(Server.MapPath("~/Content/Layout/img/post"), fileNameMultiple);
                //    item.SaveAs(pathimgMul);
                //    mulImages += ";" + fileNameMultiple;
                //}
                //tblPost.Post_ViewMoreImage = mulImages;

                db.tblPosts.Add(tblPost);
                db.SaveChanges();
                tblPost post = db.tblPosts.OrderByDescending(t => t.Post_ID).FirstOrDefault(t => t.Post_Title == tblPost.Post_Title && t.Post_Active == false && t.Post_Trash == false && t.Post_User == user.User_ID);
                foreach (var item in lan_id)
                {
                    tblPostLang addItem = new tblPostLang()
                    {
                        Lang_ID = item,
                        Post_ID = post.Post_ID,
                        PostLang_DateAdd = DateTime.Now
                    };
                    db.tblPostLangs.Add(addItem);
                    db.SaveChanges();
                }
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
        public ActionResult Edit([Bind(Include = "Post_ID,Post_Title,Post_Avata,Post_ViewMoreImage,Post_Description,Post_View,Post_Vote,Post_Rate,Post_CountDownLoad,Post_LinkDown,Post_DateCreate,Post_Cat,Post_User,Post_Favorite,Post_TutorialSetup,Post_Price,Post_Genres,Post_Group,Post_Active,Post_Trash,Post_Code")] tblPost tblPost, HttpPostedFileBase file_img, int[] lan_id)
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
                if (tblPost.Post_Price == 0)
                {
                    tblPost.Post_Group = 3;
                }
                else if (tblPost.Post_Price > 0 && tblPost.Post_Price < 100)
                {
                    tblPost.Post_Group = 2;
                }
                else
                {
                    tblPost.Post_Group = 1;
                }
                db.Entry(tblPost).State = EntityState.Modified;
                db.SaveChanges();
                List<tblPostLang> removeItem = tblPost.tblPostLangs.ToList();
                foreach (var item in removeItem)
                {
                    db.tblPostLangs.Remove(item);
                    db.SaveChanges();
                }
                foreach (var item in lan_id)
                {
                    tblPostLang addItem = new tblPostLang()
                    {
                        Post_ID = tblPost.Post_ID,
                        Lang_ID = item,
                        PostLang_DateAdd = DateTime.Now
                    };
                    db.tblPostLangs.Add(addItem);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name", tblPost.Post_Cat);
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name", tblPost.Post_Genres);
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name", tblPost.Post_Group);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            return View(tblPost);
        }

        // GET: Admin/tblPostsAdmin/Delete/5
        public ActionResult DeleteConfirmed(int id)
        {
            db.tblPosts.Find(id).Post_Trash = true;
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
