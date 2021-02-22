<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="PrivateArea.aspx.cs" Inherits="VanCars.PrivateArea" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/PrivateArea.css" />

    <link rel="stylesheet" type="text/css" href="css/chathCss.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .header-status {
            position: absolute;
            left: 80px;
        }

        .disable-btn-theme {
            background-color: #d3d3d3;
            border-color: #d3d3d3;
        }

            .disable-btn-theme:hover {
                background-color: #d3d3d3;
                border-color: #d3d3d3;
            }

        .tab-width {
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"></asp:ScriptManager>
    <section class="page-section breadcrumbs text-left" style="z-index: 0">
        <div class="container">
            <div class="page-header text-right">
                <h1>אזור אישי</h1>
            </div>
            <ul class="breadcrumb text-right">
                <li><a href="#">בית</a></li>
                <li class="active">אזור אישי</li>
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
                <li class="active tab-width" id="OrdersHistoryTab" style="width: 19.9%"><a href="#OrdersHistory" data-toggle="tab">היסטוריית ההזמנות</a></li>
                <li id="SearchsTab" style="width: 20%"><a href="#Searchs" data-toggle="tab">היסטוריית חיפושים</a></li>
                <li id="personDataTab" style="width: 20%"><a href="#personData" data-toggle="tab">פרטים אישיים</a></li>
                <li id="CreditCardsTab" style="width: 20%"><a href="#CreditCards" data-toggle="tab">כרטיסי אשראי</a></li>
                <li id="RequestsTab" style="width: 20%"><a href="#Requests" data-toggle="tab">פניות ותלונות</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="OrdersHistory">
                    <div class="col-md-12">
                        <div class="panel-group accordion" id="faq-accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="faq-heading0">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#faq-accordion" href="#faq-collapse0" aria-expanded="true" aria-controls="collapse0">
                                            <span class="dot"></span>היסטוריית הזמנותיך
                                        </a>
                                    </h4>
                                </div>
                                <div id="faq-collapse0" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="faq-heading0">
                                    <div class="panel-body">
                                        היי כאן תוכל לראות את היסטוריית הזמנותיך שבוצעו דרכינו, במקרים מסויימים תוכל אף לבטל את ההזמנה ולשנות בה פרטים

                                    </div>
                                </div>
                            </div>
                            <asp:Repeater ID="RptOrders" runat="server" OnItemDataBound="RptOrders_ItemDataBound" OnItemCommand="RptOrders_ItemCommand">
                                <ItemTemplate>

                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="faq-heading<%# Eval("RentId") %>">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#faq-accordion" href="#faq-collapse<%# Eval("RentId") %>" aria-expanded="false" aria-controls="collapse<%# Eval("RentId") %>">
                                                    <span class="dot"></span>הזמנה: <%# Eval("RentId") %>   בתאריכים  <%# Eval("ReturnDate").ToString().Substring(0,10) %>  - <%# Eval("PickupDate").ToString().Substring(0,10) %>
                                                    <span class="header-status"><%# Eval("Status") %></span>
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="faq-collapse<%# Eval("RentId") %>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="faq-heading<%# Eval("RentId") %>">
                                            <div class="panel-body">
                                                <asp:Button ID="btnEditOrder" runat="server" Text="עריכת הזמנה" CssClass="btn btn-theme btn-block btn-theme-dark center-block" />
                                                <br />
                                                <div class="col-md-12 text-right">
                                                    <div class="contact-info">
                                                        <h2 class="block-title"><span>פרטי ההזמנה</span></h2>
                                                        <div class="row">
                                                            <div class="media col-md-6">
                                                                <i class="pull-right fa fa-clipboard"></i>
                                                                <div class="media-body">
                                                                    <strong>מס הזמנה בחברת השכרה:</strong><br />
                                                                    <%# Eval("ExternalRentId") %>
                                                                </div>
                                                            </div>
                                                            <div class="media col-md-6">
                                                                <i class="pull-right fa fa-clipboard"></i>
                                                                <div class="media-body">
                                                                    <strong>מס הזמנה פנימי:</strong><br />
                                                                    <%# Eval("RentId") %>
                                                                </div>
                                                            </div>
                                                            <div class="media col-md-6">
                                                                <i class="pull-right fa fa-car"></i>
                                                                <div class="media-body">
                                                                    <strong>רכב:</strong><br />
                                                                    <%# Eval("CarName") %>
                                                                </div>
                                                            </div>
                                                            <div class="media col-md-6">
                                                                <i class="pull-right fa fa-globe"></i>
                                                                <div class="media-body">
                                                                    <strong>חברה:</strong><br />
                                                                    <%# Eval("CompanyId") %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <div class="col-md-6 text-right">
                                                            <h2 class="block-title"><span>לקיחת הרכב</span></h2>
                                                            <div class="media">
                                                                <i class="pull-right fa fa-location-arrow"></i>
                                                                <div class="media-body">
                                                                    <strong>מסניף:</strong><br />
                                                                    <%# Eval("PickupBranchText") %>
                                                                </div>
                                                            </div>
                                                            <div class="media">
                                                                <i class="pull-right fa fa-calendar"></i>
                                                                <div class="media-body">
                                                                    <strong>מתאריך:</strong><br />
                                                                    <%# Eval("PickupDate").ToString().Substring(0,10) %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 text-right">
                                                            <h2 class="block-title"><span>החזרת הרכב</span></h2>
                                                            <div class="media">
                                                                <i class="pull-right fa fa-location-arrow"></i>
                                                                <div class="media-body">
                                                                    <strong>לסניף:</strong><br />
                                                                    <%# Eval("ReturnBranchText") %>
                                                                </div>
                                                            </div>
                                                            <div class="media">
                                                                <i class="pull-right fa fa-calendar"></i>
                                                                <div class="media-body">
                                                                    <strong>עד תאריך:</strong><br />
                                                                    <%# Eval("ReturnDate").ToString().Substring(0,10) %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div id="br"></div>
                </div>
                <div class="tab-pane fade" id="Searchs">
                    <table class="table" id="SearchsTable">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">תאריך חיפוש</th>
                                <th scope="col">מעיר</th>
                                <th scope="col">לעיר</th>
                                <th scope="col">מתאריך</th>
                                <th scope="col">עד תאריך</th>
                                <th scope="col">חיפוש מהיר</th>
                            </tr>
                        </thead>
                        <tbody id="searchesBody">
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="personData">
                    <div class="row">
                        <br />
                        <br />
                    </div>
                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="col-md-6">
                                        <span class="hello-text text-thin">שם מלא</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" placeholder="שם מלא" ReadOnly="true" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-6">
                                        <span class="hello-text text-thin">כתובת</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control" placeholder="כתובת" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="col-md-6 hello-text-wrap">
                                        <span class="hello-text text-thin">מספר זהות</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtId" runat="server" CssClass="form-control" placeholder="מספר זהות" ReadOnly="true" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-6 hello-text-wrap">
                                        <span class="hello-text text-thin">עיר</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" Visible="false"></asp:DropDownList>

                                        <asp:TextBox ID="TxtCity" runat="server" CssClass="form-control" placeholder="עיר" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="col-md-6">
                                        <span class="hello-text text-thin">תאריך לידה</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtDateOfBirth" runat="server" TextMode="Date" CssClass="form-control" ReadOnly="true" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-6">
                                        <span class="hello-text text-thin">מספר רישיון</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtLicenseNumber" runat="server" CssClass="form-control" placeholder="מספר רישיון" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="col-md-6">
                                        <span class="hello-text text-thin">תאריך הנפקת רישיון</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtDateOfIssuanceLicense" runat="server" TextMode="Date" CssClass="form-control" ReadOnly="true" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-6">
                                        <span class="hello-text text-thin">דרגת רישיון</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtLicenseCode" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        <asp:DropDownList ID="DdlLicensCode" runat="server" CssClass="form-control" Visible="false"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="col-md-6">
                                        <span class="hello-text text-thin">טלפון</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtPhone" runat="server" CssClass="form-control" TextMode="Phone" placeholder="טלפון" ReadOnly="true" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <asp:Button ID="BtnChange" runat="server" Text="לשינוי פרטים אישיים" CssClass="btn btn-theme btn-block btn-theme-dark" OnClick="BtnChange_Click" />

                                </div>
                                <div class="col-md-2"></div>
                            </div>

                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <asp:Button ID="btnSaveChange" runat="server" Text="שמור שינויים" CssClass="btn btn-theme btn-block btn-theme-dark" Visible="false" OnClick="btnSaveChange_Click" />

                                </div>
                                <div class="col-md-2"></div>
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                    <br />

                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
                <div class="tab-pane fade" id="CreditCards">
                    <asp:UpdatePanel ID="updatePanelCards" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <div class="table-responsive">
                                        <table id="Cards" class="table table-bordered table-striped">
                                            <thead style="background-color: black; color: white">
                                                <th scope="col" class="col-md-2 text-center">זיהוי</th>
                                                <th scope="col" class="col-md-8 text-center">מספר אשראי</th>
                                                <th scope="col" class="col-md-1 text-center">עריכה</th>
                                                <th scope="col" class="col-md-1 text-center">מחיקה</th>
                                            </thead>
                                            <tbody id="cardsBody">
                                                <asp:Repeater ID="rptCards" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# Eval("id") %></td>
                                                            <td><%# Eval ("number") %></td>
                                                            <td>
                                                                <button type="button" id="<%# Eval("id") %>_e" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#<%# Eval("id") %>_edit"><i class="fa fa-edit"></i></button>
                                                            </td>
                                                            <td>
                                                                <button type="button" id="<%# Eval("id") %>_d" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#<%# Eval("id") %>_delete" />
                                                                <i class="fa fa-close"></i></button></td>
                                                        </tr>
                                                        <div class="modal fade" id="<%# Eval("id") %>_edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content modal-content1" style="width: auto; height: auto;">
                                                                    עריכת כרטיס אשראי: <%# Eval("id") %>
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="col-md-12" style="text-align: right; margin-top: 30px">
                                                                                <span class="hello-text text-thin text-right">מספר אשראי</span>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <asp:TextBox ID="txtEditCardNumber" runat="server" CssClass="form-control" placeholder='<%# Eval ("number") %>'></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="col-md-12" style="text-align: right; margin-top: 1px">
                                                                                <span class="hello-text text-thin text-right">חודש</span>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <asp:TextBox ID="txtEditCardMonth" runat="server" CssClass="form-control" placeholder='<%# Eval ("month") %>'></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="col-md-12" style="text-align: right; margin-top: 1px">
                                                                                <span class="hello-text text-thin text-right">שנה</span>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <asp:TextBox ID="txtEditYear" runat="server" CssClass="form-control" placeholder='<%# Eval ("year") %>'></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-5">
                                                                            <div class="col-md-6" style="margin-top: 1px">
                                                                                <span class="hello-text text-thin">3 ספרות</span>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <asp:TextBox ID="txtEditCardCvv" runat="server" CssClass="form-control" placeholder='<%# Eval ("digitNo") %>'></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-7">
                                                                            <div class="col-md-6" style="margin-top: 1px">
                                                                                <span class="hello-text text-thin">זהות בעל האשראי</span>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <asp:TextBox ID="txtEditOwnerId" runat="server" CssClass="form-control" Text='<%# Eval ("ownerId") %>' ReadOnly="true"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        <br />

                                                                        <div class="row">
                                                                            <div class="col-md-1"></div>
                                                                            <div class="col-md-5" style="padding-right: 30px; padding-left: 30px">
                                                                                <asp:Button ID="btnEditCreditCard" CommandArgument='<%# Eval("id") %>' runat="server" Text="שינוי פרטי הכרטיס" CssClass="btn btn-theme btn-block btn-theme-dark" OnClick="btnEditCreditCard_Click" />
                                                                            </div>
                                                                            <div class="col-md-5" style="padding-right: 30px; padding-left: 30px">
                                                                                <button type="button" data-dismiss="modal" class="btn btn-theme btn-block btn-theme-dark">ביטול</button>
                                                                            </div>
                                                                            <div class="col-md-1"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal fade" id="<%# Eval("id") %>_delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content modal-content1" style="height: 220px; top: 270px; width: auto;">
                                                                    <br />
                                                                    <span class="text-center">האם אתה בטוח שברצונך למחוק את האשראי: <%# Eval("id") %>?</span>
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <asp:Button ID="deleteCard" runat="server" CommandArgument='<%# Eval("id") %>' Text="מחיקה" CssClass="btn btn-theme btn-block btn-theme-dark" OnClick="deleteCard_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <button type="button" id="openCreateModal" class="btn btn-theme btn-block btn-theme-dark" data-toggle="modal" data-target="#add">הוספת כרטיס חדש</button>
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                            <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content" style="top: 300px;">
                                        <h1>ddddd</h1>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content modal-content1">
                                        <span class="text-center-lg">הוספת כרטיס אשראי</span><br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-6" style="margin-top: 10px">
                                                    <span class="hello-text text-thin">מספר כרטיס</span>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCradNumber" CssClass="form-control" runat="server" placeholder="מספר כרטיס"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="col-md-6" style="margin-top: 10px">
                                                    <span class="hello-text text-thin">חודש</span>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCardMonth" CssClass="form-control" runat="server" placeholder="חודש"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="col-md-6" style="margin-top: 10px">
                                                    <span class="hello-text text-thin">שנה</span>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCardYear" runat="server" CssClass="form-control" placeholder="שנה"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="col-md-6" style="margin-top: 10px">
                                                    <span class="hello-text text-thin">ספרות ביטחון</span>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCardCvv" runat="server" CssClass="form-control" placeholder="ספרות ביטחון"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="col-md-6" style="margin-top: 10px">
                                                    <span class="hello-text text-thin">זהות בעל האשראי</span>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtOwnerId" runat="server" CssClass="form-control" placeholder="ספרות ביטחון"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                                <ContentTemplate>
                                                    <div class="col-md-7">
                                                        <%--<asp:Button ID="addCreditCard" runat="server" Text="לשמירת פרטי הכרטיס" CssClass="btn btn-theme btn-block btn-theme-dark" OnClick="addCreditCard_Click" />--%>
                                                        <button type="button" id="addCreditCard" class="btn btn-theme btn-block btn-theme-dark">לשמירת פרטי הכרטיס</button>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <button type="button" data-dismiss="modal" class="btn btn-theme btn-block btn-theme-dark">ביטול</button>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane fade" id="Requests">
                    <div class="container col-md-12" style="max-width: 2000px">
                        <h3 class=" text-center">פניות לתמיכה ושרות לקוחות</h3>
                        <div class="messaging">
                            <div class="inbox_msg">
                                <div class="inbox_people">
                                    <div class="headind_srch">
                                        <div class="dot text-center" style="padding-bottom: 5px;">נא הזן מספר הזמנה</div>
                                        <input id="orderForChath" class="form-control" />
                                    </div>
                                    <div class="inbox_chat" id="inbox_chat">
                                    </div>
                                </div>
                                <div class="mesgs">
                                    <i id="backIcon" onclick="showInbox()" class="fa fa-arrow-left" aria-hidden="true" style="left: 10%; position: absolute; font-size: x-large;"></i>
                                    <br />
                                    <br />
                                    <div class="msg_history" id="msg_history">
                                    </div>
                                    <div class="type_msg">
                                        <div class="input_msg_write">
                                            <div class="left center-block">
                                                <textarea type="text" id="write_msg" class="write_msg" placeholder="הקלד הודעה"></textarea>
                                            </div>
                                            <button id="msg_send_btn" class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                                        </div>
                                    </div>
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
                    <br />
                    <div class="col-md-1"></div>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document" style="top: 31%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitle">שגיאה</h5>
                        </div>
                        <div class="modal-body" style="text-align: center">
                            <div id="messageBody"></div>
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" id="aaa" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="visibility: hidden" />

            <asp:Literal ID="ltlNo" runat="server"></asp:Literal>
            <script>
                let ord = "";

                //הגדרת אזורים בדף לניווט
                window.onload = function () {
                    hideAddCreditCardModal()
                    var url = document.location.toString();
                    if (url.match('#')) {
                        $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
                    }
                    $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').on('shown', function (e) {
                        window.location.hash = e.target.hash;
                    });
                }

                //פונקציה המציגה חלון קופץ
                function showModalMessage(content) {
                    $("#messageBody").html(content)
                    $("#aaa").trigger("click");
                }

                //הוספת רווחים בסוף העמוד
                let b = "";
                for (let i = 0; i < numbers; i++) {
                    b += "<br/><br/><br/>"
                }
                $("#br").html(b);
                date = new Date();
                let formatedDate = ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear();

                searchs.forEach((search, index) => {
                    let tr = $('<tr></tr>');
                    if (index % 2 == 1) {
                        tr.css("background-color", "white");
                    }
                    let i = index + 1;
                    let d = (search.searchDate) ? search.searchDate.replace('T', ' ').substring(0, 19) : null;
                    tr.html('<th scope="row">' + i + '</th><td>' + d + '</td><td>' + search.FromLocation + '</td><td>' + search.toLocation + '</td><td>' + search.FromDate + '</td><td>' + search.ToDate + '</td>');
                    let td = $('<td></td>')
                    $(td).html('חיפוש מהיר');
                    $(td).addClass("btn btn-theme");
                    let dateString = new Date(search.FromDate);
                    if (dateString <= date) {
                        $(td).addClass("disable-btn-theme");
                    } else {
                        $(td).click(() => {
                            window.location = "https://localhost:44369/results.aspx?search=" + search.id;
                        })
                    }
                    $(tr).append(td);
                    let sBody = $("#searchesBody").append(tr)
                })

                let messagesObject = [];// הגדרה ראשונית של אובייקט ההודעות
                // מעבר על מערך ההודעות הקיימות
                messages.forEach((msgObj, index) => {
                    //בדיקה האם כבר קיימים הודעות באובייקט
                    if (messagesObject.length === 0) {
                        //במידה ולא אנו יוצרים איבר של הודעה ודוחפים אותו לאובייקט ההודעות
                        let messageItem = {
                            order: msgObj.orderId,
                            lastMessage: msgObj.sendDate,
                            messages: [{
                                id: msgObj.id,
                                customersMessage: msgObj.customersMessage,
                                messageText: msgObj.messageText,
                                date: msgObj.sendDate,
                            }]

                        }
                        messagesObject.push(messageItem);
                        //במידה ואובייקט ההודעות אינו ריק
                    } else {
                        let flag = false;
                        //אנו עוברים על אובייקט ההודעות ובודקים האם כבר קיים אובייקט פנימי עבור מספר הזמנה הנוכחי
                        for (let i = 0; i < messagesObject.length; i++) {
                            if (messagesObject[i].order === msgObj.orderId) {
                                //במידה וקיים אנו רק מוסיפים לו את ההודעה הספציפית
                                let message = {
                                    id: msgObj.id,
                                    customersMessage: msgObj.customersMessage,
                                    messageText: msgObj.messageText,
                                    date: msgObj.sendDate,
                                }
                                messagesObject[i].messages.push(message);
                                flag = true;
                                if (messagesObject[i].lastMessage < msgObj.sendDate) {
                                    messagesObject[i].lastMessage = msgObj.sendDate
                                }
                            }
                        }
                        //במידה ולא קיים אובייקט עבור ההזמנה הנוכחית אנו מייצרים אובייקט חדש עבור ההזמנה הנוכחית
                        if (flag == true)
                            return false;
                        //break;
                        let messageItem = {
                            order: msgObj.orderId,
                            lastMessage: msgObj.sendDate,
                            messages: [{
                                id: msgObj.id,
                                customersMessage: msgObj.customersMessage,
                                messageText: msgObj.messageText,
                                date: msgObj.sendDate,
                            }]
                        }
                        messagesObject.push(messageItem)
                    }
                    //messagesObject.sort((a, b) => { (a.lastMessage > b.lastMessage) ? 1 : 0 })
                    messagesObject.sort((a, b) => { return (a.lastMessage.substring(0, 10) > b.lastMessage.substring(0, 10)) ? -1 : 1 });
                    getChaths();
                })


                var activeMsg;

                allOrders.push({ RentId: 0, DateOrder: '' });

                //המציגה את כל הצ'אטים שיש למשתמש
                function getChaths() {
                    $('#inbox_chat').html('');
                    messagesObject = messagesObject.sort((a, b) => { return (a.lastMessage > b.lastMessage) ? -1 : 1 });
                    for (let i = 0; i < messagesObject.length; i++) {
                        allOrders.forEach((ord, key) => {
                            if (ord.RentId == messagesObject[i].order) {
                                let a = $('<div></div>');
                                a.addClass('chat_list');
                                if (activeMsg && activeMsg.substring(4) == messagesObject[i].order) {
                                    a.addClass('active_chat');
                                }
                                //a.classList.add('chat_list');
                                a.id = 'chat' + messagesObject[i].order;
                                let b = $('<div></div>');
                                b.addClass('chat_people');
                                //b.classList.add('chat_people');
                                let c = $('<div></div>');
                                c.addClass('chat_ib');
                                let d = $('<h5></h5>');
                                let e = $('<p></p>');
                                e.addClass('chat_date');
                                e.html(ord.DateOrder.replace('T', ' | '));
                                d.html(ord.RentId);
                                (d.html() == 0) ? d.html() : "כללי";
                                if (ord.RentId == 0)
                                    d.html('כללי');
                                c.append(d);
                                c.append(e);
                                b.append(c);
                                a.append(b);
                                a.on('click', (event) => {
                                    let allActives = $(".active_chat");
                                    [].forEach.call(allActives, function (el) {
                                        el.classList.remove("active_chat");
                                    });
                                    activeMsg = a.id;
                                    a.addClass('active_chat');
                                    let m = a.id.substring(4)
                                    fullMessages(m)
                                    if ($(document).width() < 500) {
                                        $('.inbox_people').hide()
                                        $('.inbox_people').css('width', '1%')
                                        $('.mesgs').css('width', '100%')
                                        $('.mesgs').show()
                                    }
                                })
                                $('#inbox_chat').append(a);
                            }
                        })
                    }
                };
                getChaths();

                //פונקציה המציגה את כל ההודעות לפי צ'אט
                function fullMessages(orderId) {
                    messagesObject.forEach((msgItem, key) => {
                        if (msgItem.order == orderId) {
                            let msg_history = $('#msg_history');
                            msg_history.html(' ');
                            msgItem.messages.forEach((message, index) => {
                                let a = $('<div></div>');
                                if (message.customersMessage === true || message.customersMessage === 1) {
                                    a.addClass('incoming_msg');
                                    let b = $('<div></div>');
                                    b.addClass('received_msg');
                                    let c = $('<div></div>');
                                    c.addClass('received_withd_msg');
                                    let d = $('<p></p>');
                                    d.html(message.messageText);
                                    let e = $('<span></span>');
                                    e.addClass('time_date');
                                    e.html(message.date.substring(0, 19).replace('T', ' | '));
                                    c.append(d);
                                    c.append(e);
                                    b.append(c);
                                    a.append(b);
                                    msg_history.append(a);
                                } else {
                                    a.addClass('outgoing_msg');
                                    let b = $('<div></div>');
                                    b.addClass('sent_msg');
                                    let c = $('<p></p>');
                                    c.html(message.messageText);
                                    let d = $('<span></span>');
                                    d.addClass('time_date');
                                    d.html(message.date.substring(0, 19).replace('T', ' | '));
                                    b.append(c)
                                    b.append(d)
                                    a.append(b)
                                    msg_history.append(a)
                                }
                            })
                        }
                    })
                }

                //קריאה לפונקציה להוספת הודעה כאשר המשתמש לוץ על כפתור שליחת הודעה
                $(msg_send_btn).click((event) => {
                    addMessage()
                })

                //קריאה לפונקציה להוספת הודעה כאשר המשתמש מקיש על אנטר
                $(write_msg).keyup((event) => {
                    if (event.keyCode === 13) {
                        addMessage()
                    }
                })

                //פונקציה המוסיםה את ההודעה בבסיס הנתונים
                function addMessageToServer(m) {
                    fetch('https://localhost:44369/api/chatMessage/',
                        {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(m)
                        }).then((response) => {
                            return
                        })
                }

                //פונקציה המוסיפה את ההודעה לצ'אט
                function addMessage() {
                    if (write_msg.textLength > 0) {
                        messagesObject.forEach((msgObj, index) => {
                            if (msgObj.order == activeMsg.substring(4)) {
                                let d = new Date()
                                let da = [d.getFullYear(), d.getMonth() + 1, d.getDate()].join('-') + ' | ' + [d.getHours(), d.getMinutes(), d.getSeconds()].join(':');
                                msgItem = {
                                    id: null,
                                    customerId: allOrders[0].CustomId,
                                    orderId: msgObj.order,
                                    customersMessage: 1,
                                    messageText: write_msg.value.substring(0, write_msg.value.length - 1),
                                }
                                addMessageToServer(msgItem)
                                msgItem.date = da
                                msgObj.messages.push(msgItem)
                                msgObj.lastMessage = [d.getFullYear(), pad_with_zeroes(d.getMonth() + 1, 2), pad_with_zeroes(d.getDate(), 2)].join('-') + 'T' + [pad_with_zeroes(d.getHours(), 2), pad_with_zeroes(d.getMinutes(), 2), pad_with_zeroes(d.getSeconds(), 2)].join(':') + '.' + pad_with_zeroes(d.getMilliseconds(), 3);
                                fullMessages(msgObj.order)
                                write_msg.value = ''
                                let msg_history = $('#msg_history');
                                msg_history.scrollTop($('#msg_history').prop('scrollHeight'));
                            }
                        })
                        messagesObject = messagesObject.sort((a, b) => { return (a.lastMessage > b.lastMessage) ? -1 : 1 });
                        getChaths();
                        $("#inbox_chat").scrollTop(0)
                    }
                }

                //פונקציה המוסיפה אפסים מובילים
                function pad_with_zeroes(number, length) {

                    var my_string = '' + number;
                    while (my_string.length < length) {
                        my_string = '0' + my_string;
                    }

                    return my_string;

                }
                //פונקציה המפלטרת את הצ'אטים לפי תיבת חיפוש
                let orderForChath = $('#orderForChath');
                orderForChath.on('keyup', (event) => {
                    document.getElementById('inbox_chat').innerHTML = ' ';
                    allOrders.forEach((ord, index) => {
                        messagesObject.forEach((msgObj, index) => {
                            let a = document.getElementById('orderForChath');
                            if (msgObj.order.toString().startsWith(a.value) && msgObj.order == ord.RentId) {
                                let a = $('<div></div>');
                                if (activeMsg && activeMsg.substring(4) == msgObj.order) {
                                    a.addClass("active_chat");
                                }
                                a.addClass('chat_list');
                                a.id = 'chat' + msgObj.order;
                                let b = $('<div></div>');
                                b.addClass('chat_people');
                                let c = $('<div></div>');
                                c.addClass('chat_ib');
                                let d = $('<h5></h5>');
                                let e = $('<p></p>');
                                e.addClass('chat_date');
                                e.html(ord.DateOrder.replace('T', ' | '));
                                d.html(ord.RentId);
                                (d.html() == 0) ? d.html() : "כללי";
                                (d.html() == 0) ? d.html() : "כללי";
                                c.append(d);
                                c.append(e);
                                b.append(c);
                                a.append(b);
                                a.on('click', (event) => {
                                    let allActives = $(".active_chat");
                                    [].forEach.call(allActives, function (el) {
                                        el.classList.remove("active_chat");
                                    });
                                    a.addClass('active_chat');
                                    activeMsg = a.id;
                                    let m = a.id.substring(4)
                                    fullMessages(m)
                                    if ($(document).width() < 500) {
                                        $('.inbox_people').hide()
                                        $('.inbox_people').css('width', '1%')
                                        $('.mesgs').css('width', '100%')
                                        $('.mesgs').show();
                                    }
                                })
                                $('#inbox_chat').append(a);
                            }
                        })
                    })
                })

                //בעת טעינת הדף מתאים את טבלת כרטיסי האשראי לפי רוחב המסך
                $(document).ready(function () {
                    if ($(window).width() < 500) {
                        $('#Cards td:nth-child(1),#Cards th:nth-child(1)').hide();
                        $('.mesgs').hide()
                        $('.mesgs').css('width', '1%')
                        $('.inbox_people').css('width', '100%')
                    } else {
                        $("#backIcon").hide();

                    };
                    if ($(window).width() < 650) {
                        $(".header-status").css("color", "transparent");
                        $('#Searchs td:nth-child(7),#Searchs th:nth-child(7)').hide();
                    } else {
                        $(".header-status").css("color", "#14181c");
                    }
                    if ($(window).width() < 760) {
                        $("[id$='Tab']").css('width', '50%');
                        $(".tab-width").css('width', '100%')
                    } else {
                        $("[id$='Tab']").css('width', '20%');

                    }
                    if ($(window).width() < 814) {
                        $('#Searchs td:nth-child(2),#Searchs th:nth-child(2)').hide();
                    }
                })

                //בעת שינוי רוחב המסך מתאים את טבלת כרטיסי האשראי בהתאם
                $(window).resize(() => {
                    if ($(window).width() < 500) {
                        $('#Cards td:nth-child(1),#Cards th:nth-child(1)').hide();
                        showInbox();
                    } else {
                        $('#Cards td:nth-child(1),#Cards th:nth-child(1)').show();
                        $('.mesgs').show()
                        $('.mesgs').css('width', '60%')
                        $('.inbox_people').css('width', '40%')
                        $('.inbox_people').show()
                        $("#backIcon").hide();
                    }
                    if ($(window).width() < 760) {
                        $("[id$='Tab']").css('width', '50%');
                        $(".tab-width").css('width', '100%')
                    } else {
                        $("[id$='Tab']").css('width', '20%');

                    }
                    if ($(window).width() < 650) {
                        $(".header-status").css("color", "transparent");
                        $('#Searchs td:nth-child(7),#Searchs th:nth-child(7)').hide();
                    } else {
                        $(".header-status").css("color", "#14181c");
                        $('#Searchs td:nth-child(7),#Searchs th:nth-child(7)').show();
                    }
                    if ($(window).width() < 814) {
                        $('#Searchs td:nth-child(2),#Searchs th:nth-child(2)').hide();
                    }
                    else {
                        $('#Searchs td:nth-child(2),#Searchs th:nth-child(2)').show();
                    }
                })

                //פונקציה המציגה רק את הצ'אטים ולא את ההודעות כאשר המסך קטן
                function showInbox() {
                    $('.mesgs').hide()
                    $('.mesgs').css('width', '1%')
                    $('.inbox_people').css('width', '100%')
                    $('.inbox_people').show()
                    $("#backIcon").show();

                }

                function hideAddCreditCardModal() {
                    $("#add").hide();
                }
                
                async function addCreditCard() {                    
                    let creditCard = {
                        id: "-1",
                        number: document.getElementById("ContentPlaceHolder1_txtCradNumber").value,
                        month: document.getElementById("ContentPlaceHolder1_txtCardMonth").value,
                        year: document.getElementById("ContentPlaceHolder1_txtCardYear").value,
                        digitNo: document.getElementById("ContentPlaceHolder1_txtCardCvv").value,
                        ownerId: document.getElementById("ContentPlaceHolder1_txtOwnerId").value,
                        customerId:messages[0].customerId
                    }
                    if (!creditCard.number || !creditCard.month || !creditCard.year || !creditCard.digitNo || !creditCard.ownerId) {
                        showModalMessage("אנא הזן את כל הפרטים");
                        return;
                    }
                    
                    let ca = await addCardToServer(creditCard);                    
                    creditCard.number = creditCard.number.substring(creditCard.number.length - 4) + " - **** - **** - ****";
                    let newLine = "<tr><td>" + ca + "</td ><td>" + creditCard.number + "</td><td><button type='button' id='" + ca + "_e' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#" + ca + "_edit'><i class='fa fa-edit'></i></button></td><td><button type='button' id='" + ca + "_d' class='btn btn-danger btn-sm' data-toggle='modal' data-target='#" + ca + "_delete'/><i class='fa fa-close'></i></button></td ></tr>";
                    $("#cardsBody").append(newLine);
                    $("#add").hide()
                    showModalMessage("כרטיס האשראי התווסף בהצלחה");
                }
                var newCardId = "";
                async function addCardToServer(creditcard) {
                    let ab = await fetch('https://localhost:44369/api/creditCard/',
                        {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(creditcard)
                        });
                    return await ab.json();
                        //.then((response) => {
                        //    debugger;
                        //    newCardId = response.body;
                        //})
                }

                document.getElementById("addCreditCard").addEventListener("click", (event) => {
                    addCreditCard()
                })

            </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
