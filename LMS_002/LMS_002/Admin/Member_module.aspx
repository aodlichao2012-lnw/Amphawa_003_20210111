<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Member_module.aspx.cs" Inherits="LMS_002.Admin.Member_module" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">

    <div  style="margin-top:100px;" id="mainContent" ><div class="menuBox">
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
        <input type="submit" id="doSearch" runat="server" onserverclick="doSearch_ServerClick" value="สืบค้น"  class="s-btn btn btn-default">
	</div>
</div>
</div>
<table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;"><tbody><tr><td>    
    <a href="/senayan/admin/modules/membership/index.php" class="btn btn-default">รายการสมาชิก</a>
    <a href="/senayan/admin/modules/membership/index.php?action=detail" class="btn btn-default">เพิ่มสมาชิกใหม่</a>
    <a href="/senayan/admin/modules/membership/index.php?expire=true" class="btn btn-danger">แสดงรายการสมาชิกที่หมดอายุ</a>

 </td></tr></tbody></table>
<%--<table id="dataList" class="s-table table">
<tbody><tr class="dataListHeader" style="font-weight: bold; cursor: pointer;" row="0"><td>ลบ</td><td>แก้ไข</td><td><a href="/senayan/admin/modules/membership/index.php?datatablefld=%E0%B8%A3%E0%B8%AB%E0%B8%B1%E0%B8%AA%E0%B8%AA%E0%B8%A1%E0%B8%B2%E0%B8%8A%E0%B8%B4%E0%B8%81&amp;dir=DESC" title="เรียงรายการโดย รหัสสมาชิก เรียงจากบนลงล่าง">รหัสสมาชิก</a></td><td><a href="/senayan/admin/modules/membership/index.php?datatablefld=%E0%B8%8A%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%AA%E0%B8%A1%E0%B8%B2%E0%B8%8A%E0%B8%B4%E0%B8%81&amp;dir=DESC" title="เรียงรายการโดย ชื่อสมาชิก เรียงจากบนลงล่าง">ชื่อสมาชิก</a></td><td><a href="/senayan/admin/modules/membership/index.php?datatablefld=%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B9%80%E0%B8%A0%E0%B8%97%E0%B8%AA%E0%B8%A1%E0%B8%B2%E0%B8%8A%E0%B8%B4%E0%B8%81&amp;dir=DESC" title="เรียงรายการโดย ประเภทสมาชิก เรียงจากบนลงล่าง">ประเภทสมาชิก</a></td><td><a href="/senayan/admin/modules/membership/index.php?datatablefld=%E0%B8%AD%E0%B8%B5%E0%B9%80%E0%B8%A1%E0%B8%A5%E0%B9%8C&amp;dir=DESC" title="เรียงรายการโดย อีเมล์ เรียงจากบนลงล่าง">อีเมล์</a></td><td><a href="/senayan/admin/modules/membership/index.php?datatablefld=%E0%B8%9B%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%9B%E0%B8%A3%E0%B8%B8%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B8%A5%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B8%E0%B8%94&amp;dir=DESC" title="เรียงรายการโดย ปรับปรุงข้อมูลล่าสุด เรียงจากบนลงล่าง">ปรับปรุงข้อมูลล่าสุด</a></td></tr>
<tr class="alterCell2" row="1" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="art" id="cbRow1"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/membership/index.php?itemID=art&amp;detail=true&amp;" postdata="itemID=art&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top">art</td><td valign="top"><div class="media"> 
                    <a href="../images/persons/photo.png" class="openPopUp notAJAX" title="art" width="300" height="400">
                    <img class="mr-3 rounded" src="../images/persons/photo.png" alt="cover image" width="60"></a>
                    <div class="media-body">
                      <div class="title">art</div>
                      <div class="sub"></div>
                      <div class="sub"></div>
                    </div>
                  </div></td><td valign="top">สมาชิกทั่วไป</td><td valign="top"></td><td valign="top">2022-01-10</td></tr>
<tr class="alterCell" row="2" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="58123406033" id="cbRow2"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/membership/index.php?itemID=58123406033&amp;detail=true&amp;" postdata="itemID=58123406033&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top">58123406033</td><td valign="top"><div class="media"> 
                    <a href="../images/persons/member_58123406033.jpg" class="openPopUp notAJAX" title="Peeranut Thongmee" width="300" height="400">
                    <img class="mr-3 rounded" src="../images/persons/member_58123406033.jpg" alt="cover image" width="60"></a>
                    <div class="media-body">
                      <div class="title">Peeranut Thongmee</div>
                      <div class="sub"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;0632258505</div>
                      <div class="sub"></div>
                    </div>
                  </div></td><td valign="top">นักศึกษา</td><td valign="top">peeranut@pen1.biz</td><td valign="top">2022-01-10</td></tr>
