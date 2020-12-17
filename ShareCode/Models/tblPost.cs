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
    
    public partial class tblPost
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblPost()
        {
            this.tblComments = new HashSet<tblComment>();
            this.tblDownLoads = new HashSet<tblDownLoad>();
            this.tblFavorites = new HashSet<tblFavorite>();
            this.tblOrders = new HashSet<tblOrder>();
            this.tblReports = new HashSet<tblReport>();
            this.tblRates = new HashSet<tblRate>();
            this.tblPostLangs = new HashSet<tblPostLang>();
        }
    
        public int Post_ID { get; set; }
        public string Post_Title { get; set; }
        public string Post_Avata { get; set; }
        public string Post_ViewMoreImage { get; set; }
        public string Post_Description { get; set; }
        public Nullable<int> Post_View { get; set; }
        public Nullable<int> Post_CountDownLoad { get; set; }
        public string Post_LinkDown { get; set; }
        public Nullable<System.DateTime> Post_DateCreate { get; set; }
        public Nullable<int> Post_Cat { get; set; }
        public Nullable<int> Post_User { get; set; }
        public Nullable<int> Post_Favorite { get; set; }
        public string Post_TutorialSetup { get; set; }
        public Nullable<decimal> Post_Price { get; set; }
        public Nullable<int> Post_Genres { get; set; }
        public Nullable<int> Post_Group { get; set; }
        public Nullable<bool> Post_Active { get; set; }
        public Nullable<bool> Post_Trash { get; set; }
        public string Post_Code { get; set; }
    
        public virtual tblCategory tblCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblComment> tblComments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblDownLoad> tblDownLoads { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblFavorite> tblFavorites { get; set; }
        public virtual tblGenre tblGenre { get; set; }
        public virtual tblGroupCode tblGroupCode { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblOrder> tblOrders { get; set; }
        public virtual tblUser tblUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblReport> tblReports { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblRate> tblRates { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPostLang> tblPostLangs { get; set; }
    }
}
