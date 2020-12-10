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
            if(id == null)
            {
                return HttpNotFound();
            }
            tblCategory category = db.tblCategories.Find(id);
            if(db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(category.Cat_Name)) != null)
            {
                db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(category.Cat_Name)).Tag_CountSearch++;
                db.SaveChanges();
            }
            else
            {
                tblTag tag = new tblTag()
                {
                    Tag_Title = category.Cat_Name,
                    Tag_DateAdd = DateTime.Now,
                    Tag_CountSearch = 1
                };
                db.tblTags.Add(tag);
                db.SaveChanges();
            }
            ViewBag.Title = "Tìm kiếm code theo danh mục";
            ViewBag.countPost = db.tblPosts.Where(t => t.Post_Cat == id && t.Post_Active == true && t.Post_Trash == false).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Cat == id && t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }

        public ActionResult FilterPostsByGenresID(int? id, int? page)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            tblGenre genre = db.tblGenres.Find(id);
            if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(genre.Genres_Name)) != null)
            {
                db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(genre.Genres_Name)).Tag_CountSearch++;
                db.SaveChanges();
            }
            else
            {
                tblTag tag = new tblTag()
                {
                    Tag_Title = genre.Genres_Name,
                    Tag_DateAdd = DateTime.Now,
                    Tag_CountSearch = 1
                };
                db.tblTags.Add(tag);
                db.SaveChanges();
            }
            ViewBag.Title = "Tìm kiếm code theo thể loại";
            ViewBag.countPost = db.tblPosts.Where(t => t.Post_Genres == id && t.Post_Active == true && t.Post_Trash == false).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Genres == id && t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }

        public ActionResult FilterPostsByGroupCodeID(int? id, int? page)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            tblGroupCode groupCode = db.tblGroupCodes.Find(id);
            if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(groupCode.Group_Name)) != null)
            {
                db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(groupCode.Group_Name)).Tag_CountSearch++;
                db.SaveChanges();
            }
            else
            {
                tblTag tag = new tblTag()
                {
                    Tag_Title = groupCode.Group_Name,
                    Tag_DateAdd = DateTime.Now,
                    Tag_CountSearch = 1
                };
                db.tblTags.Add(tag);
                db.SaveChanges();
            }
            ViewBag.Title = "Tìm kiếm code theo nhóm loại";
            ViewBag.countPost = db.tblPosts.Where(t => t.Post_Group == id && t.Post_Active == true && t.Post_Trash == false).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Group == id && t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }
        public ActionResult TopPosts(int? page)
        {
            ViewBag.Title = "Top Code";
            ViewBag.countPost = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.Post_Rate).ThenBy(t => t.Post_DateCreate).Take(100).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.Post_Rate).ThenBy(t => t.Post_DateCreate).Take(100).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }
        public ActionResult QualityPosts(int? page)
        {
            ViewBag.Title = "Code chất lượng";
            if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code chất lượng")) != null)
            {
                db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code chất lượng")).Tag_CountSearch++;
                db.SaveChanges();
            }
            else
            {
                tblTag tag = new tblTag()
                {
                    Tag_Title = ViewBag.Title,
                    Tag_DateAdd = DateTime.Now,
                    Tag_CountSearch = 1
                };
                db.tblTags.Add(tag);
                db.SaveChanges();
            }
            ViewBag.countPost = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price > 99).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.Post_Rate).ThenBy(t => t.Post_DateCreate).Take(100).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price > 99).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.Post_Rate).ThenBy(t => t.Post_DateCreate).Take(100).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }
        public ActionResult ReferPosts(int? page)
        {
            ViewBag.Title = "Code tham khảo";
            if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code tham khảo")) != null)
            {
                db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code tham khảo")).Tag_CountSearch++;
                db.SaveChanges();
            }
            else
            {
                tblTag tag = new tblTag()
                {
                    Tag_Title = ViewBag.Title,
                    Tag_DateAdd = DateTime.Now,
                    Tag_CountSearch = 1
                };
                db.tblTags.Add(tag);
                db.SaveChanges();
            }
            ViewBag.countPost = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price > 0 && t.Post_Price < 100).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.Post_Rate).ThenBy(t => t.Post_DateCreate).Take(100).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price > 0 && t.Post_Price < 100).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.Post_Rate).ThenBy(t => t.Post_DateCreate).Take(100).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }
        public ActionResult FreePosts(int? page)
        {
            ViewBag.Title = "Code miễn phí";
            if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code miễn phí")) != null)
            {
                db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code miễn phí")).Tag_CountSearch++;
                db.SaveChanges();
            }
            else
            {
                tblTag tag = new tblTag()
                {
                    Tag_Title = ViewBag.Title,
                    Tag_DateAdd = DateTime.Now,
                    Tag_CountSearch = 1
                };
                db.tblTags.Add(tag);
                db.SaveChanges();
            }
            ViewBag.countPost = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price == 0).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.Post_Rate).ThenBy(t => t.Post_DateCreate).Take(100).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price == 0).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.Post_Rate).ThenBy(t => t.Post_DateCreate).Take(100).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }
        public ActionResult FilterAdvanced(int? page, string key, int category, int groupcode)
        {
            ViewBag.Title = "Tìm kiếm code nâng cao";
            List<tblPost> posts = new List<tblPost>();
            if(category != 0 && groupcode != 0)
            {
                posts = db.tblPosts.Where(t => t.Post_Cat == category && t.Post_Group == groupcode).ToList();
            }
            else if(category != 0 && groupcode == 0)
            {
                posts = db.tblPosts.Where(t => t.Post_Cat == category).ToList();
            }
            else if(category == 0 && groupcode != 0)
            {
                posts = db.tblPosts.Where(t => t.Post_Group == groupcode).ToList();
            }
            else
            {
                posts = db.tblPosts.ToList();
            }
            posts = posts.Where(t => t.Post_Title.Contains(key) || t.tblUser.User_DisplayName.Contains(key) || t.Post_Code.Contains(key) || t.tblCategory.Cat_Name.Contains(key) || t.tblGroupCode.Group_Name.Contains(key) || t.tblGenre.Genres_Name.Contains(key) && t.Post_Trash == false).ToList();
            ViewBag.couttPost = posts.Count();
            return View("Index", posts.OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE));
        }
        public ActionResult MyPosts(int? page)
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            IPagedList<tblPost> posts = db.tblPosts.Where(t => t.Post_User == user.User_ID && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(posts);
        }

        public ActionResult PostBought(int? page)
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
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
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
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
            HttpCookie member_cookie = Request.Cookies["member_id"];
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
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
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
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
