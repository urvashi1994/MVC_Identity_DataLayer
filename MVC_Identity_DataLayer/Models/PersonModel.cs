using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC_Identity_DataLayer.Models
{
    public class PersonModel
    {
        [Display(Name = "ID")][Key]
        public int PersonID { get; set; }

        [Display(Name = "FirstName")]
        public string FirstName { get; set; }

        [Display(Name = "LastName")]
        public string LastName { get; set; }

        public int Age { get; set; }

        [Display(Name = "Email")]
        public string EmailID { get; set; }
        public string Gender { get; set; }

        [Display(Name = "AddressID")]
        public int AddressID { get; set; }
       
    }
}