using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LMS_002.Models
{
    public class MD_catralog_book
    {
         //ไฟล์ E-book
        [Key]
        public int int_id_catalog_book { get; set; }
        public int[] int_show_count_enries = new int[]
        {
            10 , 20 ,30 ,50 ,100
        };

        public string st_name_book { get; set; }
        public string st_ISBN_ISSN { get; set; }
        public string st_detail_book { get; set; }
        public DateTime dt_DATE_modify { get; set; } = DateTime.Now;

        public int st_type_book { get; set; }
        public string st_type_book_name { get; set; }
        public bool bool_current { get; set; }

        //เพิ่มทีหลัง

        public int int_cheeckin_out { get; set; }
        public string st_cheeckin_out { get; set; }


        public DateTime dt_checkout_date { get; set; }
        public DateTime dt_checkin_date { get; set; }
        public DateTime dt_checkin_due { get; set; } = DateTime.Now.AddMonths(1);
        public Byte[] img_book { get; set; } 



        //ไฟล์เสียง

        //ไฟล์วิดีโอ




    }
}
