﻿using LMS_002.DbContext_db;
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
                for (int i = 0; i < count; i++)
                {
                    f_video.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\video\", f_video.FileName));
                    f_ebook.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\ebook\", f_ebook.FileName));
                    f_book.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName));
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
                                   "'"+txt_iss_num.Value+"'" +
                                   "'"+detail_book.Value+"'" +
                                   ""+DateTime.Now.ToString("yyyy/MM/dd")+"" +
                                   "<st_type_book, int," +
                                   "<st_type_book_name, nvarchar(max)," +
                                   "<bool_current, bit," +
                                   "<int_cheeckin_out, int," +
                                   "<st_cheeckin_out, nvarchar(max)," +
                                   "<dt_checkout_date, datetime," +
                                   "<dt_checkin_date, datetime," +
                                   "<dt_checkin_due, datetime," +
                                   "<img_book, varbinary(max)," +
                                   "<st_process_name_user, nvarchar(max)," +
                                   "<int_status_yet, int," +
                                   "<st_status_yet, nvarchar(max)," +
                                   "'"+ pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName) + "'," +
                                   "'"+ pathFile_.instance_.pathas(@"~\Doc_all_type\video\", f_video.PostedFile.FileName)+"' ," +
                                   "'"+ pathFile_.instance_.pathas(@"~\Doc_all_type\ebook\", f_ebook.FileName) + "'," +
                                   "<st_lend_name, nvarchar(max)," +
                                   "<st_author, nvarchar(max)," +
                                   "<st_call_number, nvarchar(max)," +
                                   "<count_print, nvarchar(max)," +
                                   "<plate_print, nvarchar(max)," +
                                   "<company_print, nvarchar(max)," +
                                   "<int_lang, int," +
                                   "<st_lang, nvarchar(max),> ");
                }


            }
            else
            {
                Response.Write(@"<script>alert('กรุณากำหนด จำนวนหนังสือ ด้วยครับ')</script>");
            }
        }
           
    }
}