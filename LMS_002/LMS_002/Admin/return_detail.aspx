<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master"  AutoEventWireup="true" CodeBehind="return_detail.aspx.cs" Inherits="LMS_002.Admin.return_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel runat="server" ID="return_main" Visible="true">
    <div class="row" style="margin-top:100px;">
        <h2>การคืน</h2>
        <div class="card">
            <label>ใส่เลข barcode</label>
            <input type="text" id="txt_barcode" required="required" runat="server"  />
            
            <input type="submit" id="search" value="ค้นหา" runat="server" onserverclick="search_ServerClick" />
            <label>สมาชิกที่ยืม</label>
                                    <asp:DropDownList runat="server" ID="ddl_account" CssClass="ddl"></asp:DropDownList>
        </div>
    </div>
    <div class="row">

            <div class=" card-header"> <label>ตารางหนังสือ</label></div>
            <div class="wrapper fadeInDown">
            <div class="text-center">
                <asp:GridView ID="GridView1" CssClass=" table"  runat="server" AutoGenerateColumns="False" DataKeyNames="int_id_catalog_book" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand">
                    <Columns>


                        <%--   <asp:CheckBoxField DataField="bool_current" HeaderText="เลือก"  />--%>
                        <asp:TemplateField>
                            <ItemTemplate>
       <%--                         <asp:CheckBox  ID="chkrows" AutoPostBack="true" runat="server" />--%>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:BoundField  DataField="int_id_catalog_book" HeaderText="ลำดับหนังสือ" InsertVisible="False" ReadOnly="True" SortExpression="int_id_catalog_book" />
                        <asp:BoundField DataField="st_name_book" HeaderText="ชื่อหนังสือ" SortExpression="st_name_book" />
                        <asp:ImageField DataAlternateTextField="img_path"  HeaderText="ภาพหนังสือ" DataImageUrlField="img_path">
                        </asp:ImageField>
                        <asp:BoundField DataField="st_ISBN_ISSN" HeaderText="ISBN_ISSN" SortExpression="st_ISBN_ISSN" />
                        <asp:BoundField DataField="st_detail_book" HeaderText="รายละเอียด หนังสือ" SortExpression="st_detail_book" />
                        <asp:BoundField DataField="dt_DATE_modify" HeaderText="วันที่มีหนังสือเล่มนี้" SortExpression="dt_DATE_modify" />
                        <asp:BoundField DataField="Type_book" HeaderText="ประเภทหนังสือ" SortExpression="Type_book" />
                        <asp:BoundField DataField="status_book" HeaderText="สถานะ" SortExpression="status_book" />
                        <%-- <asp:BoundField DataField="count_ISBN" HeaderText="จำนวนหนังสือที่เหลืออยู่" SortExpression="st_type_book_name" />--%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        </div>

    <div class="row">
        <div class="card">
             <div class="text-center">
        <a class="btn btn-success btn-lg " runat="server" onserverclick="sendto_lend_ServerClick" id="sendto_lend" visible="false" data-id="1" href="#"><i class="fa fa-filter "></i>ส่งไปหน้ายืม </a>
        <a class="btn btn-secondary btn-lg " runat="server" onserverclick="clear_list_ServerClick"  id="clear_list" href="#"><i class="fa fa-eraser "></i>ล้างที่เลือก</a>
    </div>
        </div>
    </div>
         </asp:Panel>
    <asp:Panel runat="server" ID="detail_return" Visible="false">
        <h2>สรุปรายชื่อหนังสือ ที่จะคืน</h2>
        <asp:Label runat="server">รายชื่อหนังสือ : </asp:Label>
        <asp:Label ID="lb_list_book" runat="server"></asp:Label>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
