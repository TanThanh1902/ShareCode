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
            List<tblCategory> categories = db.tblCategories.ToList();
            return PartialView(categories);
        }
        public PartialViewResult ListGroupCodeSearchHomePage()
        {
            List<tblGroupCode> groupCode = db.tblGroupCodes.ToList();
            return PartialView(groupCode);
        }
        public PartialViewResult ListHightLightPosts()
        {
            List<tblPost> posts = db.tblPosts.Where(t => t.Post_Active == true && t.Post_Trash == false).OrderByDescending(t => t.Post_DateCreate).ThenBy(t => t.Post_View).ThenBy(t => t.Post_Rate).Take(7).ToList();
            return PartialView(posts);
        }
    }
}