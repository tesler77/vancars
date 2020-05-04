<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="VanCars.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content-tabs .media + .media {
            border-top: solid 0px #e9e9e9;
            padding-top: 0px;
        }

        .content-tabs .tab-content {
            background-color: #f9f8f8;
        }

        .btn-theme.btn-block {
            max-width: 1000PX;
        }

        .modal-backdrop {
            position: inherit;
        }

        .modal-content {
            top: 200px;
            border-top-width: 0px;
            margin-top: 0px;
            padding-bottom: 10px;
            padding-top: 20px;
            padding-right: 10px;
            padding-left: 10px;
            width: 500px;
            height: 480px;
            border-width: 5px;
            border-color: #e00;
            border-radius: 7px;
            background-color: #f9f8f8;
        }

        div#exampleModal {
            background-color: rgba(0,0,0,0.6);
        }

        .form-group {
            margin-bottom: 0px;
        }

        .fade {
            display: block;
        }

        .modal{
            z-index:-1;
        }
        .modal.in{
            z-index:2;
        }
        .page-section.breadcrumbs {
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"></asp:ScriptManager>
    <section class="page-section breadcrumbs text-left" style="z-index: 0;">
        <div class="container">
            <div class="page-header text-right">
                <h1>מערכת ניהול</h1>
            </div>
            <ul class="breadcrumb text-right" <%--style="z-index: -1;"--%>>
                <%--<li><a href="#">Home</a></li>--%>
                <li><a href="#">בית</a></li>
                <li class="active">מערכת ניהול</li>
            </ul>
        </div>
    </section>
    <br />
    <br />
    <br />

    <div class="col-md-1"></div>
    <div class="col-md-10 center-block" <%--style="z-index: 0;"--%>>
        <div class="tabs-wrapper content-tabs">
            <ul class="nav nav-tabs text-center-sm">
                <li class="active" style="width: 25%"><a href="#manageFields" data-toggle="tab">ניהול ערכים לשדות מערכת</a></li>
                <li style="width: 25%"><a href="#statistics" data-toggle="tab">מצב המערכת</a></li>
                <li style="width: 25%"><a href="#orders" data-toggle="tab">הזמנות</a></li>
                <li style="width: 25%"><a href="#customers" data-toggle="tab">לקוחות</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="manageFields">
                    <asp:UpdatePanel runat="server" ID="updatePanel1">
                        <ContentTemplate>
                            <%--                            <div class="col-md-12">--%>
                            <div class="panel-group accordion" id="faq-accordion" role="tablist" aria-multiselectable="true">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="faq-heading0">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#faq-accordion" href="#faq-collapse0" aria-expanded="false" aria-controls="collapse0">
                                                <span class="dot"></span>עריכת נתוני חברות
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="faq-collapse0" class="panel-collapse collapse" role="tabpanel" aria-labelledby="faq-heading0">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-3"></div>
                                                <div class="col-md-6">
                                                    <div class="col-md-6">
                                                        <span class="hello-text text-thin">חברה</span>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="companyDdl" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="checkSelectedIndexChanged" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3"></div>
                                                <div class="row" runat="server" id="companyBlok" visible="false">
                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">שם החברה</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="שם החברה" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">קישור לסמל החברה</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtCompanyLogo" runat="server" CssClass="form-control" placeholder="קישור לסמל החברה" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">שם איש קשר</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtContuctName" runat="server" CssClass="form-control" placeholder="שם איש קשר" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">כתובת אתר החברה</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtSiteAddress" runat="server" CssClass="form-control" placeholder="כתובת אתר החברה" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">כתובת ממשק</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtApiAddress" runat="server" CssClass="form-control" placeholder="שם איש קשר" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">הערות</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" placeholder="כתובת אתר החברה" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-8">
                                                            <asp:Button CssClass="btn btn-theme btn-block btn-theme-dark" ID="btnComanySave" runat="server" Text="שמור שינויים" OnClick="btnComanySave_Click" />
                                                        </div>
                                                        <div class="col-md-2"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="faq-heading2">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#faq-accordion" href="#faq-collapse2" aria-expanded="true" aria-controls="collapse2">
                                                <span class="dot"></span>עריכת נתוני סניפים
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="faq-collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="faq-heading2">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-3"></div>
                                                <div class="col-md-6">
                                                    <div class="col-md-6">
                                                        <span class="hello-text text-thin">חברה</span>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="companyDdl1" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="checkSelectedIndexChanged" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3"></div>
                                            </div>
                                            <div class="col-md-3"></div>
                                            <div class="row" runat="server" id="brancDdlhBlok" visible="false">
                                                <div class="col-md-6">
                                                    <div class="col-md-6">
                                                        <span class="hello-text text-thin">סניף</span>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="branchDdl" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="checkSelectedIndexChanged" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3"></div>
                                                <div class="row" runat="server" id="branchBlok" visible="false">
                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">עיר</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:DropDownList ID="cityForBranchDdl" runat="server" CssClass="form-control"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">כתובת הסניף</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtBranchAddress" runat="server" CssClass="form-control" placeholder="כתובת הסניף" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">טלפון בסניף</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtBranchPhone" runat="server" CssClass="form-control" placeholder="טלפון בסניף" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-8">
                                                            <asp:Button CssClass="btn btn-theme btn-block btn-theme-dark" ID="btnBranchSave" runat="server" Text="שמור שינויים" OnClick="btnBranchSave_Click" />
                                                        </div>
                                                        <div class="col-md-2"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--</div>--%>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="faq-heading3">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#faq-accordion" href="#faq-collapse3" aria-expanded="true" aria-controls="collapse3">
                                                <span class="dot"></span>עריכת נתוני ערים
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="faq-collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="faq-heading3">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-3"></div>
                                                <div class="col-md-6">
                                                    <div class="col-md-6">
                                                        <span class="hello-text text-thin">חברה</span>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlCity" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="checkSelectedIndexChanged" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3"></div>
                                                <div class="col-md-3"></div>
                                                <div class="row" runat="server" id="cityBlok" visible="false">
                                                    <div class="col-md-3"></div>
                                                    <div class="col-md-3"></div>
                                                    <div class="col-md-3"></div>

                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">שם העיר</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="שם העיר" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3"></div>
                                                    <div class="col-md-2"></div>
                                                    <div class="col-md-2"></div>
                                                    <div class="row">
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-8">
                                                            <asp:Button CssClass="btn btn-theme btn-block btn-theme-dark" ID="btnSaveCity" runat="server" Text="שמור שינויים" OnClick="btnSaveCity_Click" />
                                                        </div>
                                                        <div class="col-md-2"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="faq-heading4">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#faq-accordion" href="#faq-collapse4" aria-expanded="true" aria-controls="collapse4">
                                                <span class="dot"></span>עריכת נתוני דרגות רכבים
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="faq-collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="faq-heading4">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-3"></div>
                                                <div class="col-md-6">
                                                    <div class="col-md-6">
                                                        <span class="hello-text text-thin">דרגת רכב</span>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="carLevelDdl" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="checkSelectedIndexChanged" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3"></div>
                                                <div class="col-md-3"></div>
                                                <div class="row" runat="server" id="carLevelBlok" visible="false">
                                                    <div class="col-md-3"></div>
                                                    <div class="col-md-3"></div>
                                                    <div class="col-md-3"></div>

                                                    <div class="col-md-6">
                                                        <div class="col-md-6 <%--hello-text-wrap--%>">
                                                            <span class="hello-text text-thin">שם דרגת הרכב</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtCarLevel" runat="server" CssClass="form-control" placeholder="שם דרגת הרכב" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3"></div>
                                                    <div class="col-md-2"></div>
                                                    <div class="col-md-2"></div>
                                                    <div class="row">
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-8">
                                                            <asp:Button CssClass="btn btn-theme btn-block btn-theme-dark" ID="btnSaveCarLevel" runat="server" Text="שמור שינויים" OnClick="btnSaveCarLevel_Click" />
                                                        </div>
                                                        <div class="col-md-2"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--</div>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div id="br"></div>
                </div>

            <div class="tab-pane fade" id="statistics">
                <div class="col-md-12">
                    <canvas style="height: 150px; width: 700px;" id="myChart"></canvas>

                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <div class="tab-pane fade" id="orders" >

                <table class="table" style="margin-top: -135px">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">מספר הזמנה</th>
                            <th scope="col">מספר לקוח</th>
                            <th scope="col">תאריך ביצוע</th>
                            <th scope="col">תאריך התחלה</th>
                            <th scope="col">תאריך סיום</th>
                            <th scope="col">סניף</th>
                            <th scope="col">חברה</th>
                        </tr>
                    </thead>
                    <tbody id="ordersBody">
                    </tbody>
                </table>
                <div class="col-md-12">
                    <div class="row">
                        <br />
                        <div id="ordersNavigator" style="font-size: 26px;letter-spacing:0.6em; font-weight:700"></div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="customers">
                <table class="table" style="margin-top: -135px;">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">מספר לקוח</th>
                            <th scope="col">שם מלא</th>
                            <th scope="col">כתובת</th>
                            <th scope="col">שם משתמש</th>
                            <th scope="col">טלפון</th>
                            <th scope="col">לקוח חסום</th>
                        </tr>
                    </thead>
                    <tbody id="customersBody">
                    </tbody>
                </table>
            </div>



            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
                                                                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                        <div class="modal-dialog" role="document">
                                                                            <div class="modal-content" style="top: 300px;">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                            <button type="button" id="aaa" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="visibility: hidden"/>


            </div>
        </div>
    </div>

    <div class="col-md-1"></div>
    <asp:Literal runat="server" ID="ltlScript"></asp:Literal>
    <script>
        function ShowLoginModal(type,number) {
            $("#aaa").trigger("click");
        };
        //הגדרת אזורים בדף לניווט
        var pagesOrders = parseInt(allOrders.length / 20) + 1;
        window.onload = function () {
            var url = document.location.toString();
            if (url.match('#')) {
                $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
            }

            //Change hash for page-reload
            $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').on('shown', function (e) {
                window.location.hash = e.target.hash;
            });
        }
        function goToBranchs() {
            window.location.href = "https://localhost:44369/admin.aspx#faq-collapse2";
            let b = document.getElementById('faq-collapse2');
            b.classList.add('in');
            b.setAttribute('aria-expanded', 'true');
            b.style.height = 'null';
        }
        function goToCity() {
            window.location.href = "https://localhost:44369/admin.aspx#faq-collapse3";
            let b = document.getElementById('faq-collapse3');
            b.classList.add('in');
            b.setAttribute('aria-expanded', 'true');
            b.style.height = 'null';
        }
        function goToCarLevel() {
            window.location.href = "https://localhost:44369/admin.aspx#faq-collapse3";
            let b = document.getElementById('faq-collapse4');
            b.classList.add('in');
            b.setAttribute('aria-expanded', 'true');
            b.style.height = 'null';
        }
        function goToCompanys() {
            window.location.href = "https://localhost:44369/admin.aspx#faq-collapse0";
            let a = document.getElementById('faq-collapse0');
            a.classList.add('in');
            a.setAttribute('aria-expanded', 'true');
            a.style.height = 'null';
        }
        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'line',

            // The data for our dataset
            data: {
                labels: ['הרגע'],
                datasets: [{
                    label: 'מספר הגולשים כרגע',
                    backgroundColor: 'rgb(230, 000, 000)',
                    borderColor: 'rgb(255, 99, 132)',
                    data: []
                    //#e60000;
                }]
            },

            // Configuration options go here
            options: {
                scales: {
                    yAxes: [{ ticks: { min: 0 } }]
                }
            }
        });
        let minutsArr = [['הרגע'],
        ['לפני דקה', 'הרגע'],
        ['לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 5 דקות', 'לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 6 דקות', 'לפני 5 דקות', 'לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 7 דקות', 'לפני 6 דקות', 'לפני 5 דקות', 'לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 8 דקות', 'לפני 7 דקות', 'לפני 6 דקות', 'לפני 5 דקות', 'לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 9 דקות', 'לפני 8 דקות', 'לפני 7 דקות', 'לפני 6 דקות', 'לפני 5 דקות', 'לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 10 דקות', 'לפני 9 דקות', 'לפני 8 דקות', 'לפני 7 דקות', 'לפני 6 דקות', 'לפני 5 דקות', 'לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 11 דקות', 'לפני 10 דקות', 'לפני 9 דקות', 'לפני 8 דקות', 'לפני 7 דקות', 'לפני 6 דקות', 'לפני 5 דקות', 'לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 12 דקות', 'לפני 11 דקות', 'לפני 10 דקות', 'לפני 9 דקות', 'לפני 8 דקות', 'לפני 7 דקות', 'לפני 6 דקות', 'לפני 5 דקות', 'לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע'],
        ['לפני 13 דקות', 'לפני 12 דקות', 'לפני 11 דקות', 'לפני 10 דקות', 'לפני 9 דקות', 'לפני 8 דקות', 'לפני 7 דקות', 'לפני 6 דקות', 'לפני 5 דקות', 'לפני 4 דקות', 'לפני 3 דקות', 'לפני 2 דקות', 'לפני דקה', 'הרגע']]
        setInterval(() => {
            if (chart.data.labels.length < 14) {
                chart.data.labels = minutsArr[chart.data.labels.length];
                chart.data.datasets[0].data.push(numOfBrowsers);
                chart.update();
            } else {
                chart.data.datasets[0].data.shift();
                chart.update();
                chart.data.datasets[0].data.push(numOfBrowsers);
                chart.update();

            }
        }, 6000)
        let numOfBrowsers;
        setInterval((async () => {
            let a = await fetch('https://localhost:44369/api/admin');
            let u = await a.json()
            let c = u - 1;
            chart.data.datasets[0].label = await 'מספר הגולשים כרגע ' + c;
            numOfBrowsers = c;
            chart.update()
        }), 5000);
        async function getCounter() {
            let a = await fetch('https://localhost:44369/api/admin');
            let u = await a.json()
            let c = u - 1;
            chart.data.datasets[0].label = await 'מספר הגולשים כרגע ' + c;
            numOfBrowsers = c;
            chart.data.datasets[0].data.push(numOfBrowsers);
            chart.update()
        }
        window.onload = getCounter();
        let orderLenght = parseInt(allOrders.length / 20 + 1);
        function buildOrdersNavigator() {
            for (let i = orderLenght; i > 0; i--) {
                let nav = document.createElement('span');
                nav.id = 'nav' + i;
                nav.innerHTML = '   ' + i + '   ';
                nav.addEventListener(('click'), (event) => {
                    getAllOrders(nav.id.substring(3))
                })
                document.getElementById('ordersNavigator').appendChild(nav);
            }
        }
        buildOrdersNavigator();
        function getAllOrders(navigator) {

            let body = document.getElementById('ordersBody').innerHTML = "";

            if (navigator === orderLenght) {
                for (let i = allOrders.length - 20; i < allOrders.length; i++) {
                    let tr = document.createElement('tr');
                    if (i % 2 == 1) {
                        tr.style.backgroundColor = 'white'
                    }
                    let num = i + 1;
                    tr.innerHTML = '<th scope="row">' + num + '</th><td>' + allOrders[i].RentId + '</td><td>' + allOrders[i].CustomId + '</td><td>' + allOrders[i].DateOrder.substring(0, 10) + '</td><td>' + allOrders[i].PickupDate.substring(0, 10) + '</td><td>' + allOrders[i].ReturnDate.substring(0, 10) + '</td><td>' + allOrders[i].PickupBranch + '</td><td>' + allOrders[i].CompanyName + '</td>'
                    tr.addEventListener('click', (event) => { ShowLoginModal('o', allOrders[i].RentId)})
                    let body = document.getElementById('ordersBody').appendChild(tr);
                }
            } else {
                for (let i = navigator * 20 - 20; i < navigator * 20 && i >= navigator * 20 - 20; i++) {
                    let tr = document.createElement('tr');
                    if (i % 2 == 1) {
                        tr.style.backgroundColor = 'white'
                    }
                    let num = i + 1;
                    tr.innerHTML = '<th scope="row">' + num + '</th><td>' + allOrders[i].RentId + '</td><td>' + allOrders[i].CustomId + '</td><td>' + allOrders[i].DateOrder.substring(0, 10) + '</td><td>' + allOrders[i].PickupDate.substring(0, 10) + '</td><td>' + allOrders[i].ReturnDate.substring(0, 10) + '</td><td>' + allOrders[i].PickupBranch + '</td><td>' + allOrders[i].CompanyName + '</td>'
                    tr.addEventListener('click', (event) => { ShowLoginModal('o', allOrders[i].RentId) })
                    let body = document.getElementById('ordersBody').appendChild(tr);
                }
            }
        }
        function getAllCustomers() {

            for (let i = 0; i < allCustomers.length; i++) {
                let tr = document.createElement('tr');
                if (i % 2 == 1) {
                    tr.style.backgroundColor = 'white'
                }
                let num = i + 1;
                tr.innerHTML = '<th scope="row">' + num + '</th><td>' + allCustomers[i].CustomId + '</td><td>' + allCustomers[i].FullName + '</td><td>' + allCustomers[i].Address + '</td><td>' + allCustomers[i].Email + '</td><td>' + allCustomers[i].Phone + '</td><td>' + allCustomers[i].numberIncorrects + ' </td>';
                let body = document.getElementById('customersBody').appendChild(tr);
            }
        }
        getAllCustomers()
        getAllOrders(1)
        //$(window).resize(() => { if ($(window).width() < 742) { if ($(window).width() < 615) { document.getElementById('customers').style.top = '-1950px' } else { document.getElementById('customers').style.top = '-1554px' } } else { document.getElementById('customers').style.top = '-970px' } })

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
