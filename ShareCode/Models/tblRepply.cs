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
    
    public partial class tblRepply
    {
        public int Rep_ID { get; set; }
        public string Rep_Contents { get; set; }
        public Nullable<int> Rep_User { get; set; }
        public Nullable<int> Rep_Comment { get; set; }
        public Nullable<System.DateTime> Rep_DatePost { get; set; }
        public Nullable<bool> Rep_Trash { get; set; }
    
        public virtual tblComment tblComment { get; set; }
        public virtual tblUser tblUser { get; set; }
    }
}
