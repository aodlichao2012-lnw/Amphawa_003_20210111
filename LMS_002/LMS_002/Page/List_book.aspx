<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List_book.aspx.cs" Inherits="LMS_002.Page.List_book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <style>

    </style>
    <script>

    </script>

        <div class="wrapper fadeInDown">
    <div class="card text-center">
            <div class="card-body">
                <div class="row">
                    <div class="text-center">
                        <div class="form-group w-100" style="display:inline-block;">
                            <label>ประเภท</label>
                            <select name="JobID" runat="server" id="Type" class=" w-100 ddl">
                                    <option value="books">หนังสือ</option>
                                    <option value="ebook">E-book</option>
                                    <option value="digital_cllection">หนังสือเสียง</option>
                                    <option value="video">วิดีโอ</option>

                            </select>
                            </div>
                    </div>
                    <div class="col-md-2 pl-1 text-center" style="display:inline-block;">
                        <div class="form-group w-100">
                            <label>รหัสหนังสือ</label>
                            <input runat="server" type="text" id="txt_iss_num" name="Age" class="w-100" placeholder="รหัสหนังสือ">
                        </div>
                    </div> 
                    <div class="col-md-2 pl-1 text-center" style="display:inline-block;">
                        <div class="form-group w-100">
                            <label>ชื่อหนังสือ</label>
                            <input runat="server" type="text" id="txt_name_book" name="Age" class="w-100" placeholder="ชื่อหนังสือ">
                        </div>
                    </div>
           <%--         <div class="col-md-2 pl-1">
                        <div class="form-group">
                            <label>จากวันที่</label>
                            <input type="text" id="min-date" class="form-control date-range-filter datepicker" placeholder="From:">
                        </div>
                    </div>
                    <div class="col-md-2 pl-1">
                        <div class="form-group">
                            <label>ถึงวันที่</label>
                            <input type="text" id="max-date" class="form-control date-range-filter datepicker" placeholder="To:">
                        </div>
                    </div>--%>
                </div>
                <div class="text-center">
                <a class="btn btn-success btn-lg " runat="server" onserverclick="searchCatalog_ServerClick" id="searchCatalog" data-id="1" href="#"><i class="fa fa-filter "></i> ค้นหา </a>
                <a class="btn btn-secondary btn-lg " runat="server" onserverclick="clear_ServerClick" id="clear" href="#"><i class="fa fa-eraser "></i> ล้างค่า</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
