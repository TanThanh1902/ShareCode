using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;
using PagedList;

namespace ShareCode.Controllers
{
    public class SearchController : Controller
    {
        DBShareCodeEntities db = new DBShareCodeEntities();
        private const int PAGE_SIZE = 11;
        // GET: Search
        #region method
        public PartialViewResult getListSelectCategory()
        {
            List<tblCategory> categories = db.tblCategories.Where(t => t.Cat_Trash == false).ToList();
            return PartialView(categories);
        }
        public PartialViewResult getListSelectGenres()
        {
            List<tblGenre> genres = db.tblGenres.Where(t => t.Genres_Trash == false).ToList();
            return PartialView(genres);
        }
        public PartialViewResult getListSelectLanguage()
        {
            List<tblLanguage> languages = db.tblLanguages.Where(t => t.Lang_Trash == false).ToList();
            return PartialView(languages);
        }

        public List<tblPost> FilterCategories(int? id)
        {
            tblCategory category = db.tblCategories.Find(id);
            if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(category.Cat_Name)) != null)
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
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Cat == id).ToList();
            return posts;
        }
        public List<tblPost> FilterGenres(int? id)
        {
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
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Genres == id).ToList();
            return posts;
        }
        public List<tblPost> FilterLanguages(int id)
        {
            tblLanguage language = db.tblLanguages.Find(id);
            if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(language.Lang_Name)) != null)
            {
                db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(language.Lang_Name)).Tag_CountSearch++;
                db.SaveChanges();
            }
            else
            {
                tblTag tag = new tblTag()
                {
                    Tag_Title = language.Lang_Name,
                    Tag_DateAdd = DateTime.Now,
                    Tag_CountSearch = 1
                };
                db.tblTags.Add(tag);
                db.SaveChanges();
            }
            List<tblPost> posts = db.tblPostLangs.Where(t => t.Lang_ID == id).Select(t => t.tblPost).Where(t => t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToList();
            return posts;
        }
        #endregion
        // GET: Posts
        public ActionResult AllPosts(int? page)
        {
            ViewBag.Title = "Tất cả code";
            ViewBag.couttPost = db.tblPosts.Where(t => t.Post_Active == true && t.Post_Trash == false).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }
        public ActionResult FilterPostsByCatID(int? id, int? page)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            tblCategory category = db.tblCategories.Find(id);
            if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(category.Cat_Name)) != null)
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
            if(groupCode == null)
            {
                return HttpNotFound();
            }
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
        public ActionResult FilterPostsByLanguage(int? id, int? page)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            tblLanguage language = db.tblLanguages.Find(id);
            if (language == null)
            {
                return HttpNotFound();
            }
            if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(language.Lang_Name)) != null)
            {
                db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains(language.Lang_Name)).Tag_CountSearch++;
                db.SaveChanges();
            }
            else
            {
                tblTag tag = new tblTag()
                {
                    Tag_Title = language.Lang_Name,
                    Tag_DateAdd = DateTime.Now,
                    Tag_CountSearch = 1
                };
                db.tblTags.Add(tag);
                db.SaveChanges();
            }
            ViewBag.Title = "Tìm kiếm code theo nhóm loại";
            ViewBag.countPost = db.tblPostLangs.Where(t => t.Lang_ID == id).Select(t => t.tblPost).Where(t => t.Post_Active == true && t.Post_Trash == false).Count();
            IPagedList<tblPost> post = db.tblPostLangs.Where(t => t.Lang_ID == id).Select(t => t.tblPost).Where(t => t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }
        public ActionResult TopPosts(int? page)
        {
            ViewBag.Title = "Top Code";
            ViewBag.countPost = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.tblRates.Average(z => z.Rate_Star)).ThenBy(t => t.Post_DateCreate).Take(100).Count();
            IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.tblRates.Average(z => z.Rate_Star)).ThenBy(t => t.Post_DateCreate).Take(100).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", post);
        }
        //public ActionResult QualityPosts(int? page)
        //{
        //    ViewBag.Title = "Code chất lượng";
        //    if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code chất lượng")) != null)
        //    {
        //        db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code chất lượng")).Tag_CountSearch++;
        //        db.SaveChanges();
        //    }
        //    else
        //    {
        //        tblTag tag = new tblTag()
        //        {
        //            Tag_Title = ViewBag.Title,
        //            Tag_DateAdd = DateTime.Now,
        //            Tag_CountSearch = 1
        //        };
        //        db.tblTags.Add(tag);
        //        db.SaveChanges();
        //    }
        //    ViewBag.countPost = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price > 99).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.tblRates.Average(z => z.Rate_Star)).ThenBy(t => t.Post_DateCreate).Take(100).Count();
        //    IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price > 99).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.tblRates.Average(z => z.Rate_Star)).ThenBy(t => t.Post_DateCreate).Take(100).ToPagedList(page ?? 1, PAGE_SIZE);
        //    return View("Index", post);
        //}
        //public ActionResult ReferPosts(int? page)
        //{
        //    ViewBag.Title = "Code tham khảo";
        //    if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code tham khảo")) != null)
        //    {
        //        db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code tham khảo")).Tag_CountSearch++;
        //        db.SaveChanges();
        //    }
        //    else
        //    {
        //        tblTag tag = new tblTag()
        //        {
        //            Tag_Title = ViewBag.Title,
        //            Tag_DateAdd = DateTime.Now,
        //            Tag_CountSearch = 1
        //        };
        //        db.tblTags.Add(tag);
        //        db.SaveChanges();
        //    }
        //    ViewBag.countPost = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price > 0 && t.Post_Price < 100).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.tblRates.Average(z => z.Rate_Star)).ThenBy(t => t.Post_DateCreate).Take(100).Count();
        //    IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price > 0 && t.Post_Price < 100).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.tblRates.Average(z => z.Rate_Star)).ThenBy(t => t.Post_DateCreate).Take(100).ToPagedList(page ?? 1, PAGE_SIZE);
        //    return View("Index", post);
        //}
        //public ActionResult FreePosts(int? page)
        //{
        //    ViewBag.Title = "Code miễn phí";
        //    if (db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code miễn phí")) != null)
        //    {
        //        db.tblTags.FirstOrDefault(t => t.Tag_Title.Contains("Code miễn phí")).Tag_CountSearch++;
        //        db.SaveChanges();
        //    }
        //    else
        //    {
        //        tblTag tag = new tblTag()
        //        {
        //            Tag_Title = ViewBag.Title,
        //            Tag_DateAdd = DateTime.Now,
        //            Tag_CountSearch = 1
        //        };
        //        db.tblTags.Add(tag);
        //        db.SaveChanges();
        //    }
        //    ViewBag.countPost = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price == 0).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.tblRates.Average(z => z.Rate_Star)).ThenBy(t => t.Post_DateCreate).Take(100).Count();
        //    IPagedList<tblPost> post = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Price == 0).OrderByDescending(t => t.Post_CountDownLoad).ThenBy(t => t.tblRates.Average(z => z.Rate_Star)).ThenBy(t => t.Post_DateCreate).Take(100).ToPagedList(page ?? 1, PAGE_SIZE);
        //    return View("Index", post);
        //}
        public ActionResult Search(int? page, string searchText, int? cat_id, int? gen_id, int? lan_id)
        {
            ViewBag.Title = "Tìm kiếm code nâng cao";
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true).ToList();
            if(cat_id != null && cat_id != 0)
            {
                posts = posts.Intersect(FilterCategories(cat_id)).ToList();
            }
            if(gen_id != null && gen_id != 0)
            {
                posts = posts.Intersect(FilterGenres(gen_id)).ToList();
            }
            if (lan_id != null && lan_id == 0)
            {
                posts = posts.Intersect(FilterLanguages((int)lan_id)).ToList();
            }
            posts = posts.Where(t => (t.Post_Title.ToLower().Contains(searchText.ToLower()) || t.tblUser.User_DisplayName.Contains(searchText) || t.Post_Code.Contains(searchText) || t.tblCategory.Cat_Name.Contains(searchText) || t.tblGroupCode.Group_Name.Contains(searchText) || t.tblGenre.Genres_Name.Contains(searchText)) && t.Post_Trash == false && t.Post_Active == true).ToList();
            ViewBag.couttPost = posts.Count();
            return View("Index", posts.OrderByDescending(t => t.Post_DateCreate).ToPagedList(page ?? 1, PAGE_SIZE));
        }
    }
}
