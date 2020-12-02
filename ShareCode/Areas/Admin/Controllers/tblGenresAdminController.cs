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
    public class tblGenresAdminController : Controller
    {
        private DBShareCodeEntities db = new DBShareCodeEntities();

        // GET: Admin/tblGenresAdmin
        public ActionResult Index()
        {
            return View(db.tblGenres.ToList());
        }

        // GET: Admin/tblGenresAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblGenre tblGenre = db.tblGenres.Find(id);
            if (tblGenre == null)
            {
                return HttpNotFound();
            }
            return View(tblGenre);
        }

        // GET: Admin/tblGenresAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/tblGenresAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Genres_ID,Genres_Name")] tblGenre tblGenre)
        {
            if (ModelState.IsValid)
            {
                db.tblGenres.Add(tblGenre);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblGenre);
        }

        // GET: Admin/tblGenresAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblGenre tblGenre = db.tblGenres.Find(id);
            if (tblGenre == null)
            {
                return HttpNotFound();
            }
            return View(tblGenre);
        }

        // POST: Admin/tblGenresAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Genres_ID,Genres_Name")] tblGenre tblGenre)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblGenre).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblGenre);
        }

        // GET: Admin/tblGenresAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblGenre tblGenre = db.tblGenres.Find(id);
            if (tblGenre == null)
            {
                return HttpNotFound();
            }
            return View(tblGenre);
        }

        // POST: Admin/tblGenresAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblGenre tblGenre = db.tblGenres.Find(id);
            db.tblGenres.Remove(tblGenre);
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
