using LMS_002.DbContext_db;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace LMS_002.Admin
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
            int count = int.Parse(count_book.Value);
            string int_types = Types.Value.Split(' ')[0];
            string st_types = Types.Value.Split(' ')[1];
            System.Diagnostics.Debug.WriteLine("total books: " + count);

            for (int i = 0; i < count; i++)
            {
                switch (Types.SelectedIndex)
                {
                    case 0:
                        f_book.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName));
                        break;
                    case 1:
                        f_book.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName));
                        f_ebook.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\ebook\", f_ebook.FileName));
                        break;
                    case 3:
                        f_video.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\video\", f_video.FileName));
                        f_book.SaveAs(pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName));
                        break;

                }

                string sql = $@"INSERT INTO [dbo].[MD_catralog_book]
                           ([st_name_book]
                           ,[st_ISBN_ISSN]
                           ,[st_detail_book]
                           ,[dt_DATE_modify]
                           ,[st_type_book]
                           ,[st_type_book_name]
                           ,[bool_current]
                           ,[int_cheeckin_out]
                           ,[st_cheeckin_out]
                          
                           ,[st_process_name_user]
                           ,[int_status_yet]
                           ,[st_status_yet]
                           ,[img_path]
                           ,[video_path]
                           ,[ebook_path]
                           ,[st_lend_name]
                           ,[st_author]
                           ,[barcode]
                           ,[count_print]
                           ,[plate_print]
                           ,[company_print]
                           ,[int_lang]
                           ,[st_lang]
                           , int_count_view_book )
                     VALUES
                           ('{ Convert.ToString(txt_book_name.Value, new CultureInfo("th-TH")) }' ,
                               '{ txt_iss_num.Value }',
                               '{ detail_book.Value }',
                               '{ DateTime.UtcNow.ToString("yyyy/MM/dd", new CultureInfo("en-EN")) }',
                               '{ int_types}',
                               '{st_types}',
                               '{"False"}',
                               {0},
                               '{"พร้อมยืม"}',
                               '{ Session["user"].ToString() }',
                               {0 },
                               '{""}',
                               '{pathFile_.instance_.pathas(@"~\Doc_all_type\topic\", f_book.FileName) }',
                               '{ pathFile_.instance_.pathas(@"~\Doc_all_type\video\", f_video.PostedFile.FileName) }',
                               '{ pathFile_.instance_.pathas(@"~\Doc_all_type\ebook\", f_ebook.FileName) }',
                               '{""}',
                               '{txt_author.Value }',
                               '{ txt_bar_code.Value }',
                               '{ count_print.Value }',
                               '{plate_print.Value}',
                               '{ company_print.Value }',
                               {0},
                               '{"ภาษาไทย"}' , 0)";

                var result = Conncetions_db.Instance.Connection_command(sql);

            }


        }

    }
}