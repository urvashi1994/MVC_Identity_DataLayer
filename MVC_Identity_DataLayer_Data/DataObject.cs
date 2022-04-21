using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace MVC_Identity_DataLayer_Data
{
    public class DataObject //this is information hiding concept
    {
        private string _connectionString;
        public DataObject()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["MVC"].ConnectionString;
        }
        public string connectionString => _connectionString;
    }
}