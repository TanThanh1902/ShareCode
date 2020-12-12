using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShareCode.Models;

namespace ShareCode.Areas.Admin.Controllers
{
    public class tblLanguagesAdminController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();

        // GET: Admin/tblLanguagesAdmin
        public ActionResult Index()
        {
            return View(db.tblLanguages.ToList());
        }

        // GET: Admin/tblLanguagesAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblLanguage tblLanguage = db.tblLanguages.Find(id);
            if (tblLanguage == null)
            {
                return HttpNotFound();
            }
            return View(tblLanguage);
        }

        // GET: Admin/tblLanguagesAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/tblLanguagesAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Lang_ID,Lang_Name,Lang_Logo,Lang_Trash")] tblLanguage tblLanguage)
        {
            if (ModelState.IsValid)
            {
                db.tblLanguages.Add(tblLanguage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblLanguage);
        }

        // GET: Admin/tblLanguagesAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblLanguage tblLanguage = db.tblLanguages.Find(id);
            if (tblLanguage == null)
            {
                return HttpNotFound();
            }
            return View(tblLanguage);
        }

        // POST: Admin/tblLanguagesAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Lang_ID,Lang_Name,Lang_Logo,Lang_Trash")] tblLanguage tblLanguage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblLanguage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblLanguage);
        }

        // GET: Admin/tblLanguagesAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblLanguage tblLanguage = db.tblLanguages.Find(id);
            if (tblLanguage == null)
            {
                return HttpNotFound();
            }
            return View(tblLanguage);
        }

        // POST: Admin/tblLanguagesAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblLanguage tblLanguage = db.tblLanguages.Find(id);
            db.tblLanguages.Remove(tblLanguage);
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
