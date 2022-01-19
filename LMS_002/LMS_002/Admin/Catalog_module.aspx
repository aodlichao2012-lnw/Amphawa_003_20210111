<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Catalog_module.aspx.cs" Inherits="LMS_002.Admin.Catalog_module" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="mainContent" style="margin-top:80px;" >    
        <div class="menuBox">
        <div class="menuBoxInner biblioIcon">
            <div class="per_title">
                <h2>บรรณานุกรม</h2>
            </div>
            <div class="sub_section">
                <div class="btn-group">
                  
                </div><input type="text" name="keywords" id="keywords" class="form-control col-md-3">
                    <select name="field" class="form-control col-md-2">
                        <option value="0">ทั้งหมด</option>
                        <option value="title">ชื่อเรื่อง/ชื่อวารสาร </option>
                        <option value="subject">หัวเรื่อง</option>
                        <option value="author">ผู้แต่ง</option>
                        <option value="isbn">ISBN/ISSN</option>
                        <option value="publisher">ผู้จัดทำ</option>
                    </select>
                    <input type="submit" id="doSearch" value="สืบค้น" class="s-btn btn btn-default">
                     <a href="/senayan/admin/modules/bibliography/index.php" class="btn btn-info">รายการบรรณานุกรม</a>
                    <a runat="server" id="add_book" href="~/Page/Add_book_Admin.aspxl" class="btn btn-info">เพิ่มรายการบรรณานุกรม</a>
                
            </div>
        </div>
    </div>
    <input type="hidden" name="csrf_token" value="95b84d303fe86c6484c983e4cb39ca94dd1a840c6c1d2d74c281f0c38f85e2d6"><input type="hidden" name="form_name" value="datagrid"><table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;"><tbody><tr><td><input type="button" onclick="chboxFormSubmit('datagrid', 'ยืนยันการลบข้อมูล')" value="ลบข้อมูล" class="s-btn btn btn-danger"> <input type="button" value="เลือกรายการทั้งหมด" class="check-all button btn btn-default"> <input type="button" value="ยกเลิกรายการทั้งหมด" class="uncheck-all button btn btn-default"> </td></tr></tbody></table>
<%--<table id="dataList" class="s-table table">
<tbody><tr class="dataListHeader" style="font-weight: bold; cursor: pointer;" row="0"><td>ลบ</td><td>แก้ไข</td><td><a href="/senayan/admin/modules/bibliography/index.php?datatablefld=%E0%B8%8A%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%A3%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%87&amp;dir=DESC" title="เรียงรายการโดย ชื่อเรื่อง เรียงจากบนลงล่าง">ชื่อเรื่อง</a></td><td><a href="/senayan/admin/modules/bibliography/index.php?datatablefld=ISBN%2FISSN&amp;dir=DESC" title="เรียงรายการโดย ISBN/ISSN เรียงจากบนลงล่าง">ISBN/ISSN</a></td><td><a href="/senayan/admin/modules/bibliography/index.php?datatablefld=%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1&amp;dir=DESC" title="เรียงรายการโดย เล่ม เรียงจากบนลงล่าง">เล่ม</a></td><td><a href="/senayan/admin/modules/bibliography/index.php?datatablefld=%E0%B8%9B%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%9B%E0%B8%A3%E0%B8%B8%E0%B8%87%E0%B8%A5%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B8%E0%B8%94&amp;dir=DESC" title="เรียงรายการโดย ปรับปรุงล่าสุด เรียงจากบนลงล่าง">ปรับปรุงล่าสุด</a></td></tr>
<tr class="alterCell2" row="1" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="3" id="cbRow1"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/bibliography/index.php?itemID=3&amp;detail=true&amp;" postdata="itemID=3&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top"><div class="media">
                    <img class="mr-3 rounded" src="../lib/minigalnano/createthumb.php?filename=images/default/image.png&amp;width=50&amp;height=65" alt="cover image">
                    <div class="media-body">
                      <div class="title">หลักการออกแบบเว็บไซต์ทางการศึกษา:ทฤษฎีสู้การปฏิบัติ</div><div class="authors"></div>
                    </div>
                  </div></td><td valign="top">31379015194716</td><td valign="top">1</td><td valign="top">2022-01-10 16:11:03</td></tr>
<tr class="alterCell" row="2" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="6" id="cbRow2"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/bibliography/index.php?itemID=6&amp;detail=true&amp;" postdata="itemID=6&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top"><div class="media">
                    <img class="mr-3 rounded" src="../lib/minigalnano/createthumb.php?filename=images/docs/Picture1.png.png&amp;width=50&amp;height=65" alt="cover image">
                    <div class="media-body">
                      <div class="title">บริษัท เป็นหนึ่ง โฮลดิ้ง จำกัด</div><div class="authors">Pen1</div>
                    </div>
                  </div></td><td valign="top">1234567899876</td><td valign="top">1</td><td valign="top">2022-01-10 13:39:42</td></tr>
