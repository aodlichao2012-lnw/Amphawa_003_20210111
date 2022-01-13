using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LMS_002.DbContext_db
{
    public static class Conncetions_db
    {
        public static DataTable Connection_command(string cmd)
        {
            
            using (SqlConnection cl_con = new SqlConnection(ConfigurationManager.ConnectionStrings["amphawacontect"].ConnectionString))
            {
                SqlCommand command = new SqlCommand(cmd,cl_con);
                command.Connection.Open();
                command.ExecuteNonQuery();
                 SqlDataAdapter da = new SqlDataAdapter(command);
                 DataTable dt = new DataTable();
                da.Fill(dt);
               cl_con.Close();
                if(dt.Rows.Count > 0)
                {
                      return dt;
                }
              return null;
                
            }
        }
    }
}