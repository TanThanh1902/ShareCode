﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShareCode.Models
{
    public class ViewPayMomo
    {
        public string OrderId { get; set; }
        public string Amount { get; set; }
    }
    public class ViewPayCoin
    {
        public int PostId { get; set; }
        public int UserID { get; set; }
        public double Amount { get; set; }
    }
}