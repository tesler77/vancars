<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="VanCars.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--CSS קישור לקבצי--%>
    <link rel="stylesheet" type="text/css" href="css/chathCss.css" />
    <link rel="stylesheet" type="text/css" href="css/admin.css" />

    <%--קישור לקובץ ג'אווה סקריפט שמטפלת בדיאגרמות--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--שמאפשר קריאה לפונקציית ג'אווה סקריפט מצד שרת C# קריאה לאובייקט--%>
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"></asp:ScriptManager>

    <%--נתוני כותרת--%>
    <section class="page-section breadcrumbs text-left" style="z-index: 0;">
        <div class="container">
            <div class="page-header text-right">
                <h1>מערכת ניהול</h1>
            </div>
            <ul class="breadcrumb text-right">
                <li><a href="#">בית</a></li>
                <li class="active">מערכת ניהול</li>
            </ul>
        </div>
    </section>
    <br />
    <br />
    <br />

    <div class="col-md-1"></div>
    <div class="col-md-10 center-block">
        <div class="tabs-wrapper content-tabs">
            <ul class="nav nav-tabs text-center-sm">

                <%--הגדרת הטאבים--%>
                <li class="active" id="manageFieldsTabMain" style="width: 20%"><a href="#manageFields" data-toggle="tab">ניהול ערכים לשדות מערכת</a></li>
                <li id="statisticsTab" style="width: 20%"><a href="#statistics" data-toggle="tab">מצב המערכת</a></li>
                <li id="ordersTab" style="width: 20%"><a href="#orders" data-toggle="tab">הזמנות</a></li>
                <li id="customersTab" style="width: 20%"><a href="#customers" data-toggle="tab">לקוחות</a></li>
                <li id="chatsTab" style="width: 20%"><a href="#chats" data-toggle="tab">פניות</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="manageFields">

                    <%--המאפשר גישה לשרת ללא רינדור של כל הדף C# קריאה לאובייקט--%>
                    <asp:UpdatePanel runat="server" ID="updatePanel1">
                        <ContentTemplate>
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
                                                        <div class="col-md-6">
                                                            <span class="hello-text text-thin">שם החברה</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="שם החברה" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6">
                                                            <span class="hello-text text-thin">קישור לסמל החברה</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtCompanyLogo" runat="server" CssClass="form-control" placeholder="קישור לסמל החברה" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6">
                                                            <span class="hello-text text-thin">שם איש קשר</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtContuctName" runat="server" CssClass="form-control" placeholder="שם איש קשר" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6">
                                                            <span class="hello-text text-thin">כתובת אתר החברה</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtSiteAddress" runat="server" CssClass="form-control" placeholder="כתובת אתר החברה" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6">
                                                            <span class="hello-text text-thin">כתובת ממשק</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtApiAddress" runat="server" CssClass="form-control" placeholder="שם איש קשר" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6">
                                                            <span class="hello-text text-thin">הערות</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" placeholder="הערות" />
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
                                                        <div class="col-md-6">
                                                            <span class="hello-text text-thin">עיר</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:DropDownList ID="cityForBranchDdl" runat="server" CssClass="form-control"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6">
                                                            <span class="hello-text text-thin">כתובת הסניף</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtBranchAddress" runat="server" CssClass="form-control" placeholder="כתובת הסניף" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="col-md-6">
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
                                                        <div class="col-md-6 ">
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
                                                        <div class="col-md-6 ">
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
                    <table class="table" id="customersTable" style="margin-top: -135px;">
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
                <div class="tab-pane fade" id="chats">
                    <div class="panel-group accordion" id="faq-accordion-chats" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="faq-heading-chat0">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#faq-accordion" href="#faq-collapse-chat0" aria-expanded="false" aria-controls="collapse0">
                                        <span class="dot"></span>עריכת נתוני חברות
                                    </a>
                                </h4>
                            </div>
                            <div id="faq-collapse-chat0" class="panel-collapse collapse" role="tabpanel" aria-labelledby="faq-heading-chat0">
                                <div class="panel-body">
                                </div>
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

    <%--הגדרת שלושה ליטרלים שמקבלים נתונים מצד השרת בעת טעינת הדף--%>
    <asp:Literal runat="server" ID="ltlAllOrders"></asp:Literal>
    <asp:Literal runat="server" ID="ltlAllCustomers"></asp:Literal>
    <asp:Literal runat="server" ID="ltlChatsUnread"></asp:Literal>
    <script src="js/minutesArr.js"></script>
    <script>

        //הגדרת אזורים בדף לניווט
        window.onload = function () {
            var url = document.location.toString();
            if (url.match('#')) {
                $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
            }
            $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').on('shown', function (e) {
                window.location.hash = e.target.hash;
            });
        }

        //פונקציה שמנווטת לאזור בדף המטפל בסניפים
        function goToBranchs() {
            window.location.href = "https://localhost:44369/admin.aspx#faq-collapse2";
            let b = document.getElementById('faq-collapse2');
            b.classList.add('in');
            b.setAttribute('aria-expanded', 'true');
            b.style.height = 'null';
        }

        //פונקציה שמנווטת לאזור בדף המטפל בערים
        function goToCity() {
            window.location.href = "https://localhost:44369/admin.aspx#faq-collapse3";
            let b = document.getElementById('faq-collapse3');
            b.classList.add('in');
            b.setAttribute('aria-expanded', 'true');
            b.style.height = 'null';
        }

        //פונקציה שמנווטת לאזור בדף המטפל בדרגות רכבים
        function goToCarLevel() {
            window.location.href = "https://localhost:44369/admin.aspx#faq-collapse3";
            let b = document.getElementById('faq-collapse4');
            b.classList.add('in');
            b.setAttribute('aria-expanded', 'true');
            b.style.height = 'null';
        }

        //פונקציה שמנווטת לאזור בדף המטפל בחברות
        function goToCompanys() {
            window.location.href = "https://localhost:44369/admin.aspx#faq-collapse0";
            let a = document.getElementById('faq-collapse0');
            a.classList.add('in');
            a.setAttribute('aria-expanded', 'true');
            a.style.height = 'null';
        }

        //קריאה לפונקציה שמביאה את מספר הגולשים בעת טעינת הדף
        window.onload = getCounter();

        //פונקציה המציגה חלון קופץ עם נתונים הנשלחים אליה
        function ShowLoginModal(type, number) {
            if (type === 'o') {
                $("#modalTitle").html("פרטי הזמנה");
                getspecificOrder(number)
            } else {
                $("#modalTitle").html("פרטי לקוח");
                getSpecificCustomer(number)
            }
            $("#aaa").trigger("click");
        };

        //פונקציה המקבלת מספר הזמנה ומציגה את נתוני ההזמנה בחלון קופץ
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

        //פונקציה המקבלת מספר לקוח ומציגה את נתוני הלקוח בחלון קופץ
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
                let b = $('<tr></tr>');
                let c = $('<td></td>');
                c.html('לקוח חסום');
                b.append(c);
                let d = $('<td></td>');
                d.addClass('btn btn-theme');
                d.html('שחרור לקוח');
                d.on("click", (event) => { releaseUser(specificCustomer.CustomId); ShowLoginModal('u', id) });
                b.append(d);
                a.append(b);
            } else {

                a.append('<tr><td>לקוח חסום</td> <td>לא</td></tr>')
            }
            a.append('<tr><td>תאריך הרשמה</td> <td>' + specificCustomer.RegDate.substring(0, 10) + '</td></tr>')
        }

        //פונקציה המקבלת מספר לקוח ומשחררת אותו מחסימה
        async function releaseUser(id) {
            let a = await fetch('https://localhost:44369/api/user/' + id, { method: 'PUT' });
            allCustomers.forEach((value, key) => { if (value.CustomId == id) { value.numberIncorrects = 0 } })
            getAllCustomers(1);
        }

        //הגדרת מספר הדפים לניווט בתוך טבלת לקוחות והזמנות
        let orderLenght = parseInt(allOrders.length / 20 + 1);
        let customerLenght = parseInt(allCustomers.length / 20 + 1);
        let specificOrder;
        let specificCustomer;
        let numOfBrowsers;

        //אירוע קבלת מספר ההזמנות לפי טווח של מספר ימים
        $("#ddlMonth").on("click", (event) => { getOrdersCount(parseInt($("#ddlMonth").val())) })


        //אתחול אובייקט דיאגרמה של מספר גולשים
        var ctx = $("#myChart")[0].getContext('2d')
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

        //אתחול אובייקט דיאגרמה של סיכומי הזמנות
        let barData;
        var barCtx = $("#myBarChart")[0].getContext('2d');
        var myBarChart = new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: ['ההזמנה הושלמה', 'ממתין לתאריך', 'רכב כעת בהשכרה'],
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


        //פונקציה שרצה בכל 6 שניות ומעדכנת את מספר העמודות לחישוב כמות הגולשים
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

        //פונקציה שרצה בכל 5 שניות ומעדכנת את כמות הגושלים
        setInterval((async () => {
            let a = await fetch('https://localhost:44369/api/admin');
            let u = await a.json()
            let c = u - 1;
            chart.data.datasets[0].label = await 'מספר הגולשים כרגע ' + c;
            numOfBrowsers = c;
            chart.update()
        }), 5000);

        //פונקציה שנקראת בעת טעינת הדף ומביאה את כמות הגולשים
        async function getCounter() {
            let a = await fetch('https://localhost:44369/api/admin');
            let u = await a.json()
            let c = u - 1;
            chart.data.datasets[0].label = await 'מספר הגולשים כרגע ' + c;
            numOfBrowsers = c;
            chart.data.datasets[0].data.push(numOfBrowsers);
            chart.update()
        }

        //פונקציה המקבלת טווח ימים ומחזירה את מספר ההזמנות שבומעו בטווח זה
        async function getOrdersCount(id) {
            let a = await fetch('https://localhost:44369/api/admin/' + id);
            let b = await a.json();
            let c = JSON.parse(b);
            myBarChart.data.datasets[0].data = [];
            c.forEach((value, key) => { myBarChart.data.datasets[0].data.push(value.count) });
            myBarChart.update()
        }

        //פונקציה הבונה את כפתורי הניווט במסך ההזמנות
        function buildOrdersNavigator() {
            for (let i = orderLenght; i > 0; i--) {
                let nav = $("<span></span>");
                nav.addClass('btn btn-theme');
                nav.id = 'nav' + i;
                nav.html(i);
                nav.on("click", (event) => { getAllOrders(nav.id.substring(3)) })
                $("#ordersNavigator").append(nav);
            }
        }

        //פונקציה הבונה את כפתורי הניווט במסך הלקוחות
        function buildCustomersNavigator() {
            for (let i = customerLenght; i > 0; i--) {
                let nav = $("<span></span>");
                nav.addClass('btn btn-theme');

                nav.id = 'nav' + i;
                nav.html(i);
                nav.on("click", (event) => { getAllCustomers(nav.id.substring(3)) })
                $("#customersNavigator").append(nav);
            }
        }

        //פונקציה המציגה את ההזמנות לפי כפתור הניווט שנלחץ
        function getAllOrders(navigator) {

            let body = $("#ordersBody").html('');

            if (navigator == orderLenght) {
                for (let i = allOrders.length - 20; i < allOrders.length; i++) {
                    let tr = $('<tr></tr>');
                    if (i % 2 == 1) {
                        tr.css("background-color", "white");
                    }
                    let num = i + 1;
                    tr.html('<th scope="row">' + num + '</th><td>' + allOrders[i].RentId + '</td><td>' + allOrders[i].CustomId + '</td><td>' + allOrders[i].DateOrder.substring(0, 10) + '</td><td>' + allOrders[i].PickupDate.substring(0, 10) + '</td><td>' + allOrders[i].ReturnDate.substring(0, 10) + '</td><td>' + allOrders[i].PickupBranch + '</td><td>' + allOrders[i].CompanyName + '</td>');
                    tr.on("click", (event) => { ShowLoginModal('o', allOrders[i].RentId) })
                    let body = $("#ordersBody").append(tr);
                }
            } else {
                for (let i = navigator * 20 - 20; i < navigator * 20 && i >= navigator * 20 - 20; i++) {
                    let tr = $('<tr></tr>');
                    if (i % 2 == 1) {
                        tr.css("background-color", "white");
                    }
                    let num = i + 1;
                    tr.html('<th scope="row">' + num + '</th><td>' + allOrders[i].RentId + '</td><td>' + allOrders[i].CustomId + '</td><td>' + allOrders[i].DateOrder.substring(0, 10) + '</td><td>' + allOrders[i].PickupDate.substring(0, 10) + '</td><td>' + allOrders[i].ReturnDate.substring(0, 10) + '</td><td>' + allOrders[i].PickupBranch + '</td><td>' + allOrders[i].CompanyName + '</td>')
                    tr.on("click", (event) => { ShowLoginModal('o', allOrders[i].RentId) })
                    let body = $("#ordersBody").append(tr);

                }
            }
        }

        //פונקציה המציגה את הלקוחות לפי כפתור הניווט שנלחץ
        function getAllCustomers(navigator) {

            $('#customersBody').html('');

            if (navigator == customerLenght) {
                for (let i = allCustomers.length - 20; i < allCustomers.length; i++) {
                    let tr = $('<tr></tr>');
                    if (i % 2 == 1) {
                        tr.css("background-color", "white");
                    }
                    let num = i + 1;
                    (allCustomers[i].numberIncorrects > 3) ? allCustomers[i].numberIncorrects = 'כן' : (allCustomers[i].numberIncorrects == 'כן') ? allCustomers[i].numberIncorrects = 'כן' : allCustomers[i].numberIncorrects = 'לא';
                    tr.html('<th scope="row">' + num + '</th><td>' + allCustomers[i].CustomId + '</td><td>' + allCustomers[i].FullName + '</td><td>' + allCustomers[i].Address + '</td><td>' + allCustomers[i].Email + '</td><td>' + allCustomers[i].Phone + '</td><td>' + allCustomers[i].numberIncorrects + ' </td>');
                    tr.on("click", (event) => { ShowLoginModal('c', allCustomers[i].CustomId) })
                    let body = $("#customersBody").append(tr);
                }
            }
            else {
                for (let i = navigator * 20 - 20; i < navigator * 20 && i >= navigator * 20 - 20; i++) {
                    let tr = $('<tr></tr>');
                    if (i % 2 == 1) {
                        tr.css("background-color", "white");
                    }
                    let num = i + 1;
                    (allCustomers[i].numberIncorrects > 3) ? allCustomers[i].numberIncorrects = 'כן' : (allCustomers[i].numberIncorrects == 'כן') ? allCustomers[i].numberIncorrects = 'כן' : allCustomers[i].numberIncorrects = 'לא';
                    tr.html('<th scope="row">' + num + '</th><td>' + allCustomers[i].CustomId + '</td><td>' + allCustomers[i].FullName + '</td><td>' + allCustomers[i].Address + '</td><td>' + allCustomers[i].Email + '</td><td>' + allCustomers[i].Phone + '</td><td>' + allCustomers[i].numberIncorrects + ' </td>');
                    tr.on("click", (event) => { ShowLoginModal('c', allCustomers[i].CustomId) })
                    let body = $("#customersBody").append(tr);
                }
            }
        }

        //אתחול אובייקט ההודעות
        let messagesObject = [];

        //פונקציה המקבלת טבלת הודעות ומייצרת אובייקט הודעות מורכב
        function createMessagesObject() {
            chatsUnread.forEach((value, index) => {
                if (messagesObject.length == 0) {
                    let temp = {
                        orderId: value.orderId,
                        customerId: value.customerId,
                        messages: [{
                            id: value.id,
                            customersMessage: value.customersMessage,
                            messageStatus: value.messageStatus,
                            messageText: value.messageText,
                            sendDate: value.sendDate
                        }]
                    }
                    messagesObject.push(temp);
                }
                else {
                    let existing = false;
                    for (let i = 0; i < messagesObject.length; i++) {
                        if (messagesObject[i].orderId == value.orderId) {
                            let message = {
                                id: value.id,
                                customersMessage: value.customersMessage,
                                messageStatus: value.messageStatus,
                                messageText: value.messageText,
                                sendDate: value.sendDate
                            }
                            messagesObject[i].messages.push(message);
                            existing = true;
                        }
                    }
                    if (existing == false) {
                        let temp = {
                            orderId: value.orderId,
                            customerId: value.customerId,
                            messages: [{
                                id: value.id,
                                customersMessage: value.customersMessage,
                                messageStatus: value.messageStatus,
                                messageText: value.messageText,
                                sendDate: value.sendDate
                            }]
                        }
                        messagesObject.push(temp);
                    }
                }
            })
        }

        //פונקציה הממלאת את ההודעות מאובייקט ההודעת תחת כל כותרת צ'אט
        function fullMessages() {
            let main = document.getElementById('faq-accordion-chats');
            main.innerHTML = '';
            var temp = "";
            messagesObject.forEach((value, index) => {
                temp += "<div class='panel panel-default'>"
                temp += "<div class='panel-heading' role='tab' id='faq-heading-chat" + value.orderId + "'>"
                temp += "<h4 class='panel-title'>"
                temp += "<a data-toggle='collapse' data-parent='#faq-accordion' href='#faq-collapse-chat" + value.orderId + "' aria-expanded='false' aria-controls='collapse" + value.orderId + "'>"
                temp += '<span class="dot"></span>' + checkOrderId(value.orderId, value.customerId) + '<button class="button-done" onclick="takenCareOf(' + value.orderId + ',' + value.customerId + ')"> טופל </button></a></h4></div>'
                temp += "<div id='faq-collapse-chat" + value.orderId + "' class='panel-collapse collapse' role='tabpanel' aria-labelledby='faq-heading-chat" + value.orderId + "'><div class='panel-body'>"
                temp += '<div class="mesgs"> <div class="msg_history" id="msg_history' + value.orderId + '">'
                value.messages.forEach((message, messagesInd) => {

                    if (message.customersMessage === true || message.customersMessage === 1) {
                        temp += '<div class="incoming_msg"><div class="received_msg"><div class="received_withd_msg"><p>' + message.messageText + '</p><span>' + message.sendDate.substring(0, 19).replace('T', ' | ') + '</span></div></div></div>'
                    } else {
                        temp += '<div class="outgoing_msg"><div class="sent_msg"><p>' + message.messageText + '</p><span>' + message.sendDate.substring(0, 19).replace('T', ' | ') + '</span></div></div>'
                    }

                })
                temp += '<div  id="type_msg' + value.orderId + '"></div><div class="type_msg"><div class="input_msg_write"><div class="left center-block"><textarea type="text" id="write_msg' + value.orderId + '" class="write_msg" placeholder="הקלד הודעה"></textarea></div><button id="msg_send_btn' + value.orderId + '" class="msg_send_btn" onclick="sendMessage(' + value.orderId + ')" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button></div></div></div></div></div></div></div>'
                function checkOrderId(orderId, customerId) {
                    if (value.orderId != 0) {
                        return "פניה עבור הזמנה מס " + orderId
                    } else {
                        return "פניה עבור לקוח " + customerId
                    }
                }

            })
            main.innerHTML = temp
        }

        //פונקציה המטפלת בצ'אט שסומן כטופל
        async function takenCareOf(orderId, customerId) {
            let newMessage;
            if (orderId != 0) {
                messagesObject.forEach((value, index) => {
                    if (value.orderId == orderId) {
                        customerId = value.customerId;
                    }
                })
                newMessage = {
                    id: 0,
                    customerId: customerId,
                    orderId: orderId,
                    customersMessage: 0,
                    messageText: ""
                }
            } else {
                newMessage = {
                    id: 0,
                    customerId: customerId,
                    orderId: 0,
                    customersMessage: 0,
                    messageText: ""
                }
            }
            await fetch('https://localhost:44369/api/chatMessage/',
                {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(newMessage)
                }
            ).then((response) => {
                return
            })
            messagesObject.forEach((value, index) => {
                if (value.orderId == orderId && value.customerId == customerId) {
                    messagesObject.splice(index, 1)
                }
            })
            fullMessages()
        }

        //פונקציה המטפלת בשליחת הודעה למשתמש
        function sendMessage(id) {
            let orderId = id;//.id.substring(9);
            let msgId = 'write_msg' + id;
            var msg = document.getElementById(msgId);
            let message = msg.value; // $("msgId").val();
            if (message == '') {
                return;
            }
            let customerId;
            messagesObject.forEach((value, index) => {
                if (value.orderId == orderId) {
                    customerId = value.customerId;
                }

            })
            let newMessage = {
                id: "",
                customerId: customerId,
                orderId: parseInt(orderId),
                customersMessage: 0,
                messageText: message
            }
            fetch('https://localhost:44369/api/chatMessage/',
                {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(newMessage)
                }).then((response) => {
                    return
                })

            newMessage = {
                id: "",
                customersMessage: false,
                messageStatus: 2,
                messageText: message,
                sendDate: getDateInSqlFormat()
            }
            messagesObject.forEach((value, index) => {
                if (value.orderId == orderId) {
                    value.messages.push(newMessage);
                };
            })

            msg.value = "";
            let messageTypeId = 'type_msg' + orderId;
            let template = '<div class="outgoing_msg"><div class="sent_msg"><p>' + newMessage.messageText + '</p><span>' + newMessage.sendDate.substring(0, 19).replace('T', ' | ') + '</span></div></div>'
            document.getElementById(messageTypeId).innerHTML = document.getElementById(messageTypeId).innerHTML + template;
        }

        //פונקציה שלוקחת תאריך בפורמט ג'אווה סקריפט והופכת אותו לתאריך בפורמט SQL
        function getDateInSqlFormat() {
            let date;
            date = new Date();
            date = date.getUTCFullYear() + '-' +
                ('00' + (date.getUTCMonth() + 1)).slice(-2) + '-' +
                ('00' + date.getUTCDate()).slice(-2) + ' ' +
                ('00' + date.getHours()).slice(-2) + ':' +
                ('00' + date.getUTCMinutes()).slice(-2) + ':' +
                ('00' + date.getUTCSeconds()).slice(-2);
            date = date.replace(' ', 'T')
            return date
        }

        $(window).resize(() => {
            if ($(window).width() < 940) {
                $("[id$='Tab']").css('width', '50%');
                $("#manageFieldsTabMain").css('width', '100%')
                if ($(window).width() > 640) {
                    $('#customersTable td:nth-child(6),#customersTable th:nth-child(6)').hide();
                    $('#customersTable td:nth-child(4),#customersTable th:nth-child(4)').show();
                    $('#customersTable td:nth-child(5),#customersTable th:nth-child(5)').show();
                } else {
                    $('#customersTable td:nth-child(4),#customersTable th:nth-child(4)').hide();
                    $('#customersTable td:nth-child(5),#customersTable th:nth-child(5)').hide();
                }
            }
            else {
                $("[id$='Tab']").css('width', '20%');
                $("#manageFieldsTabMain").css('width', '20%')
                $('#customersTable td:nth-child(6),#customersTable th:nth-child(6)').show()
                $('#customersTable td:nth-child(4),#customersTable th:nth-child(4)').show();
                $('#customersTable td:nth-child(5),#customersTable th:nth-child(5)').show();
            }
        })
        $(document).ready(() => {
            myBarChart.update()
        })
        //קריאה לפונקציות המתאימות בעת אתחול הדף
        buildOrdersNavigator();
        buildCustomersNavigator();
        getAllCustomers(1)
        getAllOrders(1)
        getOrdersCount(30)
        createMessagesObject()
        fullMessages()

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
