using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Services;

namespace LMS_002.Admin
{
    [AllowAnonymous]
    public class DataController : ApiController
    {
        [WebMethod]
        public static object biblio_all()
        {
            return "0";
        }

        [WebMethod]
        public static object all()
        {
            return "0";
        }  
        
        [WebMethod]
        public static object lent()
        {
            return "0";
        }
        
        [WebMethod]
        public static object available()
        {
            return "0";
        }
    }
}
