using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ShareCode.Models;
using System.Net;
using System.IO;

namespace ShareCode.Controllers
{
    public class UserController : Controller
    {
        DBShareCodeEntities db = new DBShareCodeEntities();
        // GET: User
        public ActionResult Register()
        {
            ViewBag.Title = "Đăng ký";
            return View();
        }
        [HttpPost]
        public ActionResult Register(ViewRegister register)
        {
            if (ModelState.IsValid)
            {
                tblUser user = new tblUser()
                {
                    User_Email = register.Email,
                    User_DisplayName = register.DisplayName,
                    User_Password = register.Password,
                    User_DateLogin = DateTime.Now,
                    User_Role = 1,
                    User_Active = true,
                    User_Trash = false,
                    User_Token = Guid.NewGuid().ToString()
                };

                db.tblUsers.Add(user);
                db.SaveChanges();

                tblUser logUser = db.tblUsers.SingleOrDefault(t => t.User_Email == register.Email && t.User_Password == register.Password);

                HttpCookie cookie = new HttpCookie("member_id", logUser.User_ID.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);

                return RedirectToAction("MyInfo");
            }
            return View(register);
        }

        public ActionResult Login()
        {
            ViewBag.Title = "Đăng nhập";
            return View("Register");
        }
        [HttpPost]
        public ActionResult Login(ViewLogin log)
        {
            tblUser logUser = db.tblUsers.SingleOrDefault(t => t.User_Email == log.Email && t.User_Password == log.Password);
            if (logUser != null)
            {
                ViewBag.tbsai = false;

                HttpCookie cookie = new HttpCookie("member_id", logUser.User_ID.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);

                return PartialView("ajaxLogin", log);
            }
            ViewBag.tbsai = true;
            return PartialView("ajaxLogin", log);
        }

        public ActionResult LogOut()
        {
            HttpCookie cookie = Request.Cookies["member_id"];
            cookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Set(cookie);
            return RedirectToAction("LogIn");
        }

        // manager account
        public ActionResult MyInfo()
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            return View(user);
        }
        public ActionResult EditInfo()
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            return View(user);
        }
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult EditInfo(tblUser user, HttpPostedFileBase file_img)
        {
            if (ModelState.IsValid)
            {
                if (file_img != null)
                {
                    // delete old image
                    if (user.User_Avata != null)
                    {
                        string fullPath = Request.MapPath("~/Content/Layout/img/users/" + user.User_Avata);
                        System.IO.File.Delete(fullPath);
                    }
                    // update new image
                    var img = Guid.NewGuid().ToString() + Path.GetExtension(file_img.FileName);
                    var pathimg = Path.Combine(Server.MapPath("~/Content/Layout/img/users"), img);
                    file_img.SaveAs(pathimg);
                    user.User_Avata = img;
                }
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("MyInfo");
            }
            return View(user);
        }
        public ActionResult ResetPassword()
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            return View(user);
        }
        [HttpPost]
        public ActionResult ResetPassword(ViewResetPassword resetPassword)
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            tblUser user = db.tblUsers.Find(int.Parse(member_cookie.Value.ToString()));
            if (ModelState.IsValid)
            {
                user.User_Password = resetPassword.NewPassword;
                db.tblUsers.Find(user.User_ID).User_Password = resetPassword.NewPassword;
                db.SaveChanges();

                Session["member"] = user;
                Session["notifi_resetpass"] = "Đổi mật khẩu thành công!";
                return RedirectToAction("MyInfo");
            }
            return View(resetPassword);
        }
    }
}