using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;

namespace ShareCode.Controllers
{
    public class ViewController : Controller
    {
        DBShareCodeEntities db = new DBShareCodeEntities();
        // GET: View
        public PartialViewResult Menu()
        {
            return PartialView();
        }
        //Modal
        public PartialViewResult Modal()
        {
            return PartialView();
        }
        public PartialViewResult Val()
        {
            return PartialView();
        }
        public PartialViewResult InfoRight()
        {
            return PartialView();
        }
        public PartialViewResult ListCategorySearchHomePage()
        {
            List<tblCategory> categories = db.tblCategories.Where(t => t.Cat_Trash == false).ToList();
            return PartialView(categories);
        }
        public PartialViewResult ListGenresSearchHomePage()
        {
            List<tblGenre> genres = db.tblGenres.Where(t => t.Genres_Trash == false).ToList();
            return PartialView(genres);
        }
        public PartialViewResult ListGroupCodeSearchHomePage()
        {
            List<tblGroupCode> groupCode = db.tblGroupCodes.Where(t => t.Group_Trash == false).ToList();
            return PartialView(groupCode);
        }
        public PartialViewResult ListHightLightPosts()
        {
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ThenBy(t => t.Post_View).ThenBy(t => t.tblRates.Average(z => z.Rate_Star)).Take(7).ToList();
            return PartialView(posts);
        }
        public PartialViewResult Top7Tags()
        {
            List<tblTag> tags = db.tblTags.OrderByDescending(t => t.Tag_CountSearch).ThenBy(t => t.Tag_DateAdd).Take(7).ToList();
            return PartialView(tags);
        }
        public PartialViewResult SamePosts(int? id)
        {
            int Cat_ID = (int)db.tblPosts.Find(id).Post_Cat;
            int Genres_ID = (int)db.tblPosts.Find(id).Post_Genres;
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Genres == Genres_ID && t.Post_Cat == Cat_ID && t.Post_Trash == false && t.Post_Active == true).OrderByDescending(t => t.Post_View).ThenBy(t => t.Post_DateCreate).Take(7).ToList();
            return PartialView(posts);
        }
        public PartialViewResult RecentlyPostsAtHome()
        {
            ViewBag.TitleRecentlyAtHome = "Code mới nhất";
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true).OrderByDescending(t => t.Post_DateCreate).Take(11).ToList();
            return PartialView("ListRecentlyPostsAtHome", posts);
        }
        public PartialViewResult RecentlyWebsitePostsAtHome()
        {
            ViewBag.TitleRecentlyAtHome = "Website";
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Trash == false && t.Post_Active == true && t.Post_Genres == 1).OrderByDescending(t => t.Post_DateCreate).Take(11).ToList();
            return PartialView("ListRecentlyPostsAtHome", posts);
        }
        public PartialViewResult RecentlyGamePostsAtHome()
        {
            ViewBag.TitleRecentlyAtHome = "Game";
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Genres == 4 && t.Post_Trash == false && t.Post_Active == true).OrderByDescending(t => t.Post_DateCreate).Take(11).ToList();
            return PartialView("ListRecentlyPostsAtHome", posts);
        }
        public PartialViewResult RecentlyAppPostsAtHome()
        {
            ViewBag.TitleRecentlyAtHome = "Ứng dụng";
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Genres == 2 && t.Post_Trash == false && t.Post_Active == true).OrderByDescending(t => t.Post_DateCreate).Take(11).ToList();
            return PartialView("ListRecentlyPostsAtHome", posts);
        }
        public PartialViewResult HighlightBlogs()
        {
            List<tblBlog> blogs = db.tblBlogs.Where(t => t.Blog_Trash == false).OrderByDescending(t => t.Blog_View).ThenBy(t => t.BLog_DatePost).Take(7).ToList();
            return PartialView(blogs);
        }
    }
}