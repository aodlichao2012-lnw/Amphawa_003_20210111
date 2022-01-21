using LMS_002.DbContext_db;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Admin
{

    public partial class Lean_book : System.Web.UI.Page
    {
        static int count = 0;
        DataTable dt = new DataTable();
        string profile = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            this.Page.SetFocus(txt_keyword.ClientID);
            if (!Page.IsPostBack)
            {
                if (Session["user"] != null)
                {
                    profile = Session["user"].ToString();
                    GridView1.DataSource = Conncetions_db.Instance.Connection_command("select * from [dbo].[MD_catralog_book] left join MD_status_book_type on " +
                        "[dbo].[MD_catralog_book].int_cheeckin_out = MD_status_book_type.self_id   where  st_process_name_user = '" + profile + "' AND int_cheeckin_out = 3 ");
                    GridView1.DataBind();
                    ddl_account.DataSource = Conncetions_db.Instance.Connection_command("select * from [dbo].[MD_Account]");
                    ddl_account.DataTextField = "st_user";
                    ddl_account.DataValueField = "int_id";
                    ddl_account.SelectedIndex = 1;
                    ddl_account.DataBind();
                }
            }



        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = e.NewEditIndex;

            }
            catch
            {

            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                using (var db = new Dbcon_wan())
                {

                    GridView1.DataSource = Conncetions_db.Instance.Connection_command("select * from [dbo].[MD_catralog_book] left join MD_status_book_type on " +
                                       "[dbo].[MD_catralog_book].int_cheeckin_out = MD_status_book_type.self_id   where  st_process_name_user = '" + profile + "' AND int_cheeckin_out = 3 ");
                    GridView1.DataBind();
                }
            }
            catch
            {

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void chkrows_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            if (chk.Checked)
            {
                count += 1;
                count_book.Value = count.ToString();
            }
            else
            {
                count -= 1;
                count_book.Value = count.ToString();
            }
        }

        protected void searchCatalog_ServerClick(object sender, EventArgs e)
        {
            string account_cus = ddl_account.SelectedItem.Text;
            var id = "";
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                using (var db = new Dbcon_wan())
                {

                    CheckBox chk = (CheckBox)gvrow.FindControl("chkrows");
                    if (chk != null & chk.Checked)
                    {
                        id += Convert.ToInt32(gvrow.Cells[1].Text);

                        try
                        {
                            profile = Session["user"].ToString();
                            string min = Convert.ToDateTime(min_date.Value).ToString("yyyy/MM/dd", new CultureInfo("en-EN"));
                            string max = Convert.ToDateTime(max_date.Value).ToString("yyyy/MM/dd", new CultureInfo("en-EN"));
                            var update = Conncetions_db.Instance.Connection_command(@"UPDATE [dbo].[MD_catralog_book] SET  [int_cheeckin_out] = 1 ,[st_cheeckin_out] = 'ถูกยืม' , [dt_checkout_date] = " + min + ", " +
                                " [dt_checkin_date] = " + max + " , st_process_name_user = '" + profile + "' , st_lend_name = '" + account_cus + "'  WHERE int_id_catalog_book = " + id + "");
                            var update_cus = Conncetions_db.Instance.Connection_command(@"UPDATE [dbo].[MD_Account] SET [st_count] = " + count + ", [decimal_cus_from_least] = 0.00  WHERE st_user = " +
                                " '" + account_cus + "'");
                            count = 0;
                        }
                        catch (Exception ex)
                        {
                            ex.Message.ToString();
                        }



                    }
                }
            }
            Response.Redirect(@"../Report_pdf/slip_lend_pdf.aspx?user=" + profile + "&cus=" + account_cus + ")");
        }

        protected void txt_keyword_TextChanged(object sender, EventArgs e)
        {
            try
            {

                string select = $@"SELECT int_id_catalog_book , st_name_book ,  st_ISBN_ISSN  , img_path , st_detail_book , dt_DATE_modify , st_cheeckin_out ,  tb_books_type.Type_book as Type_book
                            , MD_status_book_type.status_book as status_book 
                            FROM MD_catralog_book
                            LEFT JOIN MD_status_book_type ON MD_catralog_book.int_cheeckin_out = MD_status_book_type.self_id
                            INNER JOIN dbo.tb_books_type ON MD_catralog_book.st_type_book = tb_books_type.self_id  
                                                                   WHERE barcode LIKE  '{txt_keyword.Text}' AND MD_status_book_type.self_id = 0
                                                                 ";


                dt = Conncetions_db.Instance.Connection_command(@"" + select + "");
                if (dt.Rows == null)
                {
                    Response.Write(@"<script>alert('ไม่มีหนังสือ อยู่ในระบบ')</script>");
                }
                else
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }


            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }
    }
}