//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShareCode.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblDownLoad
    {
        public int DownLoad_ID { get; set; }
        public Nullable<int> DownLoad_User { get; set; }
        public Nullable<int> DownLoad_Post { get; set; }
        public Nullable<System.DateTime> DownLoad_DateDown { get; set; }
    
        public virtual tblPost tblPost { get; set; }
        public virtual tblUser tblUser { get; set; }
    }
}