<tr class="alterCell2" row="3" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="4" id="cbRow3"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/bibliography/index.php?itemID=4&amp;detail=true&amp;" postdata="itemID=4&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top"><div class="media">
                    <img class="mr-3 rounded" src="../lib/minigalnano/createthumb.php?filename=images/default/image.png&amp;width=50&amp;height=65" alt="cover image">
                    <div class="media-body">
                      <div class="title">The New International Webster's Dictionary of the English Language Grammar ฉ3</div><div class="authors"></div>
                    </div>
                  </div></td><td valign="top">31379015001549</td><td valign="top">1</td><td valign="top">2021-12-16 09:41:27</td></tr>
<tr class="alterCell" row="4" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="5" id="cbRow4"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/bibliography/index.php?itemID=5&amp;detail=true&amp;" postdata="itemID=5&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top"><div class="media">
                    <img class="mr-3 rounded" src="../lib/minigalnano/createthumb.php?filename=images/default/image.png&amp;width=50&amp;height=65" alt="cover image">
                    <div class="media-body">
                      <div class="title">The New International Webster's Dictionary of the English Language Computer ฉ4</div><div class="authors"></div>
                    </div>
                  </div></td><td valign="top">31379010679778</td><td valign="top">1</td><td valign="top">2021-12-16 09:40:53</td></tr>
<tr class="alterCell2" row="5" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="1" id="cbRow5"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/bibliography/index.php?itemID=1&amp;detail=true&amp;" postdata="itemID=1&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top"><div class="media">
                    <img class="mr-3 rounded" src="../lib/minigalnano/createthumb.php?filename=images/default/image.png&amp;width=50&amp;height=65" alt="cover image">
                    <div class="media-body">
                      <div class="title">The New International Webster's Dictionary of the English Language Thesaurus ฉ1</div><div class="authors"></div>
                    </div>
                  </div></td><td valign="top">31379013988309</td><td valign="top">1</td><td valign="top">2021-12-16 09:31:23</td></tr>
<tr class="alterCell" row="6" style="cursor: pointer;"><td align="center" valign="top" style="width: 5%;"><input class="selected-row" type="checkbox" name="itemID[]" value="2" id="cbRow6"></td><td align="center" valign="top" style="width: 5%;"><a class="editLink" href="/senayan/admin/modules/bibliography/index.php?itemID=2&amp;detail=true&amp;" postdata="itemID=2&amp;detail=true" title="Edit">&nbsp;</a></td><td valign="top"><div class="media">
                    <img class="mr-3 rounded" src="../lib/minigalnano/createthumb.php?filename=images/default/image.png&amp;width=50&amp;height=65" alt="cover image">
                    <div class="media-body">
                      <div class="title">The New International Webster's Dictionary of the English Language Dictionary ฉ2</div><div class="authors"></div>
                    </div>
                  </div></td><td valign="top">31379016171341</td><td valign="top">1</td><td valign="top">2021-12-16 09:31:13</td></tr>
</tbody></table>--%>

       <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" DataKeyNames="st_ISBN_ISSN" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox  ID="chkrows" AutoPostBack="true" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="st_name_book"  HeaderText="ชื่อหนังสือ" SortExpression="st_name_book" />
                      
          
                          <asp:ImageField  HeaderText="ภาพหนังสือ" ItemStyle-Width="20px" ItemStyle-Height="20px"  ControlStyle-Width="100" ControlStyle-Height = "100"  DataImageUrlField="img_path">
                        </asp:ImageField>
                        <asp:BoundField DataField="st_ISBN_ISSN" HeaderText="ISBN_ISSN" SortExpression="st_ISBN_ISSN" />
                        <asp:BoundField DataField="st_detail_book" HeaderText="รายละเอียด หนังสือ" SortExpression="st_detail_book" />
                        <asp:BoundField DataField="dt_DATE_modify" HeaderText="วันที่มีหนังสือเล่มนี้" SortExpression="dt_DATE_modify" />
                        <asp:BoundField DataField="Type_book" HeaderText="ประเภทหนังสือ" SortExpression="st_type_book_name" />
                        <asp:BoundField DataField="st_cheeckin_out" HeaderText="สถานะ" SortExpression="status_book" />
                        <asp:BoundField DataField="count_" HeaderText="จำนวน" SortExpression="status_book" />

                    </Columns>
                </asp:GridView>
<table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;"><tbody><tr><td><input type="button" onclick="chboxFormSubmit('datagrid', 'ยืนยันการลบข้อมูล')" value="ลบข้อมูล" class="s-btn btn btn-danger"> <input type="button" value="เลือกรายการทั้งหมด" class="check-all button btn btn-default"> <input type="button" value="ยกเลิกรายการทั้งหมด" class="uncheck-all button btn btn-default"> </td></tr></tbody></table>
<input type="hidden" name="itemAction" value="true"><input type="hidden" name="lastQueryStr" value="">

<iframe name="submitExec" style="display: none; visibility: hidden; width: 100%; height: 0;"></iframe>
</div>
        
</asp:Content>
