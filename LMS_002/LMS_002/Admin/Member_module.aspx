<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Member_module.aspx.cs" Inherits="LMS_002.Admin.Member_module" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">

    <div  style="margin-top:80px;" id="mainContent" ><div class="menuBox">
<div class="menuBoxInner memberIcon">
	<div class="per_title">
    	<h2>สมาชิกห้องสมุด</h2>
    </div>
    <div class="sub_section">
	<div class="btn-group">
    <a href="/senayan/admin/modules/membership/index.php" class="btn btn-default">รายการสมาชิก</a>
    <a href="/senayan/admin/modules/membership/index.php?action=detail" class="btn btn-default">เพิ่มสมาชิกใหม่</a>
    <a href="/senayan/admin/modules/membership/index.php?expire=true" class="btn btn-danger">แสดงรายการสมาชิกที่หมดอายุ</a>
	</div>
    <form name="search" action="/senayan/admin/modules/membership/index.php" id="search" method="get" class="form-inline">สืบค้น	    <input type="text" name="keywords" class="form-control col-md-3">	    <input type="submit" id="doSearch" value="สืบค้น" class="s-btn btn btn-default">
	</form>
	</div>
</div>
</div>
<form name="memberList" id="memberList" class="simbio_form_maker" method="post" action="/senayan/admin/modules/membership/index.php" target="submitExec"><input type="hidden" name="csrf_token" value="e923ce92549e83873b4bd9f1328446262ce20ab64e3c7b7df9f7cb43d3032ae6"><input type="hidden" name="form_name" value="memberList"><table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;"><tbody><tr><td><input type="button" onclick="chboxFormSubmit('memberList', 'ยืนยันการลบข้อมูล')" value="ลบข้อมูล" class="s-btn btn btn-danger"> <input type="button" value="เลือกรายการทั้งหมด" class="check-all button btn btn-default"> <input type="button" value="ยกเลิกรายการทั้งหมด" class="uncheck-all button btn btn-default"> </td></tr></tbody></table>
<table id="dataList" class="s-table table">
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
</tbody></table>
<table cellspacing="0" cellpadding="5" class="datagrid-action-bar" style="width: 100%;"><tbody><tr><td><input type="button" onclick="chboxFormSubmit('memberList', 'ยืนยันการลบข้อมูล')" value="ลบข้อมูล" class="s-btn btn btn-danger"> <input type="button" value="เลือกรายการทั้งหมด" class="check-all button btn btn-default"> <input type="button" value="ยกเลิกรายการทั้งหมด" class="uncheck-all button btn btn-default"> </td></tr></tbody></table>
<input type="hidden" name="itemAction" value="true"><input type="hidden" name="lastQueryStr" value="">
</form>
<iframe name="submitExec" style="display: none; visibility: hidden; width: 100%; height: 0;"></iframe>
</div>
</asp:Content>
