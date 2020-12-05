using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ShareCode.Models;

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
                Session["member"] = logUser;

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
                Session["member"] = logUser;
                return PartialView("ajaxLogin", log);
            }
            ViewBag.tbsai = true;
            return PartialView("ajaxLogin", log);
        }

        public ActionResult LogOut()
        {
            Session["member"] = null;
            return RedirectToAction("LogIn");
        }

        // manager account
        public ActionResult MyInfo()
        {
            if (Session["member"] == null)
            {
                return RedirectToAction("LogIn");
            }
            tblUser user = (tblUser)Session["member"];
            return View(user);
        }
        public ActionResult ResetPassword()
        {
            if(Session["member"] == null)
            {
                return RedirectToAction("LogIn");
            }
            tblUser user = (tblUser)Session["member"];
            return View(user);
        }
        [HttpPost]
        public ActionResult ResetPassword(ViewResetPassword resetPassword)
        {
            tblUser user = (tblUser)Session["member"];
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