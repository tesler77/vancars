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
            top: 70px;
            border-top-width: 0px;
            margin-top: 0px;
            padding-bottom: 10px;
            padding-top: 20px;
            padding-right: 10px;
            padding-left: 10px;
            width: 500px;
            height: 785px;
            border-width: 5px;
            border-color: #e00;
            border-radius: 7px;
            background-color: #f9f8f8;
            right: 10%;
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

        .modal {
            z-index: -1;
        }

            .modal.in {
                z-index: 2;
            }

        .page-section.breadcrumbs {
        }

        div span {
            text-align: left;
            color: red;
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
                        <canvas style="height: 180px; width: 700px;" id="myChart"></canvas>
                        <br />
                        <div class="text-center">
                            הצגת הזמנות של                            
                            <select id="ddlMonth">
                                <option value="1">היום האחרון</option>
                                <option value="7">השבוע האחרון</option>
                                <option value="30" selected="selected">החודש האחרון</option>
                                <option value="90">שלושת החודשים האחרונים</option>
                                <option value="180">חצי השנה האחרונה</option>
                                <option value="365">השנה האחרונה</option>
                            </select>
                        </div>
                        <br />
                        <canvas id="myBarChart" style="height: 180px; width: 700px;"></canvas>
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
                <div class="tab-pane fade" id="orders">

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
                            <div id="ordersNavigator" style="font-size: 26px; letter-spacing: 0.4em; font-weight: 700"></div>
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
                    <div class="col-md-12">
                        <div class="row">
                            <br />
                            <div id="customersNavigator" style="font-size: 26px; letter-spacing: 0.4em; font-weight: 700"></div>
                        </div>
                    </div>
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
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalTitle"></h5>
                            </div>
                            <div class="modal-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">שם שדה</th>
                                            <th scope="col">ערך</th>
                                        </tr>
                                    </thead>
                                    <tbody id="modalOrderData">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" id="aaa" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="visibility: hidden" />


            </div>
        </div>
    </div>

    <div class="col-md-1"></div>
    <asp:Literal runat="server" ID="ltlScript"></asp:Literal>
    <script>
        //הגדרת אזורים בדף לניווט
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
        window.onload = getCounter();

        function ShowLoginModal(type, number) {
            if (type === 'o') {
                document.getElementById('modalTitle').innerHTML = 'פרטי הזמנה'
                getspecificOrder(number)
            } else {
                document.getElementById('modalTitle').innerHTML = 'פרטי לקוח'
                getSpecificCustomer(number)
            }
            $("#aaa").trigger("click");
        };

        async function getspecificOrder(id) {
            let a = await fetch('https://localhost:44369/api/order/' + id);
            let b = await a.json();
            specificOrder = await JSON.parse(b)
            specificOrder = specificOrder.Table[0];
            a = $('#modalOrderData');
            a.html('');
            a.append('<tr><td>מספר הזמנה</td> <td>' + specificOrder.RentId + '</td></tr>')
            a.append('<tr><td>מספר לקוח</td> <td>' + specificOrder.CustomId + '</td></tr>')
            a.append('<tr><td>מספר הזמנה חיצוני</td> <td>' + specificOrder.ExternalRentId + '</td></tr>')
            a.append('<tr><td>סוג הרכב</td> <td>' + specificOrder.CarName + '</td></tr>')
            a.append('<tr><td>חברה</td> <td>' + specificOrder.CompanyName + '</td></tr>')
            a.append('<tr><td>מס מקומות ישיבה</td> <td>' + specificOrder.Seats + '</td></tr>')
            a.append('<tr><td>סוג מנוע</td> <td>' + specificOrder.GearBox + '</td></tr>')
            a.append('<tr><td>נפח מנוע</td> <td>' + specificOrder.EngineCapacity + '</td></tr>')
            a.append('<tr><td>מספר דלתות</td> <td>' + specificOrder.Doors + '</td></tr>')
            a.append('<tr><td>מספר מזוודות</td> <td>' + specificOrder.Beags + '</td></tr>')
            a.append('<tr><td>סניף איסוף</td> <td>' + specificOrder.PickupBranchText + '</td></tr>')
            a.append('<tr><td>תאריך איסוף</td> <td>' + specificOrder.PickupDate.substring(0, 10) + '</td></tr>')
            a.append('<tr><td>סניף החזרה</td> <td>' + specificOrder.ReturnBranchText + '</td></tr>')
            a.append('<tr><td>תאריך החזרה</td> <td>' + specificOrder.ReturnDate.substring(0, 10) + '</td></tr>')
            a.append('<tr><td>תאריך ביצוע הזמנה</td> <td>' + specificOrder.DateOrder.substring(0, 10) + '</td></tr>')
            a.append('<tr><td>סטטוס הזמנה</td> <td>' + specificOrder.Status + '</td></tr>')
        }

        async function getSpecificCustomer(id) {
            let a = await fetch('https://localhost:44369/api/user/' + id)
            let b = await a.json();
            specificCustomer = await JSON.parse(b);
            specificCustomer = specificCustomer.Table[0];
            a = $('#modalOrderData');
            a.html('');
            a.append('<tr><td>מספר לקוח</td> <td>' + specificCustomer.CustomId + '</td></tr>')
            a.append('<tr><td>שם</td> <td>' + specificCustomer.FullName + '</td></tr>')
            a.append('<tr><td>כתובת</td> <td>' + specificCustomer.Address + '</td></tr>')
            a.append('<tr><td>עיר</td> <td>' + specificCustomer.CityName + '</td></tr>')
            a.append('<tr><td>מס זהות</td> <td>' + specificCustomer.id + '</td></tr>')
            a.append('<tr><td>תאריך לידה </td> <td>' + specificCustomer.BirthDay.substring(0, 10) + '</td></tr>')
            a.append('<tr><td>מספר רישיון</td> <td>' + specificCustomer.LicenseNumber + '</td></tr>')
            a.append('<tr><td>דרגת רישיון</td> <td>' + specificCustomer.LicenseName + '</td></tr>')
            a.append('<tr><td>תאריך הנפקת רישיון</td> <td>' + specificCustomer.LicenseProductionDate.substring(0, 10) + '</td></tr>')
            a.append('<tr><td>אימייל</td> <td>' + specificCustomer.Email + '</td></tr>')
            a.append('<tr><td>טלפון</td> <td>' + specificCustomer.Phone + '</td></tr>')
            if (specificCustomer.numberIncorrects > 3) {
                let b = document.createElement('tr');
                let c = document.createElement('td');
                c.innerHTML = 'לקוח חסום';
                b.appendChild(c);
                let d = document.createElement('td');
                d.classList.add('btn');
                d.classList.add('btn-theme');
                d.innerHTML = 'שחרור לקוח';
                d.addEventListener('click', (event) => { releaseUser(specificCustomer.CustomId); ShowLoginModal('u', id)})
                b.appendChild(d);
                a.append(b);
            } else {

                a.append('<tr><td>לקוח חסום</td> <td>לא</td></tr>')
            }
            a.append('<tr><td>תאריך הרשמה</td> <td>' + specificCustomer.RegDate + '</td></tr>')
        }

        async function releaseUser(id) {
            let a = await fetch('https://localhost:44369/api/user/' + id, { method: 'PUT' });
            allCustomers.forEach((value, key) => { if (value.CustomId == id) { value.numberIncorrects = 0 } })
            getAllCustomers(1);
        }

        let orderLenght = parseInt(allOrders.length / 20 + 1);
        let customerLenght = parseInt(allCustomers.length / 20 + 1);
        let specificOrder;
        let specificCustomer;
        let numOfBrowsers;
        document.getElementById('ddlMonth').addEventListener('change', (event) => {
            getOrdersCount(parseInt(document.getElementById('ddlMonth').value))
        })

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
        let barData;
        var barCtx = document.getElementById('myBarChart').getContext('2d');
        var myBarChart = new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: ['ההזמנה הושלמה', 'רכב כעת בהשכרה', 'ממתין לתאריך'],
                datasets: [{
                    label: 'מספר הזמנות בשנה האחרונה',
                    backgroundColor: 'rgb(230, 000, 000)',
                    borderColor: 'rgb(255, 99, 132)',
                    data: barData
                }]
            },
            options: {
                scales: {
                    yAxes: [{ ticks: { min: 0 } }]
                }
            }
        })


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

        async function getOrdersCount(id) {
            let a = await fetch('https://localhost:44369/api/admin/' + id);
            let b = await a.json();
            let c = JSON.parse(b);
            myBarChart.data.datasets[0].data = [];
            c.forEach((value, key) => { myBarChart.data.datasets[0].data.push(value.count) });
            myBarChart.update()
        }

        function buildOrdersNavigator() {
            for (let i = orderLenght; i > 0; i--) {
                let nav = document.createElement('span');
                nav.classList.add('btn')
                nav.classList.add('btn-theme')

                nav.id = 'nav' + i;
                nav.innerHTML = i;
                nav.addEventListener(('click'), (event) => {
                    getAllOrders(nav.id.substring(3))
                })
                document.getElementById('ordersNavigator').appendChild(nav);
            }
        }

        function buildCustomersNavigator() {
            for (let i = customerLenght; i > 0; i--) {
                let nav = document.createElement('span');
                nav.classList.add('btn')
                nav.classList.add('btn-theme')

                nav.id = 'nav' + i;
                nav.innerHTML = i;
                nav.addEventListener(('click'), (event) => {
                    getAllCustomers(nav.id.substring(3))
                })
                document.getElementById('customersNavigator').appendChild(nav);
            }
        }

        function getAllOrders(navigator) {

            let body = document.getElementById('ordersBody').innerHTML = "";

            if (navigator == orderLenght) {
                for (let i = allOrders.length - 20; i < allOrders.length; i++) {
                    let tr = document.createElement('tr');
                    if (i % 2 == 1) {
                        tr.style.backgroundColor = 'white'
                    }
                    let num = i + 1;
                    tr.innerHTML = '<th scope="row">' + num + '</th><td>' + allOrders[i].RentId + '</td><td>' + allOrders[i].CustomId + '</td><td>' + allOrders[i].DateOrder.substring(0, 10) + '</td><td>' + allOrders[i].PickupDate.substring(0, 10) + '</td><td>' + allOrders[i].ReturnDate.substring(0, 10) + '</td><td>' + allOrders[i].PickupBranch + '</td><td>' + allOrders[i].CompanyName + '</td>'
                    tr.addEventListener('click', (event) => { ShowLoginModal('o', allOrders[i].RentId) })
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
        function getAllCustomers(navigator) {

            $('#customersBody').html('');

            if (navigator == customerLenght) {
                for (let i = allCustomers.length - 20; i < allCustomers.length; i++) {
                    let tr = document.createElement('tr');
                    if (i % 2 == 1) {
                        tr.style.backgroundColor = 'white'
                    }
                    let num = i + 1;
                    (allCustomers[i].numberIncorrects > 3) ? allCustomers[i].numberIncorrects = 'כן' : (allCustomers[i].numberIncorrects == 'כן') ? allCustomers[i].numberIncorrects = 'כן' : allCustomers[i].numberIncorrects = 'לא';
                    tr.innerHTML = '<th scope="row">' + num + '</th><td>' + allCustomers[i].CustomId + '</td><td>' + allCustomers[i].FullName + '</td><td>' + allCustomers[i].Address + '</td><td>' + allCustomers[i].Email + '</td><td>' + allCustomers[i].Phone + '</td><td>' + allCustomers[i].numberIncorrects + ' </td>';
                    tr.addEventListener('click', (event) => { ShowLoginModal('c', allCustomers[i].CustomId) })
                    let body = document.getElementById('customersBody').appendChild(tr);
                }
            }
            else {
                for (let i = navigator * 20 - 20; i < navigator * 20 && i >= navigator * 20 - 20; i++) {
                    let tr = document.createElement('tr');
                    if (i % 2 == 1) {
                        tr.style.backgroundColor = 'white'
                    }
                    let num = i + 1;
                    (allCustomers[i].numberIncorrects > 3) ? allCustomers[i].numberIncorrects = 'כן' : (allCustomers[i].numberIncorrects == 'כן') ? allCustomers[i].numberIncorrects = 'כן' : allCustomers[i].numberIncorrects = 'לא';
                    tr.innerHTML = '<th scope="row">' + num + '</th><td>' + allCustomers[i].CustomId + '</td><td>' + allCustomers[i].FullName + '</td><td>' + allCustomers[i].Address + '</td><td>' + allCustomers[i].Email + '</td><td>' + allCustomers[i].Phone + '</td><td>' + allCustomers[i].numberIncorrects + ' </td>';
                    tr.addEventListener('click', (event) => { ShowLoginModal('c', allCustomers[i].CustomId) })
                    let body = document.getElementById('customersBody').appendChild(tr);
                }
            }
        }

        buildOrdersNavigator();
        buildCustomersNavigator();
        getAllCustomers(1)
        getAllOrders(1)
        getOrdersCount(1)

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
