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
    
    public partial class tblReport
    {
        public int Report_ID { get; set; }
        public string Report_Contents { get; set; }
        public Nullable<System.DateTime> Report_DateSend { get; set; }
        public Nullable<int> Report_User { get; set; }
        public Nullable<int> Report_Blog { get; set; }
        public Nullable<int> Report_Post { get; set; }
    
        public virtual tblBlog tblBlog { get; set; }
        public virtual tblPost tblPost { get; set; }
    }
}
