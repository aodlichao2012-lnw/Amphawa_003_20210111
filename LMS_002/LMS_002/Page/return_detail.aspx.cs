using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Page
{
    public partial class return_detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sendto_lend_ServerClick(object sender, EventArgs e)
        {
            return_main.Visible = false;
            detail_return.Visible = true;
            SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["amphawacontect2"].ConnectionString;
            SqlDataSource1.SelectCommand = "select * from [dbo].[MD_catralog_book]";
            SqlDataSource1.DataBind();
            DataView data = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView item in data)
            {
                lb_list_book.Text = "\n" + item["st_name_book"].ToString() + ": รหัสหนังสือ =  " + item["st_ISBN_ISSN"].ToString() + "\n";
            }
        }

        protected void clear_list_ServerClick(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}