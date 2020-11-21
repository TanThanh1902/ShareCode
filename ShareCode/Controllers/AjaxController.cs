using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;

namespace ShareCode.Controllers
{
    public class AjaxController : Controller
    {
        DBShareCodeEntities db = new DBShareCodeEntities();
        // GET: Ajax
        // Interactive with post
        public JsonResult AddFavorite(int? id)
        {
            if (id == null)
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }
            tblUser user = (tblUser)Session["member"];
            tblFavorite favorite = new tblFavorite()
            {
                Favorite_User = user.User_ID,
                Favorite_Post = id,
                Favorite_DateAdd = DateTime.Now
            };
            db.tblFavorites.Add(favorite);
            db.tblPosts.Find(id).Post_Favorite++;
            db.SaveChanges();

            return Json(db.tblPosts.Find(id).Post_Favorite, JsonRequestBehavior.AllowGet);
        }

        public JsonResult RemoveFavorite(int? id)
        {
            if (id == null)
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }
            tblUser user = (tblUser)Session["member"];
            tblFavorite favorite = db.tblFavorites.SingleOrDefault(t => t.Favorite_Post == id && t.Favorite_User == user.User_ID);
            db.tblFavorites.Remove(favorite);
            db.tblPosts.Find(id).Post_Favorite--;
            db.SaveChanges();

            return Json(db.tblPosts.Find(id).Post_Favorite, JsonRequestBehavior.AllowGet);
        }
        public JsonResult CountDownLoad(int? id)
        {
            if (id == null)
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }
            tblUser user = (tblUser)Session["member"];
            tblDownLoad downLoad = new tblDownLoad()
            {
                DownLoad_Post = id,
                DownLoad_User = user.User_ID,
                DownLoad_DateDown = DateTime.Now
            };
            db.tblDownLoads.Add(downLoad);
            db.tblPosts.Find(id).Post_CountDownLoad++;
            db.SaveChanges();

            return Json(db.tblPosts.Find(id).Post_CountDownLoad, JsonRequestBehavior.AllowGet);
        }
    }
}