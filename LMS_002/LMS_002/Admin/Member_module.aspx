<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Member_module.aspx.cs" Inherits="LMS_002.Admin.Member_module" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-top: 100px;" id="mainContent">
        <div class="menuBox">
            <div class="menuBoxInner memberIcon">
                <div class="per_title">
                    <h2>สมาชิกห้องสมุด</h2>
                </div>
                <div class="sub_section">
                    <div class="btn-group">
                    </div>
                    <select name="field" id="Types" runat="server" class="form-control col-md-2">
                        <option value="st_user">ชื่อผู้ใช้งาน</option>
                        <option value="st_type_cus">สิทธิ</option>
                        <%--     <option value="st_type_book_name">รหัสสมาชิก</option>--%>
                    </select>
                    <input type="text" runat="server" name="keywords" id="keywords" class="form-control col-md-3">
                    <input type="submit" id="doSearch" runat="server" onserverclick="doSearch_ServerClick" value="สืบค้น" class="s-btn btn btn-default">
                </div>
            </div>
        </div>
        <table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;">
            <tbody>
                <tr>
                    <td>
                        <a href="/senayan/admin/modules/membership/index.php" class="btn btn-default">รายการสมาชิก</a>
                        <a href="/senayan/admin/modules/membership/index.php?action=detail" class="btn btn-default">เพิ่มสมาชิกใหม่</a>
                        <a href="/senayan/admin/modules/membership/index.php?expire=true" class="btn btn-danger">แสดงรายการสมาชิกที่หมดอายุ</a>

                    </td>
                </tr>
            </tbody>
        </table>

        <asp:GridView ID="gdv_Role_admin" CssClass=" s-table table" runat="server" OnRowCommand="gdv_Role_admin_RowCommand" OnRowEditing="gdv_Role_admin_RowEditing" AutoGenerateColumns="False" OnRowDeleting="gdv_Role_admin_RowDeleting" DataKeyNames="int_id">

            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="btn_edit" CommandName="edit" ImageAlign="Middle" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' ImageUrl="~/Image/icons/24pixel/edit_24.png" />
                        <asp:ImageButton runat="server" ID="btn_delete" CommandName="delete" ImageAlign="Middle" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' ImageUrl="~/Image/icons/24pixel/delete_24.png" />

                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField ItemStyle-CssClass="w-25 h-50" DataField="int_id" HeaderText="ลำดับ" InsertVisible="False" ReadOnly="True" SortExpression="int_id" />
                <asp:BoundField ItemStyle-CssClass="w-25 h-50" DataField="st_user" HeaderText="ชื่อผู้ใช้งาน" SortExpression="st_user" />
                <asp:BoundField ItemStyle-CssClass="w-25 h-50" DataField="st_email" HeaderText="อีเมล์ผู้ใช้งาน" SortExpression="st_email" />
                <asp:BoundField ItemStyle-CssClass="w-25 h-50" DataField="st_type_cus" HeaderText="ประเภทผู้ใช้งาน" SortExpression="st_type_cus" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Amphawan_LMS_db_2ConnectionString %>" SelectCommand="SELECT [int_id], [st_user], [st_email], [st_type_cus] FROM [MD_Account]"></asp:SqlDataSource>
        <table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;">
            <tbody>
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td>
                                        <a href="/senayan/admin/modules/membership/index.php" class="btn btn-default">รายการสมาชิก</a>
                                        <a href="/senayan/admin/modules/membership/index.php?action=detail" class="btn btn-default">เพิ่มสมาชิกใหม่</a>
                                        <a href="/senayan/admin/modules/membership/index.php?expire=true" class="btn btn-danger">แสดงรายการสมาชิกที่หมดอายุ</a>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <input type="hidden" name="itemAction" value="true"><input type="hidden" name="lastQueryStr" value="">
        <iframe name="submitExec" style="display: none; visibility: hidden; width: 100%; height: 0;"></iframe>
    </div>
</asp:Content>
