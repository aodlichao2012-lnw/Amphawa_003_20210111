<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Role_Admin.aspx.cs" Inherits="LMS_002.Page.Role_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .auto-style5 {
            flex: 1 0 0%;
            text-align: center;
        }
    </style>
    <script>

</script>

    <div class="wrapper fadeInDown">
        <div id="formContent">


            <asp:GridView ID="gdv_Role_admin" runat="server" Visible="false" OnRowCommand="gdv_Role_admin_RowCommand">
                <Columns>
                    <asp:CheckBoxField HeaderText="เลือก"  />
                   
                </Columns>
            </asp:GridView>
            <asp:Panel ID="pn_edit_role" runat="server" Visible="true">
                    <div class="wrapper fadeInDown">
                             <input type="text" runat="server" id="txt_login" class="fadeIn second" name="login" placeholder="ชื่อผู้ใช้">
                              <div class="form-group">
                        <label class="fadeIn second col-form-label">สิทธิ</label>
                        <asp:DropDownList ID="ddl_role" CssClass="fadeIn second ddl" runat="server">
                            <asp:ListItem Value="1">เจ้าหน้าที่</asp:ListItem>
                            <asp:ListItem Value="2">ผู้ดูแลระบบ</asp:ListItem>
                            <asp:ListItem Value="3">บุคคลภายนอก</asp:ListItem>
                        </asp:DropDownList>
                                  </div>
      <input type="password" runat="server" id="txt_password" class="fadeIn third" name="login" placeholder="รหัสผ่าน">
      <input type="password" runat="server" id="txt_compare" class="fadeIn third" name="login" placeholder="ยืนยันรหัสผ่าน">
      <input type="text" runat="server" id="txt_Email" class="fadeIn third" name="login" placeholder="อีเมล์">
      <input type="submit" id="btn_save" runat="server" onserverclick="btn_save_ServerClick" class="fadeIn fourth" value="เปลี่ยนแปลง"/>
      <input type="submit" id="btn_back" runat="server" onserverclick="btn_back_ServerClick" class="fadeIn fourth" value="ย้อนกลับ"/>
                        </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
