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
        // GET: Payments
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult PayMomo(ViewPayMomo momo)
        {
            string endpoint = ConfigurationManager.AppSettings["endpoint"].ToString();
            string partnerCode = ConfigurationManager.AppSettings["partnerCode"].ToString();
            string accessKey = ConfigurationManager.AppSettings["accessKey"].ToString();
            string serectKey = ConfigurationManager.AppSettings["serectKey"].ToString();
            string orderInfo = "DH" + DateTime.Now.ToString("yyyyMMddHHmmss");
            string returnUrl = ConfigurationManager.AppSettings["returnUrl"].ToString();
            string notifyUrl = ConfigurationManager.AppSettings["notifyUrl"].ToString();

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
                {"extraData", extraData }
            };

            //string responesFromMoMo = PaymentRequest
            return View();
        }
    }
}