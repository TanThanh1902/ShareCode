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

namespace ShareCode.Controllers
{
    public class ReppliesController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();
        private const int PAGE_SIZE = 7;
        // GET: Repplies
        public ActionResult Index()
        {
            var tblRepplies = db.tblRepplies.Include(t => t.tblComment).Include(t => t.tblUser);
            return View(tblRepplies.ToList());
        }

        public ActionResult GetRepliesByCmtId(int? pagerep, int? id)
        {
            if(id == null)
            {
                return HttpNotFound();
            }
            IPagedList<tblRepply> replies = db.tblRepplies.Where(t => t.Rep_Comment == id && t.Rep_Trash == false).OrderBy(t => t.Rep_DatePost).ToPagedList(pagerep ?? 1, PAGE_SIZE);
            return PartialView(replies);
        }

        // GET: Repplies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRepply tblRepply = db.tblRepplies.Find(id);
            if (tblRepply == null)
            {
                return HttpNotFound();
            }
            return View(tblRepply);
        }

        // GET: Repplies/Create
        public ActionResult Create()
        {
            ViewBag.Rep_Comment = new SelectList(db.tblComments, "Comment_ID", "Comment_Contents");
            ViewBag.Rep_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName");
            return View();
        }

        // POST: Repplies/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Rep_ID,Rep_Contents,Rep_User,Rep_Comment,Rep_DatePost")] tblRepply tblRepply)
        {
            tblUser user = db.tblUsers.Find(int.Parse(Request.Cookies["member_id"].Value.ToString()));
            if (ModelState.IsValid)
            {
                tblRepply.Rep_Trash = false;
                tblRepply.Rep_DatePost = DateTime.Now;
                tblRepply.Rep_User = user.User_ID;
                db.tblRepplies.Add(tblRepply);
                db.SaveChanges();
                return View(tblRepply);
            }

            ViewBag.Rep_Comment = new SelectList(db.tblComments, "Comment_ID", "Comment_Contents", tblRepply.Rep_Comment);
            ViewBag.Rep_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblRepply.Rep_User);
            return View(tblRepply);
        }

        // GET: Repplies/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRepply tblRepply = db.tblRepplies.Find(id);
            if (tblRepply == null)
            {
                return HttpNotFound();
            }
            ViewBag.Rep_Comment = new SelectList(db.tblComments, "Comment_ID", "Comment_Contents", tblRepply.Rep_Comment);
            ViewBag.Rep_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblRepply.Rep_User);
            return View(tblRepply);
        }

        // POST: Repplies/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Rep_ID,Rep_Contents,Rep_User,Rep_Comment,Rep_DatePost")] tblRepply tblRepply)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblRepply).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Rep_Comment = new SelectList(db.tblComments, "Comment_ID", "Comment_Contents", tblRepply.Rep_Comment);
            ViewBag.Rep_User = new SelectList(db.tblUsers, "User_ID", "User_DisplayName", tblRepply.Rep_User);
            return View(tblRepply);
        }

        // GET: Repplies/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRepply tblRepply = db.tblRepplies.Find(id);
            if (tblRepply == null)
            {
                return HttpNotFound();
            }
            return View(tblRepply);
        }

        // POST: Repplies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblRepply tblRepply = db.tblRepplies.Find(id);
            db.tblRepplies.Remove(tblRepply);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
