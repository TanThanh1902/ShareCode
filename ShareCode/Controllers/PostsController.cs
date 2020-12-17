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

        
        public ActionResult MyPosts(int? page)
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            ViewBag.Title = "Code đã tải";
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            IPagedList<tblPost> posts = db.tblPosts.Where(t => t.Post_User == user.User_ID && t.Post_Trash == false && t.Post_Active == true).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(posts);
        }
        public ActionResult MyPostApproval(int? page)
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            ViewBag.Title = "Code chờ duyệt";
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            IPagedList<tblPost> posts = db.tblPosts.Where(t => t.Post_User == user.User_ID && t.Post_Trash == false && t.Post_Active == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("MyPosts", posts);
        }
        public ActionResult RevenuePosts(int? page)
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            ViewBag.Title = "Code chờ duyệt";
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            IPagedList<tblOrder> orders = db.tblOrders.Where(t => t.tblPost.Post_User == user.User_ID).OrderByDescending(t => t.Order_DateAdd).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(orders);
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
        public ActionResult Create([Bind(Include = "Post_ID,Post_Title,Post_Avata,Post_ViewMoreImage,Post_Description,Post_View,Post_Vote,Post_Rate,Post_CountDownLoad,Post_LinkDown,Post_DateCreate,Post_Cat,Post_User,Post_Favorite,Post_TutorialSetup,Post_Price,Post_Genres,Post_Group,Post_Active,Post_Trash,Post_Code")] tblPost tblPost, HttpPostedFileBase fileimg, List<HttpPostedFileBase> fileimg_viewmoreimage, int[] lan_id)
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
                if(tblPost.Post_Price == 0)
                {
                    tblPost.Post_Group = 3;
                }
                else if(tblPost.Post_Price > 0 && tblPost.Post_Price < 100)
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
                foreach(var item in lan_id)
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
                return Redirect("/User/MyInfo");
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
            if (tblPost == null || tblPost.Post_User != user.User_ID)
            {
                return HttpNotFound();
            }
            ViewBag.Post_Cat = new SelectList(db.tblCategories, "Cat_ID", "Cat_Name", tblPost.Post_Cat);
            ViewBag.Post_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblPost.Post_User);
            ViewBag.Post_Group = new SelectList(db.tblGroupCodes, "Group_ID", "Group_Name", tblPost.Post_Group);
            ViewBag.Post_Genres = new SelectList(db.tblGenres, "Genres_ID", "Genres_Name", tblPost.Post_Genres);
            return View(tblPost);
        }
        public ActionResult Vote(int? id, int star)
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            if(db.tblRates.FirstOrDefault(t => t.Rate_Post == id && t.Rate_User == user.User_ID) != null)
            {
                db.tblRates.FirstOrDefault(t => t.Rate_Post == id && t.Rate_User == user.User_ID).Rate_Star = star;
            }
            else
            {
                tblRate addItem = new tblRate()
                {
                    Rate_User = user.User_ID,
                    Rate_Star = star,
                    Rate_Post = id,
                    Rate_DateVote = DateTime.Now
                };
                db.tblRates.Add(addItem);
            }
            db.SaveChanges();
            return RedirectToAction("Details", new { id });
        }

        public ActionResult Report(int? id, string Report_Contents)
        {
            tblUser user = db.tblUsers.Find(int.Parse(Request.Cookies["member_id"].Value.ToString()));
            tblReport addItem = new tblReport()
            {
                Report_Contents = Report_Contents,
                Report_DateSend = DateTime.Now,
                Report_Post = id,
                Report_User = user.User_ID
            };
            db.tblReports.Add(addItem);
            db.SaveChanges();
            return RedirectToAction("Details", new { id });
        }

        // POST: Posts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
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

                List<tblPostLang> removeItem = db.tblPostLangs.Where(t => t.Post_ID == tblPost.Post_ID).ToList();
                foreach(var item in removeItem)
                {
                    db.tblPostLangs.Remove(item);
                    db.SaveChanges();
                }
                foreach(var item in lan_id)
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
                return RedirectToAction("MyPosts");
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
