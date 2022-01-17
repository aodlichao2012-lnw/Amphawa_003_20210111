using LMS_002.DbContext_db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Page
{
    public partial class Add_book_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void chk_book_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void searchCatalog_ServerClick(object sender, EventArgs e)
        {
            int count = Convert.ToInt32(count_book.Value.Equals("") ? "0" : count_book.Value);
            if(count > 0)
            {
                for (int i = 0; i <= count; i++)
                {
                    if(Types.SelectedIndex == 0)
                    {
                        f_book.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName));
                    } else if(Types.SelectedIndex == 1)
                    {
                        f_book.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName));
                        f_ebook.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\ebook\", f_ebook.FileName));
                    } else if(Types.SelectedIndex == 3)
                    {
                        f_video.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\video\", f_video.FileName));
                        f_book.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName));
                    }
                   
                   
                 
                    var result = Conncetions_db.Instance.Connection_command(@"INSERT INTO [dbo].[MD_catralog_book]
                               ([st_name_book]
                               ,[st_ISBN_ISSN]
                               ,[st_detail_book]
                               ,[dt_DATE_modify]
                               ,[st_type_book]
                               ,[st_type_book_name]
                               ,[bool_current]
                               ,[int_cheeckin_out]
                               ,[st_cheeckin_out]
                               ,[dt_checkout_date]
                               ,[dt_checkin_date]
                               ,[dt_checkin_due]
                               ,[img_book]
                               ,[st_process_name_user]
                               ,[int_status_yet]
                               ,[st_status_yet]
                               ,[img_path]
                               ,[video_path]
                               ,[ebook_path]
                               ,[st_lend_name]
                               ,[st_author]
                               ,[st_call_number]
                               ,[count_print]
                               ,[plate_print]
                               ,[company_print]
                               ,[int_lang]
                               ,[st_lang])
                         VALUES
                               ('" + txt_book_name.Value + "'," +
                                   "'"+txt_iss_num.Value+"'," +
                                   "'"+detail_book.Value+"'," +
                                   ""+DateTime.Now.ToString("yyyy/MM/dd")+"," +
                                   ""+Types.Value+"," +
                                   "''," +
                                   "'False'," +
                                   "0," +
                                   "'พร้อมยืม'," +
                                   "null," +
                                   "null," +
                                   "null," +
                                   "null," +
                                   "'"+Session["user"].ToString()+"'," +
                                   "0 ," +
                                   "''," +
                                   "'"+ pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName) + "'," +
                                   "'"+ pathFile_.instance_.pathas(@"~\Doc_all_type\video\", f_video.PostedFile.FileName)+"' ," +
                                   "'"+ pathFile_.instance_.pathas(@"~\Doc_all_type\ebook\", f_ebook.FileName) + "'," +
                                   "''," +
                                   "'"+txt_author.Value+"'," +
                                   "'"+txt_bar_code+"'," +
                                   ""+count_print.Value+"," +
                                   "'"+plate_print.Value+"'," +
                                   "'"+company_print.Value+"'," +
                                   "0," +
                                   "'ภาษาไทย') ");
                }


            }
            else
            {
                Response.Write(@"<script>alert('กรุณากำหนด จำนวนหนังสือ ด้วยครับ')</script>");
            }
        }
           
    }
}