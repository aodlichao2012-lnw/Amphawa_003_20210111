using LMS_002.DbContext_db;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Admin
{
    public partial class return_detail : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
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
            foreach(DataRowView item in data)
            {
                lb_list_book.Text = "\n"+item["st_name_book"].ToString() +": รหัสหนังสือ =  "+item["st_ISBN_ISSN"].ToString() +"\n" ;
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

        protected void txt_barcode_ServerChange(object sender, EventArgs e)
        {        
         
        }

        protected void search_ServerClick(object sender, EventArgs e)
        {
            try
            {

                string select = $@"SELECT int_id_catalog_book , st_name_book ,  st_ISBN_ISSN  , img_path , st_detail_book , dt_DATE_modify , st_cheeckin_out ,  tb_books_type.Type_book as Type_book
                            , MD_status_book_type.status_book as status_book 
                            FROM MD_catralog_book
                            LEFT JOIN MD_status_book_type ON MD_catralog_book.int_cheeckin_out = MD_status_book_type.self_id
                            INNER JOIN dbo.tb_books_type ON MD_catralog_book.st_type_book = tb_books_type.self_id  
                                                                   WHERE barcode LIKE  '{txt_barcode.Value}' AND MD_status_book_type.self_id = 1
                                                                 ";


                dt = Conncetions_db.Instance.Connection_command(@"" + select + "");
                if(dt == null)
                {
                    Response.Write(@"<script>alert('หนังสือเล่มที่คุณค้นหา ยังไม่ถูกยืม')</script>");
                    sendto_lend.Visible = false;
                }
                else
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    sendto_lend.Visible = true;
                }
           

            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }
    }
}