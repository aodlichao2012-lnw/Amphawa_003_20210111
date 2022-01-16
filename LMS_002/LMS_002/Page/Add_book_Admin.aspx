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
             <div class=" card mt-2 col-1 w-100">
                <div class=" card-header">กรอกข้อมูล</div>
                 <div class=" card-body">
                     
                 </div>
            </div>
        </div>
        <div class="text-center">
                        <a class="btn btn-success btn-lg " runat="server" id="searchCatalog" onserverclick="searchCatalog_ServerClick"  data-id="1" href="#"><i class="fa fa-filter "></i>บันทึก </a>
                        <a class="btn btn-secondary btn-lg " runat="server" id="clear" href="#"><i class="fa fa-eraser "></i>ยกเลิก</a>
                    </div>
    </div>
</asp:Content>
