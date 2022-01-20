<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="LMS_002.Admin.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
    <div style="margin-top:100px;" id="mainContent"></div>
    <div class="menuBox adminHome">
    <div class="menuBoxInner">
        <div class="per_title">
            <h2>Library Administration</h2>
        </div>
    </div>
</div>
<div class="contentDesc" onload="GetDetails();">
    <div class="container-fluid">

        <div id="alert-new-version" class="alert alert-info border-0 mt-3 hidden">
            <strong>News!</strong> New version of SLiMS (<code id="new_version"></code>) available to <a class="notAJAX" target="_blank" href="https://github.com/slims/slims9_bulian/releases/latest">download</a>.
        </div>

        <div class="alert alert-warning border-0 mt-3"><div>There are currently <strong>2</strong> library members having overdue. Please check at <b>Circulation</b> module at <b>Overdues</b> section for more detail</div><div>Installer folder is still exist inside your server. Please remove it or rename to another name for security reason.</div><div><strong><i>You are logged in as Super User. With great power comes great responsibility.</i></strong></div></div>        <div class="row">
            <div class="col-xs-6 col-md-3 col-lg-3">
                <div class="card border-0">
                    <div class="card-body">
                        <div class="s-widget-icon"><i class="fa fa-bookmark"></i></div>
                        <div class="s-widget-value biblio_total_all">...</div>
                        <div class="s-widget-title">Total of Collections</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3">
                <div class="card border-0">
                    <div class="card-body">
                        <div class="s-widget-icon"><i class="fa fa-barcode"></i></div>
                        <div class="s-widget-value item_total_all">...</div>
                        <div class="s-widget-title">Total of Items</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3">
                <div class="card border-0">
                    <div class="card-body">
                        <div class="s-widget-icon"><i class="fa fa-archive"></i></div>
                        <div class="s-widget-value item_total_lent">...</div>
                        <div class="s-widget-title">Lent</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3">
                <div class="card border-0">
                    <div class="card-body">
                        <div class="s-widget-icon"><i class="fa fa-check"></i></div>
                        <div class="s-widget-value item_total_available">...</div>
                        <div class="s-widget-title">พร้อมให้บริการ</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col col-md-8 s-dashboard">
                <div class="card border-0">
                    <div class="card-body">
                        <h5 class="card-title">Latest Transactions</h5>
                        <canvas id="line-chartjs" height="294"></canvas>
                        <div class="s-dashboard-legend">
                            <i class="fa fa-square" style="color:#F4CC17;"></i> ยืม                            <i class="fa fa-square" style="color:#459CBD;"></i> คืน                            <i class="fa fa-square" style="color:#5D45BD;"></i> ขยายเวลา                        </div>
                    </div>
                </div>
            </div>
            <div class="col col-md-4 s-dashboard">
                <div class="card border-0">
                    <div class="card-body">
                        <h5 class="card-title">Summary</h5>
                        <div class="s-chart">
                            <canvas id="radar-chartjs" width="175" height="175"></canvas>
                        </div>
                        <table class="table">
                            <tbody><tr>
                                <td class="text-left"><i class="fa fa-square" style="color:#f2f2f2;"></i>&nbsp;&nbsp;Total                                </td>
                                <td class="text-right loan_total">0</td>
                            </tr>
                            <tr>
                                <td class="text-left"><i class="fa fa-square" style="color:#337AB7;"></i>&nbsp;&nbsp;New                                </td>
                                <td class="text-right loan_new">0</td>
                            </tr>
                            <tr>
                                <td class="text-left"><i class="fa fa-square" style="color:#06B1CD;"></i>&nbsp;&nbsp;คืน                                </td>
                                <td class="text-right loan_return">0</td>
                            </tr>
                            <tr>
                                <td class="text-left"><i class="fa fa-square" style="color:#4AC49B;"></i>&nbsp;&nbsp;Extends                                </td>
                                <td class="text-right loan_extend">0</td>
                            </tr>
                            <tr>
                                <td class="text-left"><i class="fa fa-square" style="color:#F4CC17;"></i>&nbsp;&nbsp;ยืมเกินกำหนด                                </td>
                                <td class="text-right loan_overdue">0</td>
                            </tr>
                        </tbody></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
    <script>

        function getTotal(select, res) {
            let ress = JSON.parse(res);
            $(selector).text(new Intl.NumberFormat('id-ID').format(ress.data));
        }
        function GetDetails() {
            PageMethods.biblio_all(getTotal('.biblio_total_all'));
            PageMethods.all(getTotal('.item_total_all'));
            PageMethods.lent(getTotal('.item_total_lent'));
            PageMethods.available(getTotal('.item_total_available'));
        }

        window.onload = GetDetails();
        $(function () {

            //async function getTotal(url, selector = null)
            //{
            //    if (selector !== null) $(selector).text('...');

            //    let res = await (await fetch(url)).json();

            //    if (selector !== null)
            //        $(selector).text(new Intl.NumberFormat('id-ID').format(res.data));
            //    return res.data;
            //}
          


            //getTotal('api/biblio/total/all', '.biblio_total_all');
            //getTotal('api/item/total/all', '.item_total_all');
            //getTotal('api/item/total/lent', '.item_total_lent');
            //getTotal('api/item/total/available', '.item_total_available');

            // get summary
        //    fetch('api/loan/summary')
        //        .then(res => res.json())
        //        .then(res => {

        //            $('.loan_total').text(new Intl.NumberFormat('id-ID').format(res.data.total));
        //            $('.loan_new').text(new Intl.NumberFormat('id-ID').format(res.data.new));
        //            $('.loan_return').text(new Intl.NumberFormat('id-ID').format(res.data.return));
        //            $('.loan_extend').text(new Intl.NumberFormat('id-ID').format(res.data.extend));
        //            $('.loan_overdue').text(new Intl.NumberFormat('id-ID').format(res.data.overdue));

        //            let data = [
        //                {
        //                    value: parseInt(res.data.total),
        //                    color: "#f2f2f2",
        //                    label: "Total"
        //                },
        //                {
        //                    value: parseInt(res.data.new),
        //                    color: "#337AB7",
        //                    label: "ยืม"
        //                },
        //                {
        //                    value: parseInt(res.data.return),
        //                    color: "#06B1CD",
        //                    label: "คืน"
        //                },
        //                {
        //                    value: parseInt(res.data.extend),
        //                    color: "#4AC49B",
        //                    label: "ขยายเวลา"
        //                },
        //                {
        //                    value: parseInt(res.data.overdue),
        //                    color: "#F4CC17",
        //                    label: "ยืมเกินกำหนด"
        //                }

        //            ];

        //            let r = $('#radar-chartjs');
        //            let container = $(r).parent();
        //            let rt = r.get(0).getContext("2d");
        //            $(window).resize(respondCanvas);

        //            function respondCanvas() {
        //                r.attr('width', $(container).width()); //max width
        //                r.attr('height', $(container).height()); //max height
        //                //Call a function to redraw other content (texts, images etc)
        //                let myChart = new Chart(rt).Doughnut(data, {
        //                    animation: false,
        //                    segmentStrokeWidth: 1
        //                });
        //            }

        //            respondCanvas()
        //        });

        //    // ===================================
        //    // bar chart
        //    // ===================================

        //    fetch('api/loan/getdate/2022-01-19')
        //    .then(res => res.json())
        //    .then(res => {

        //        let a = getTotal('api/loan/summary/2022-01-19');
        //        a.then(res_total => {

        //            let lineChartData = {
        //                labels: res.raw,
        //                datasets: [
        //                    {
        //                        fillColor: '#F4CC17',
        //                        highlightFill: '#F4CC17',
        //                        data: res_total.loan
        //                    },
        //                    {
        //                        fillColor: '#459CBD',
        //                        highlightFill: '#459CBD',
        //                        data: res_total.return
        //                    },
        //                    {
        //                        fillColor: '#5D45BD',
        //                        highlightFill: '#5D45BD',
        //                        data: res_total.extend
        //                    },
        //                ]
        //            }

        //            let c = $('#line-chartjs');
        //            let container = $(c).parent();
        //            let ct = c.get(0).getContext("2d");
        //            $(window).resize(respondCanvas);

        //            function respondCanvas() {
        //                c.attr('width', $(container).width()); //max width
        //                c.attr('height', $(container).height()); //max height
        //                //Call a function to redraw other content (texts, images etc)
        //                new Chart(ct).Bar(lineChartData, {
        //                    barShowStroke: false,
        //                    barDatasetSpacing: 4,
        //                    animation: {
        //                        onProgress: function(animation) {
        //                            progress.value = animation.animationObject.currentStep / animation.animationObject.numSteps;
        //                        }
        //                    }
        //                });
        //            }

        //            respondCanvas();
        //        })
        //    })
        //});

        //        // get lastest release
        //fetch('https://api.github.com/repos/slims/slims9_bulian/releases/latest')
        //    .then(res => res.json())
        //    .then(res => {
        //        if (res.tag_name !== 'v9.4.2') {
        //            $('#new_version').text(res.tag_name);
        //            $('#alert-new-version').removeClass('hidden');
        //            $('#alert-new-version a').attr('href', res.html_url)
        //        }
        //    })
        
    </script>
</div>

</asp:Content>
