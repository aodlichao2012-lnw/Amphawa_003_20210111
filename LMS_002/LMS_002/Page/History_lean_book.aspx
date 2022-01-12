<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="History_lean_book.aspx.cs" Inherits="LMS_002.Page.History_lean_book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
            $(document).ready(function () {
        $( function() {
        $( ".datepicker" ).datepicker();
        format="yy/dd/mm"
    } );

// Bootstrap datepicker
        $('.input-daterange input').each(function() {
        $(this).datepicker('clearDates');
        });

        // Extend dataTables search
        $.fn.dataTable.ext.search.push(
        function(settings, data, dataIndex) {
            var min = $('#min-date').val();
            var max = $('#max-date').val();
            var createdAt = data[7] || 7  // Our date column in the table

            if (
            (min == "" || max == "" ) ||
                (
                    moment(createdAt).isSameOrAfter(min) 
                &&  moment(createdAt).isSameOrBefore(max)
                 
                )  
            ) 
            {
            return true;
            }
            return false;
        }
        );


        $('#ex_filter').hide();
        });
    </script>
       <h2>ประวัติการยืม - คืนหนังสือ</h2>
       <div class="wrapper fadeInDown">
    <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-2 pl-1">
                        <div class="form-group">
                            <label>ประเภท</label>
                            <select name="JobID" runat="server" id="Type" class="form-control">
                                    <option value="books">หนังสือ</option>
                                    <option value="ebook">E-book</option>
                                    <option value="digital_cllection">หนังสือเสียง</option>
                                    <option value="video">วิดีโอ</option>

                            </select>
                            </div>
                    </div>
                    <div class="col-md-2 pl-1">
                        <div class="form-group">
                            <label>รหัสหนังสือ</label>
                            <div> <input runat="server" type="text"  id="txt_iss_num" name="Age" class="form-control w-100" placeholder="รหัสหนังสือ"></div>
                        </div>
                    </div> 
                    <div class="col-md-2 pl-1">
                        <div class="form-group">
                            <label>ชื่อหนังสือ</label>
                            <div> <input runat="server" type="text" id="txt_name_book" name="Age" class="form-control w-100" placeholder="ชื่อหนังสือ"></div>
                        </div>
                    </div>
                    <div class="col-md-2 pl-1">
                        <div class="form-group">
                            <label>จากวันที่</label>
                            <div> <input type="text" id="min-date" class="form-control date-range-filter datepicker w-100" placeholder="From:"></div>
                        </div>
                    </div>
                    <div class="col-md-2 pl-1">
                        <div class="form-group">
                            <label>ถึงวันที่</label>
                            <div> <input type="text" id="max-date" class="form-control date-range-filter datepicker w-100" placeholder="To:"></div>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                <a class="btn btn-success btn-lg " runat="server" onserverclick="searchCatalog_ServerClick" id="searchCatalog" data-id="1" href="#"><i class="fa fa-filter "></i> ค้นหา </a>
                <a class="btn btn-secondary btn-lg " runat="server" onserverclick="clear_ServerClick" id="clear" href="#"><i class="fa fa-eraser "></i> ล้างค่า</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
