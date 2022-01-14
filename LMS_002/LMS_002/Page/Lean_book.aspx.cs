using LMS_002.DbContext_db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Page
{
    public partial class Lean_book : System.Web.UI.Page
    {
          static  int  count  =  0 ;

        string profile = "";
        protected void Page_Load(object sender, EventArgs e)
        {
       
            if(!Page.IsPostBack)
            {
                if (Session["user"] != null)
                {
                    profile = Session["user"].ToString();
                    GridView1.DataSource = Conncetions_db.Connection_command("select * from [dbo].[MD_catralog_book] left join MD_statusbook on" +
                   " [dbo].[MD_catralog_book].int_cheeckin_out = MD_statusbook.self_id  where  st_process_name_user = '" + profile + "' AND int_cheeckin_out = 3 ");
                    GridView1.DataBind();
                    ddl_account.DataSource = Conncetions_db.Connection_command("select * from [dbo].[MD_Account]");
                    ddl_account.DataTextField = "int_id";
                    ddl_account.DataValueField = "st_user";
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
                    GridView1.DataSource = (from db_ in db.tb_cattalog
                                            where db_.int_cheeckin_out != 3
                                            join status in db.tb_statusbooks on db_.int_cheeckin_out equals status.self_id
                                            select new
                                            {
                                                status.status_book,
                                                db_.bool_current
    ,
                                                db_.dt_DATE_modify,
                                                db_.st_ISBN_ISSN,
                                                db_.st_name_book,
                                                db_.st_detail_book,
                                                db_.st_type_book_name,
                                                db_.int_id_catalog_book,
                                                db_.st_type_book,
                                                db_.img_book,
                                                db_.img_path
                                            }).ToList();
                    GridView1.DataBind();
                }
            }
            catch
            {

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    CheckBox checkBox = e.Row.Cells[0].Controls[0] as CheckBox;
            //    checkBox.Enabled = true;
            //}
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
            var id  ="";
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                using (var db = new Dbcon_wan())
                {

                    CheckBox chk = (CheckBox)gvrow.FindControl("chkrows");
                    if (chk != null & chk.Checked)
                    {
                         id += Convert.ToInt32(gvrow.Cells[1].Text);

                        //                           var update = (from db_ in db.tb_cattalog

                        //                                                    where db_.int_id_catalog_book == id
                        //                                                    join status in db.tb_statusbooks on db_.int_cheeckin_out equals status.self_id
                        //                                                    select new
                        //                                                    {
                        //                                                        status.status_book,
                        //                                                        db_.bool_current
                        //,
                        //                                                        db_.dt_DATE_modify,
                        //                                                        db_.st_ISBN_ISSN,
                        //                                                        db_.st_name_book,
                        //                                                        db_.st_detail_book,
                        //                                                        db_.st_type_book_name,
                        //                                                        db_.int_id_catalog_book,
                        //                                                        db_.st_type_book
                        //                                                    }

                        //
                        //   ).FirstOrDefault();
                        try
                        {
                         
                            var update = Conncetions_db.Connection_command(@"UPDATE [dbo].[MD_catralog_book] SET  [int_cheeckin_out] = 1 ,[st_cheeckin_out] = 'ถูกยืม' , [dt_checkout_date] = "+min_date.Value+", " +
                                " [dt_checkin_date] = "+max_date.Value +" st_process_name_user = '" + profile + "' , st_lend_name = '"+account_cus+"'  WHERE int_id_catalog_book = " + id + "");
                            var update_cus = Conncetions_db.Connection_command(@"UPDATE [dbo].[MD_Account] SET [st_count] = "+count+", [decimal_cus_from_least] = 0.00  WHERE st_user = " +
                                " '"+account_cus+"'");


                            id += Convert.ToInt32(gvrow.Cells[3].Text);

                        }
                        catch
                        {
                            Response.Redirect(@"<script>alert('หนังสือที่ท่านเลือก ได้ถูกเตรียมที่จะยืมแล้ว')</script>");
                        }



                    }
                }
            }
            GridView1.DataBind();
            Response.Redirect(@"~/Report_pdf/slip_lend_pdf.aspx?user="+profile+"&cus="+account_cus+"&id_iss="+id+"");
        }
    }
}