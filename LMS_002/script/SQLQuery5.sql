UPDATE [dbo].[MD_catralog_book] SET  
[int_cheeckin_out] = 3 ,[st_cheeckin_out] = 'เตรียมพร้อมเพื่อยืม' ,
[dt_checkout_date] = 01/17/2022,  
[dt_checkin_date] = 01/29/2022 ,
st_process_name_user = 'asdrt009' ,
st_lend_name = ''  WHERE int_id_catalog_book = 4


UPDATE [dbo].[MD_catralog_book] SET 
[int_cheeckin_out] = 1 ,[st_cheeckin_out] 
= 'ถูกยืม' , [dt_checkout_date] = 2022/01/19,
[dt_checkin_date] = 2022/01/28 , st_process_name_user
= 'asdrt009' , st_lend_name = 'asdrt009'  WHERE int_id_catalog_book = 4

UPDATE [dbo].[MD_Account] SET [st_count] = 1, [decimal_cus_from_least] = 0.00  WHERE st_user =  'asdrt009'



SELECT * FROM[dbo].[MD_catralog_book]
left join dbo.MD_Account on dbo.MD_catralog_book.st_process_name_user
= dbo.MD_Account.st_user where dbo.MD_catralog_book.st_process_name_user
= 'asdrt009' 