<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_book_Admin.aspx.cs" Inherits="LMS_002.Page.Add_book_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <style>

    </style>
    <script>

    </script>

    <div class="container">
        <div class="row">
               <h2>เพิ่มหนังสือ</h2>
            <div class=" card-body mt-2 col-1 w-100">
                <div class=" col-1 w-25 d-inline-block">
                    <asp:CheckBox ID="chk_book" CssClass="ddl" Text="หนังสือ" OnCheckedChanged="chk_book_CheckedChanged" runat="server" />
                    </div>
                     <div class=" col-1 w-25 d-inline-block">
                    <asp:CheckBox ID="chk__video" CssClass="ddl" Text="วิดีโอ" OnCheckedChanged="chk_book_CheckedChanged" runat="server" />
                         </div>
                          <div class=" col-1 w-25 d-inline-block">
                    <asp:CheckBox ID="chk_e_book" CssClass="ddl" Text="E-book" OnCheckedChanged="chk_book_CheckedChanged" runat="server" />
                              </div>
            </div>
                <div class=" card-body mt-2 col-1 w-100">
                <div class=" col-1 w-25 d-inline-block">
                    รูปหน้าปก
                    <asp:FileUpload ID="f_book" CssClass="ddl"   runat="server" />
                    </div>
                   
                     <div class=" col-1 w-25 d-inline-block">
                         วิดีโอ
                  <asp:FileUpload ID="f_video" CssClass="ddl" runat="server" />
                         </div>
                          <div class=" col-1 w-25 d-inline-block">
                              E-book
                    <asp:FileUpload ID="f_ebook" CssClass="ddl" runat="server" />
                              </div>
            </div>
         
            <div class="  card-body mt-2 col-1 w-100">
                <div class=" card-header"></div>
                 <div class=" card-body">
                     <div class="form-group w-100 text-center">
                    <div class="form-group w-100">
                        <label>บาร์โค้ด</label>
                        <input runat="server"  type="text" id="txt_bar_code" name="Age" class="w-100 ddl" placeholder="รหัสหนังสือ">
                    </div>
                </div>  
                     
                     <div class="form-group w-100 text-center">
                    <div class="form-group w-100">
                        <label>ISBN/ISSN</label>
                        <input runat="server" type="text" id="txt_iss_num" name="Age" class="w-100 ddl" placeholder="รหัสหนังสือ">
                    </div>
                </div> 
                     <div class="form-group w-100 text-center d-inline-block">
                    <div class="form-group w-100">
                        <label>ชื่อหนังสือ</label>
                        <input runat="server" type="text" id="txt_book_name" name="Age" class="w-100 ddl" placeholder="รหัสหนังสือ">
                    </div>
                </div>
                     <div class="form-group w-100 text-center d-inline-block">
                    <div class="form-group w-100">
                        <label>ชื่อผู้แต่ง</label>
                        <input runat="server" type="text" id="txt_author" name="Age" class="w-100 ddl" placeholder="รหัสหนังสือ">
                    </div>
                </div>
                 </div>
            </div>
        </div>
           <div class=" card-body mt-2 col-1 w-100">
                <div class=" card-header"></div>
                 <div class=" card-body">
                     <div class="form-group w-100 text-center">
                    <div class="form-group w-100">
                        <label>จำนวนที่พิมพ์</label>
                        <input runat="server" type="text" id="count_print" name="Age" class="w-100 ddl" placeholder="รหัสหนังสือ">
                    </div>
                </div>  
                     
                     <div class="form-group w-100 text-center">
                    <div class="form-group w-100">
                        <label>สถานที่พิมพ์</label>
                        <input runat="server" type="text" id="plate_print" name="Age" class="w-100 ddl" placeholder="รหัสหนังสือ">
                    </div>
                </div> 
                     <div class="form-group w-100 text-center d-inline-block">
                    <div class="form-group w-100">
                        <label>บริษัทที่พิมพ์</label>
                        <input runat="server" type="text" id="company_print" name="Age" class="w-100 ddl" placeholder="รหัสหนังสือ">
                    </div>
                </div>
                     <div class="form-group w-100 text-center d-inline-block">
                    <div class="form-group w-100">
                        <label>ปีที่พิมพ์</label>
                        <input runat="server" type="text" id="year_print" name="Age" class="w-100 ddl" placeholder="รหัสหนังสือ">
                    </div>
                </div> 
                     <div class="form-group w-100 text-center d-inline-block">
                    <div class="form-group w-100">
                        <label>รายละเอียดอื่นๆ </label>
                        <textarea runat="server" id="detail_book"  name="Text1" class="ddl" cols="40" rows="5"></textarea>
                    </div>
                </div>
                     <div class="form-group w-100 text-center d-inline-block">
                    <div class="form-group w-100">
                        <label>จำนวนหนังสือ </label>
                          <input runat="server" type="number" id="count_book" name="Age" class="w-100 ddl" placeholder="จำนวนหนังสือ">
                    </div>
                </div>
                 </div>
            </div>     
        <div class="text-center">
                        <a class="btn btn-success btn-lg " runat="server" id="searchCatalog" onserverclick="searchCatalog_ServerClick"  data-id="1" href="#"><i class="fa fa-filter "></i>บันทึก </a>
                        <a class="btn btn-secondary btn-lg " runat="server" id="clear" href="#"><i class="fa fa-eraser "></i>ยกเลิก</a>
                    </div>
    </div>
</asp:Content>
