﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShareCode.Areas.Admin.Controllers
{
    public class SettingController : Controller
    {
        // GET: Admin/Setting
        public ActionResult EditHome()
        {
            return View();
        }
    }
}