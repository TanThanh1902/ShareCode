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
using System.IO;

namespace ShareCode.Controllers
{
    public class PostsController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();
        private const int PAGE_SIZE = 9;

        // GET: Posts
        public ActionResult AllPost(int? page)
        {
            ViewBag.Title = "Tất cả code";
            ViewBag.couttPost = db.tblPosts.Where(t => t.Post_Active == true && t.Post_Trash == false).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }

        public ActionResult FilterPostsByCatID(int? id, int? page)
        {
            ViewBag.Title = "Tìm kiếm code theo danh mục";
            ViewBag.couttPost = db.tblPosts.Where(t => t.Post_Cat == id && t.Post_Active == true && t.Post_Trash == false).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Cat == id && t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }

        public ActionResult FilterPostsByGenresID(int? id, int? page)
        {
            ViewBag.Title = "Tìm kiếm code theo thể loại";
            ViewBag.couttPost = db.tblPosts.Where(t => t.Post_Genres == id && t.Post_Active == true && t.Post_Trash == false).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Genres == id && t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }

        public ActionResult FilterPostsByGroupCodeID(int? id, int? page)
        {
            ViewBag.Title = "Tìm kiếm code theo nhóm loại";
            ViewBag.couttPost = db.tblPosts.Where(t => t.Post_Group == id && t.Post_Active == true && t.Post_Trash == false).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Group == id && t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }
        public ActionResult MyPosts(int? page)
        {
            if(Session["member"] == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = (tblUser)Session["member"];
            IPagedList<tblPost> posts = db.tblPosts.Where(t => t.Post_User == user.User_ID).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(posts);
        }

        public ActionResult PostBought(int? page)
        {
            if (Session["member"] == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = (tblUser)Session["member"];
            IPagedList<tblOrder> orders = db.tblOrders.Where(t => t.Order_User == user.User_ID).OrderByDescending(t => t.Order_DateAdd).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(orders);
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
            db.tblPosts.Find(id).Post_View++;
            db.SaveChanges();
            ViewBag.countPostsFree = db.tblPosts.Where(t => tblPost.Post_User == tblPost.Post_User && t.Post_Price == 0).Count();
            ViewBag.countPostsPay = db.tblPosts.Where(t => tblPost.Post_User == tblPost.Post_User && t.Post_Price > 0).Count();
            return View(tblPost);
        }

        // GET: Posts/Create
        public ActionResult Create()
        {
            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name");
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName");
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name");
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name");
            return View();
        }

        // POST: Posts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Post_ID,Post_Title,Post_Avata,Post_ViewMoreImage,Post_Description,Post_View,Post_Vote,Post_Rate,Post_CountDownLoad,Post_LinkDown,Post_DateCreate,Post_Cat,Post_User,Post_Favorite,Post_TutorialSetup,Post_Price,Post_Genres,Post_Group,Post_Active,Post_Trash,Post_Code")] tblPost tblPost, HttpPostedFileBase fileimg, List<HttpPostedFileBase> fileimg_viewmoreimage)
        {
            tblUser user = (tblUser)Session["member"];
            if (ModelState.IsValid)
            {
                // add properties hidden
                tblPost.Post_Active = false;
                tblPost.Post_CountDownLoad = 0;
                tblPost.Post_DateCreate = DateTime.Now;
                tblPost.Post_Favorite = 0;
                tblPost.Post_Rate = 0;
                tblPost.Post_Trash = false;
                tblPost.Post_User = user.User_ID;
                tblPost.Post_View = 0;
                tblPost.Post_Vote = 0;

                // add image 
                // add single image

                string fileNameSingle = Guid.NewGuid() + Path.GetExtension(fileimg.FileName);
                var pathimgSingle = Path.Combine(Server.MapPath("~/Content/Layout/img/post"), fileNameSingle);
                fileimg.SaveAs(pathimgSingle);
                tblPost.Post_Avata = fileNameSingle;

                // adđ multiple images

                string mulImages = "";
                foreach(var item in fileimg_viewmoreimage)
                {
                    string fileNameMultiple = Guid.NewGuid() + Path.GetExtension(item.FileName);
                    var pathimgMul = Path.Combine(Server.MapPath("~/Content/Layout/img/post"), fileNameMultiple);
                    item.SaveAs(pathimgMul);
                    mulImages += ";" + fileNameMultiple;
                }
                tblPost.Post_ViewMoreImage = mulImages;

                db.tblPosts.Add(tblPost);
                db.SaveChanges();
                return RedirectToAction("/User/MyInfo");
            }

            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name", tblPost.Post_Cat);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name", tblPost.Post_Group);
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name", tblPost.Post_Genres);
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
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name", tblPost.Post_Group);
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name", tblPost.Post_Genres);
            return View(tblPost);
        }

        // POST: Posts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Post_ID,Post_Title,Post_Avata,Post_ViewMoreImage,Post_Description,Post_View,Post_Vote,Post_Rate,Post_CountDownLoad,Post_LinkDown,Post_DateCreate,Post_Cat,Post_User,Post_Favorite,Post_TutorialSetup,Post_Price,Post_Genres,Post_Group,Post_Active,Post_Trash,Post_Code")] tblPost tblPost)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblPost).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name", tblPost.Post_Cat);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name", tblPost.Post_Group);
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name", tblPost.Post_Genres);
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


        // code save
        public ActionResult PostsCollection(int? page)
        {
            if (Session["member"] == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = (tblUser)Session["member"];
            IPagedList<tblPost> posts = db.tblFavorites.Where(t => t.Favorite_User == user.User_ID).OrderByDescending(t => t.Favorite_DateAdd).Select(t => t.tblPost).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(posts);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        //Sematic
        public PartialViewResult Sematic()
        {
            return PartialView();
        }
    }
}
