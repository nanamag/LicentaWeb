//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace eNotaryWebRole.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class JobType
    {
        public JobType()
        {
            this.PersonDetails = new HashSet<PersonDetail>();
        }
    
        public long ID { get; set; }
        public string JobName { get; set; }
        public bool Disabled { get; set; }
    
        public virtual ICollection<PersonDetail> PersonDetails { get; set; }
    }
}