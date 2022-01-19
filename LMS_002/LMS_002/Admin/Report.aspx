<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="LMS_002.Admin.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">

    <div style="margin-top:80px;" id="mainContent" ><div class="menuBox">
    <div class="menuBoxInner statisticIcon">
        <div class="per_title">
        <h2>สรุปสถิติทรัพยากรสารสนเทศ</h2>
    </div>
    <div class="infoBox">
            <input type="hidden" name="print" value="true">
            <input type="submit" value="รายงานการดาวน์โหลดเอกสารดิจิทัล" class="s-btn btn btn-default">
    </div>
    <iframe name="submitPrint" style="display: none; visibility: hidden; width: 0; height: 0;"></iframe>
    </div>
</div>
<table class="s-table table table-bordered mb-0">
<tbody><tr class="dataListHeader"><td colspan="2">สรุปรายการสถิติการใช้ทรัพยากรสารสนเทศ</td></tr>
<tr><td class="alterCell" valign="top" style="width: 300px;">ชื่อเรื่องทั้งหมด</td><td class="alterCell" valign="top" style="width: auto;">6  (including titles that still don't have items yet)</td></tr>
<tr><td class="alterCell" valign="top" style="width: 300px;">Total Titles with items</td><td class="alterCell" valign="top" style="width: auto;">6 (only titles that have items)</td></tr>
<tr><td class="alterCell" valign="top" style="width: 300px;">รายการตัวเล่มทั้งหมด</td><td class="alterCell" valign="top" style="width: auto;">4</td></tr>
<tr><td class="alterCell" valign="top" style="width: 300px;">รายการยืมตัวเล่มทั้งหมด</td><td class="alterCell" valign="top" style="width: auto;">2</td></tr>
<tr><td class="alterCell" valign="top" style="width: 300px;">รายการชื่อเรื่องแบ่งตามประเภทวัสดุ/มีเดีย</td><td class="alterCell" valign="top" style="width: auto;"><div class="chartLink"><a class="btn btn-success notAJAX openPopUp" href="/senayan/admin/modules/reporting/charts_report.php?chart=total_title_gmd" width="700" height="470" title="รายการชื่อเรื่องแบ่งตามประเภทวัสดุ/มีเดีย">Show in chart/plot</a></div>Text (<strong>5</strong>), Electronic Resource (<strong>1</strong>),</td></tr>
<tr><td class="alterCell" valign="top" style="width: 300px;">รายการตัวเล่มทั้งหมดแบ่งตามประเภททรัพยากรสารสนเทศ</td><td class="alterCell" valign="top" style="width: auto;"><div class="chartLink"><a class="btn btn-success notAJAX openPopUp" href="/senayan/admin/modules/reporting/charts_report.php?chart=total_title_colltype" width="700" height="470" title="รายการตัวเล่มทั้งหมดแบ่งตามประเภททรัพยากรสารสนเทศ">Show in chart/plot</a></div>หนังสืออ้างอิง (<strong>6</strong>),</td></tr>
<tr><td class="alterCell" valign="top" style="width: 300px;">ชื่อเรื่อง 10 ลำดับแรกที่ถูกยืมมากที่สุด</td><td class="alterCell" valign="top" style="width: auto;"><ol><li>กลยุทธ์น่านน้ำสีคราม BlueOcean</li><li>ยุทธการจัดการหนี้ให้หมดไว ๆ</li><li>ตำราเรียนอักษรไทยโบราณ</li><li>The New International Webster's Dictionary of the English Language Cpmputer ฉ4</li><li>The New International Webster's Dictionary of the English Language Grammar ฉ3</li><li>บริษัท เป็นหนึ่ง โฮลดิ้ง จำกัด</li></ol></td></tr>
</tbody></table>
</div>
</asp:Content>
