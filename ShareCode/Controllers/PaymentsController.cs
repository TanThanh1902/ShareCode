using Newtonsoft.Json.Linq;
using ShareCode.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShareCode.Controllers
{
    public class PaymentsController : Controller
    {
        DBShareCodeEntities db = new DBShareCodeEntities();
        // GET: Payments
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PayCoin(ViewPayCoin payCoin)
        {
            if (ModelState.IsValid)
            {
                tblOrder order = new tblOrder()
                {
                    Order_Post = payCoin.PostId,
                    Order_User = payCoin.UserID,
                    Order_TotalPrice = (int)payCoin.Amount,
                    Order_DateAdd = DateTime.Now
                };
                db.tblOrders.Add(order);
                db.SaveChanges();
                db.tblUsers.Find(payCoin.UserID).User_Coin -= (int)payCoin.Amount;
                db.SaveChanges();
                Session["paycoin"] = true;
            }
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult PayMomo(ViewPayMomo momo)
        {
            string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
            string partnerCode = "MOMO828G20201211";
            string accessKey = "I0M0E6bt9OC7nBfz";
            string serectKey = "Bz4LGbbJ9AHHFRRSb92zL18B1Vq5XbfA";
            string orderInfo = "DH" + DateTime.Now.ToString("yyyyMMddHHmmss");
            string returnUrl = "/Payments/Index";
            string notifyUrl = "/Payments/Index";

            string amount = momo.Amount;
            string orderId = Guid.NewGuid().ToString();
            string requestId = Guid.NewGuid().ToString();
            string extraData = "";

            // before sign HMAC SHA256 signature
            string rawHash =
                "partnerCode=" + partnerCode +
                "&accessKey=" + accessKey +
                "&requestId=" + requestId +
                "&amount=" + amount +
                "&orderId=" + orderId +
                "&orderInfo=" + orderInfo +
                "&returnUrl=" + returnUrl +
                "&notifyUrl=" + notifyUrl + 
                "&extraData=" + extraData;
            MoMoSecurity crypto = new MoMoSecurity();
            string signature = crypto.signSHA256(rawHash, serectKey);
            JObject message = new JObject()
            {
                {"partnerCode", partnerCode },
                {"accessKey", accessKey },
                {"requestId", requestId },
                {"amount", amount },
                {"orderId", orderId },
                {"orderInfo", orderInfo },
                {"returnUrl", returnUrl },  
                {"notifyUrl", notifyUrl },
                {"requestType", "captureMoMoWallet" },
                {"extraData", extraData },
                {"signature", signature }
            };
            string url =
                "partnerCode=" + partnerCode +
                "&accessKey=" + accessKey +
                "&requestId=" + requestId +
                "&amount=" + amount +
                "&orderId=" + orderId +
                "&signature=" + signature +
                "&orderInfo=" + orderInfo +
                "&returnUrl=" + returnUrl +
                "&notifyUrl=" + notifyUrl +
                "&extraData=" + extraData +
                "&requestType=" + "captureMoMoWallet";
            string responesFromMoMo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
            JObject jmessage = JObject.Parse(responesFromMoMo);
            string payUrl = jmessage.ToString();
            return Redirect("https://test-payment.momo.vn/gw_payment/payment/qr?" + url);
        }
    }
}