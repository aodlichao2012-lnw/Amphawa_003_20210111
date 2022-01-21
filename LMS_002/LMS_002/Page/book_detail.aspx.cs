using LMS_002.DbContext_db;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS_002.Page
{
    public partial class book_detail : System.Web.UI.Page
    {
        string issn = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["issn"] != null)
            {
                issn = Request.QueryString["issn"].ToString();
                DataTable dt = new DataTable();
                dt = Conncetions_db.Instance.Connection_command("select *   FROM [dbo].[MD_catralog_book] where st_ISBN_ISSN = '" + issn + "'");
                StringBuilder text = new StringBuilder();
                if (dt.Rows.Count > 0)
                {
                    text.Append($"<p> ชื่อหนังสือ : { dt.Rows[0]["st_name_book"].ToString() }</p>");
                    text.Append($"<p> ISSN : { dt.Rows[0]["st_ISBN_ISSN"].ToString() }</p>");
                    text.Append($"<p> วันที่นำเข้า : { dt.Rows[0]["dt_DATE_modify"].ToString() }</p>");
                    text.Append($"<p> ประเภทหนังสือ : { dt.Rows[0]["st_type_book_name"].ToString() }</p>");
                    text.Append($"<p> รูป : <img src='{ dt.Rows[0]["st_name_book"].ToString() }' width='100' height='100' /></p>");
                    text.Append($"<p> สถานะหนังสือ : { dt.Rows[0]["st_cheeckin_out"].ToString() }</p>");
                    text.Append($"<p> จำนวนที่พิมพ์ : { dt.Rows[0]["count_print"].ToString() }</p>");
                    text.Append($"<p> สถานที่พิมพ์ : { dt.Rows[0]["plate_print"].ToString() }</p>");
                    text.Append($"<p> บริษัทที่พิมพ์ : { dt.Rows[0]["company_print"].ToString() }</p>");
                    text.Append($"<p> รายละเอียดหนังสือ : { dt.Rows[0]["st_detail_book"].ToString() }</p>");
                    text.Append($"<p> ภาษา : { dt.Rows[0]["st_lang"].ToString() }</p>");
                    text.Append($"<p> จำนวนครั้งที่ ดู  : { dt.Rows[0]["int_count_view_book"].ToString() }</p>");

                    detail.Text = text.ToString();
                    int count = Convert.ToInt32(dt.Rows[0]["int_count_view_book"].ToString()) + 1;

                    dt = Conncetions_db.Instance.Connection_command("update  [dbo].[MD_catralog_book] set int_count_view_book = " + count + " where st_ISBN_ISSN = '" + issn + "'");
                }
            }
        }

        protected void sendto_lend_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Page/List_book.aspx");
        }
    }
}