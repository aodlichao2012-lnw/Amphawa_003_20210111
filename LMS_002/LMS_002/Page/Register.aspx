<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LMS_002.Page.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <style>

    </style>
    <script>

    </script>

    <div class="wrapper fadeInDown">
  <div id="formContent">
      <input type="text" runat="server" id="txt_login" class="fadeIn second" name="login" placeholder="ชื่อผู้ใช้">
      <input type="password" runat="server" id="txt_password" class="fadeIn third" name="login" placeholder="รหัสผ่าน">
      <input type="password" runat="server" id="txt_compare" class="fadeIn third" name="login" placeholder="ยืนยันรหัสผ่าน">
      <input type="text" runat="server" id="txt_Email" class="fadeIn third" name="login" placeholder="อีเมล์">
      <input type="submit" id="btn_save" runat="server" onserverclick="btn_save_ServerClick" class="fadeIn fourth" value="บันทึก">
     <div id="formFooter">
      <input type="submit" id="btn_back" runat="server" onserverclick="btn_back_ServerClick" class="fadeIn fourth" value="กลับหน้าเข้าระบบ">
        </div>
                 </div>
            </div>

</asp:Content>