<tr class="alterCell2" row="3" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="pen1" id="cbRow3"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/membership/index.php?itemID=pen1&amp;detail=true&amp;" postdata="itemID=pen1&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top">pen1</td><td valign="top"><div class="media"> 
                    <a href="../images/persons/photo.png" class="openPopUp notAJAX" title="pen1" width="300" height="400">
                    <img class="mr-3 rounded" src="../images/persons/photo.png" alt="cover image" width="60"></a>
                    <div class="media-body">
                      <div class="title">pen1</div>
                      <div class="sub"></div>
                      <div class="sub"></div>
                    </div>
                  </div></td><td valign="top">Standard</td><td valign="top"></td><td valign="top">2021-12-14</td></tr>
<tr class="alterCell" row="4" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="non" id="cbRow4"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/membership/index.php?itemID=non&amp;detail=true&amp;" postdata="itemID=non&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top">non</td><td valign="top"><div class="media"> 
                    <a href="../images/persons/photo.png" class="openPopUp notAJAX" title="Ratchanon" width="300" height="400">
                    <img class="mr-3 rounded" src="../images/persons/photo.png" alt="cover image" width="60"></a>
                    <div class="media-body">
                      <div class="title">Ratchanon</div>
                      <div class="sub"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;0902625136</div>
                      <div class="sub"></div>
                    </div>
                  </div></td><td valign="top">Standard</td><td valign="top"></td><td valign="top">2021-12-15</td></tr>
</tbody></table>--%>

     <asp:GridView ID="gdv_Role_admin" CssClass=" s-table table" runat="server" OnRowCommand="gdv_Role_admin_RowCommand" OnRowEditing="gdv_Role_admin_RowEditing" AutoGenerateColumns="False" OnRowDeleting="gdv_Role_admin_RowDeleting"  DataKeyNames="int_id" >
               
                <Columns >
                 <asp:TemplateField>
            <ItemTemplate >
              <%--  <div>  <button id="btn_edit" CssClass="btn btn-success btn-lg " onserverclick="btn_edit_Click" runat="server" value="แก้ไข" >แก้ไข</button>
                <button id="btn_delete" CssClass="btn btn-danger btn-lg " onserverclick="btn_delete_Click" runat="server" value="ลบ" >ลบ</button></div>--%>
                <asp:ImageButton  runat="server" ID="btn_edit" CommandName="edit"  ImageAlign="Middle" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' ImageUrl="~/Image/icons/24pixel/edit_24.png"/>
                <asp:ImageButton runat="server" ID="btn_delete" CommandName="delete"   ImageAlign="Middle" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' ImageUrl="~/Image/icons/24pixel/delete_24.png" />
              
            </ItemTemplate>
        </asp:TemplateField >
                    
                    <asp:BoundField ItemStyle-CssClass="w-25 h-50" DataField="int_id" HeaderText="ลำดับ"   InsertVisible="False" ReadOnly="True" SortExpression="int_id" />
                    <asp:BoundField ItemStyle-CssClass="w-25 h-50" DataField="st_user" HeaderText="ชื่อผู้ใช้งาน" SortExpression="st_user" />
                    <asp:BoundField ItemStyle-CssClass="w-25 h-50" DataField="st_email" HeaderText="อีเมล์ผู้ใช้งาน" SortExpression="st_email" />
                    <asp:BoundField ItemStyle-CssClass="w-25 h-50" DataField="st_type_cus" HeaderText="ประเภทผู้ใช้งาน" SortExpression="st_type_cus" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Amphawan_LMS_db_2ConnectionString %>" SelectCommand="SELECT [int_id], [st_user], [st_email], [st_type_cus] FROM [MD_Account]"></asp:SqlDataSource>
<table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;"><tbody><tr><td>
    <table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;"><tbody><tr><td>    
    <a href="/senayan/admin/modules/membership/index.php" class="btn btn-default">รายการสมาชิก</a>
    <a href="/senayan/admin/modules/membership/index.php?action=detail" class="btn btn-default">เพิ่มสมาชิกใหม่</a>
    <a href="/senayan/admin/modules/membership/index.php?expire=true" class="btn btn-danger">แสดงรายการสมาชิกที่หมดอายุ</a>

 </td></tr></tbody></table>
 </td></tr></tbody></table>
<input type="hidden" name="itemAction" value="true"><input type="hidden" name="lastQueryStr" value="">
<iframe name="submitExec" style="display: none; visibility: hidden; width: 100%; height: 0;"></iframe>
</div>
</asp:Content>
