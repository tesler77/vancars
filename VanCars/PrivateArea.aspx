<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="PrivateArea.aspx.cs" Inherits="VanCars.PrivateArea" %>

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
    </style>
    <link rel="stylesheet" type="text/css" href="css/chathCss.css"
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"></asp:ScriptManager>
    <section class="page-section breadcrumbs text-left">
        <div class="container">
            <div class="page-header text-right">
                <h1>אזור אישי</h1>
            </div>
            <ul class="breadcrumb text-right">
                <%--<li><a href="#">Home</a></li>--%>
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
                <li class="active" style="width: 25%"><a href="#OrdersHistory" data-toggle="tab">היסטוריית ההזמנות שלי</a></li>
                <li style="width: 25%"><a href="#personData" data-toggle="tab">פרטים אישיים</a></li>
                <li style="width: 25%"><a href="#CreditCards" data-toggle="tab">תשלומים</a></li>
                <li style="width: 25%"><a href="#Requests" data-toggle="tab">פניות ותלונות</a></li>
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
                            <asp:Repeater ID="RptOrders" runat="server">
                                <ItemTemplate>

                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="faq-heading<%# Eval("RentId") %>">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#faq-accordion" href="#faq-collapse<%# Eval("RentId") %>" aria-expanded="false" aria-controls="collapse<%# Eval("RentId") %>">
                                                    <span class="dot"></span>הזמנה: <%# Eval("RentId") %>   בתאריכים  <%# Eval("PickupDate") %>  - <%# Eval("ReturnDate") %> 
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="faq-collapse<%# Eval("RentId") %>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="faq-heading<%# Eval("RentId") %>">
                                            <div class="panel-body">
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
                                                                    <%# Eval("PickupDate") %>
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
                                                                    <%# Eval("ReturnDate") %>
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

                            <!---->
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="faq-heading2">
                                    <h4 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#faq-accordion" href="#faq-collapse2" aria-expanded="false" aria-controls="collapse2">
                                            <span class="dot"></span>Where can I rent a car?
                                        </a>
                                    </h4>
                                </div>
                                <div id="faq-collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="faq-heading2">
                                    <div class="panel-body">
                                        <div class="col-md-12 text-right">
                                            <div class="contact-info">
                                                <h2 class="block-title"><span>פרטי ההזמנה</span></h2>
                                                <div class="row">
                                                    <div class="media col-md-6">
                                                        <i class="pull-right fa fa-clipboard"></i>
                                                        <div class="media-body">
                                                            <strong>מס הזמנה בחברת השכרה:</strong><br />
                                                            <div id="extId"></div>
                                                        </div>
                                                    </div>
                                                    <div class="media col-md-6">
                                                        <i class="pull-right fa fa-clipboard"></i>
                                                        <div class="media-body">
                                                            <strong>מס הזמנה פנימי:</strong><br />
                                                            <div id="inId"></div>
                                                        </div>
                                                    </div>
                                                    <div class="media col-md-6">
                                                        <i class="pull-right fa fa-car"></i>
                                                        <div class="media-body">
                                                            <strong>רכב:</strong><br />
                                                            <div id="CarName"></div>
                                                        </div>
                                                    </div>
                                                    <div class="media col-md-6">
                                                        <i class="pull-right fa fa-globe"></i>
                                                        <div class="media-body">
                                                            <strong>חברה:</strong><br />
                                                            <div id="CompanyName"></div>
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
                                                            <div id="fromBranch"></div>
                                                        </div>
                                                    </div>
                                                    <div class="media">
                                                        <i class="pull-right fa fa-calendar"></i>
                                                        <div class="media-body">
                                                            <strong>מתאריך:</strong><br />
                                                            <div id="fromDate"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 text-right">
                                                    <h2 class="block-title"><span>החזרת הרכב</span></h2>
                                                    <div class="media">
                                                        <i class="pull-right fa fa-location-arrow"></i>
                                                        <div class="media-body">
                                                            <strong>לסניף:</strong><br />
                                                            <div id="ToBranch"></div>
                                                        </div>
                                                    </div>
                                                    <div class="media">
                                                        <i class="pull-right fa fa-calendar"></i>
                                                        <div class="media-body">
                                                            <strong>עד תאריך:</strong><br />
                                                            <div id="ToDate"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="br"></div>
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
                                    <div class="col-md-6 <%--hello-text-wrap--%>">
                                        <span class="hello-text text-thin">שם מלא</span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" placeholder="שם מלא" ReadOnly="true" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-6 <%--hello-text-wrap--%>">
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
                                                <th class="col-md-2 text-center">זיהוי</th>
                                                <th class="col-md-8 text-center">מספר אשראי</th>
                                                <th class="col-md-1 text-center">עריכה</th>
                                                <th class="col-md-1 text-center">מחיקה</th>
                                            </thead>
                                            <tbody>
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
                                                                <div class="modal-content">
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
                                                                                <span class="hello-text text-thin">ספרות ביטחון</span>
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
                                                                            <div class="col-md-5">
                                                                                <asp:Button ID="btnEditCreditCard" CommandArgument='<%# Eval("id") %>' runat="server" Text="שינוי פרטי הכרטיס" CssClass="btn btn-theme btn-block btn-theme-dark" OnClick="btnEditCreditCard_Click" />
                                                                            </div>
                                                                            <div class="col-md-5">
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
                                                                <div class="modal-content" style="height: 220px; top: 270px;">

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
                                    <div class="modal-content">
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
                                            <div class="col-md-7">
                                                <asp:Button ID="addCreditCard" runat="server" Text="לשמירת פרטי הכרטיס" CssClass="btn btn-theme btn-block btn-theme-dark" OnClick="addCreditCard_Click" />
                                            </div>
                                            <div class="col-md-5">
                                                <button type="button" data-dismiss="modal" class="btn btn-theme btn-block btn-theme-dark">ביטול</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane fade" id="Requests">


                    <div class="container col-md-11">
                        <h3 class=" text-center">פניות לתמיכה ושרות לקוחות</h3>
                        <div class="messaging">
                            <div class="inbox_msg">
                                <div class="inbox_people">
                                    <div class="headind_srch">
                                        <div class="dot text-center" style="padding-bottom:5px;">נא הזן מספר הזמנה</div>
                                        <input id="orderForChath" class="form-control" />
                                    </div>
                                    <div class="inbox_chat" id="inbox_chat">
                                    </div>
                                </div>
                                <div class="mesgs">
                                    <div class="msg_history" id="msg_history">
                                    </div>
                                    <div class="type_msg">
                                        <div class="input_msg_write">
                                            <div class="left center-block">
                                                <textarea type="text" id="write_msg" class="write_msg" placeholder="Type a message"></textarea>
                                            </div>
                                            <button id="msg_send_btn" class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
                <div class="col-md-1"></div>

            <asp:Literal ID="ltlNo" runat="server"></asp:Literal>
            <script>
                let ord = "";

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

                //הוספת רווחים בסוף העמוד
                let b = "";
                for (let i = 0; i < numbers; i++) {
                    b += "<br/><br/><br/>"
                }
                $("#br").html(b);


                let messagesObject = [];// הגדרה ראשונית של אובייקט ההודעות
                // מעבר על מערך ההודעות הקיימות
                messages.forEach((msgObj, index) => {
                    //בדיקה האם כבר קיימים הודעות באובייקט
                    if (messagesObject.length === 0) {
                        //במידה ולא אנו יוצרים איבר של הודעה ודוחפים אותו לאובייקט ההודעות
                        let messageItem = {
                            order: msgObj.orderId,
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
                            }
                        }
                        //במידה ולא קיים אובייקט עבור ההזמנה הנוכחית אנו מייצרים אובייקט חדש עבור ההזמנה הנוכחית
                        if (flag == true)
                            return false;
                            //break;
                        let messageItem = {
                            order: msgObj.orderId,
                            messages: [{
                                id: msgObj.id,
                                customersMessage: msgObj.customersMessage,
                                messageText: msgObj.messageText,
                                date: msgObj.sendDate,
                            }]
                        }
                        messagesObject.push(messageItem)
                    }
                })
                messagesObject.forEach((msgOrder, key) => {
                    msgOrder.messages.sort((a, b) => {
                        return a.date - b.date
                    })
                })
                let activeMsg;
                //
                function getChaths (){
                    for (let i = 0; i < messagesObject.length; i++) {
                        allOrders.forEach((ord, key) => {
                            if (ord.RentId === messagesObject[i].order) {
                                let a = document.createElement('div');
                                a.classList.add('chat_list');
                                a.id = 'chat' + messagesObject[i].order;
                                let b = document.createElement('div');
                                b.classList.add('chat_people');
                                let c = document.createElement('div');
                                c.classList.add('chat_ib');
                                let d = document.createElement('h5');
                                let e = document.createElement('p');
                                e.classList.add('chat_date');
                                e.innerHTML = ord.DateOrder.replace('T',' | ');
                                d.innerHTML = ord.RentId;
                                c.appendChild(d);
                                c.appendChild(e);
                                b.appendChild(c);
                                a.appendChild(b);
                                a.addEventListener('click',(event) => {
                                    a.classList.add('active_chat');
                                    if (activeMsg !== undefined) {
                                        document.getElementById(activeMsg).classList.remove('active_chat')
                                    };
                                    activeMsg = a.id;
                                    let m = a.id.substring(4)
                                    fullMessages(m)
                                })
                                document.getElementById('inbox_chat').appendChild(a);
                            }
                        })
                    }
                };
                getChaths();

                function fullMessages(orderId) {
                    messagesObject.forEach((msgItem, key) => {
                        if (msgItem.order == orderId) {
                            let msg_history = document.getElementById('msg_history')
                            msg_history.innerHTML = ' ';
                            msgItem.messages.forEach((message, index) => {
                                let a = document.createElement('div');
                                if (message.customersMessage === true || message.customersMessage === 1) {
                                    a.classList.add('incoming_msg');
                                    let b = document.createElement('div')
                                    b.classList.add('received_msg')
                                    let c = document.createElement('div')
                                    c.classList.add('received_withd_msg')
                                    let d = document.createElement('p')
                                    d.innerHTML = message.messageText;
                                    let e = document.createElement('span')
                                    e.classList.add('time_date')
                                    e.innerHTML = message.date.substring(0, 19).replace('T', ' | ')
                                    c.appendChild(d)
                                    c.appendChild(e)
                                    b.appendChild(c)
                                    a.appendChild(b)
                                    msg_history.appendChild(a)
                                } else {
                                    a.classList.add('outgoing_msg');
                                    let b = document.createElement('div')
                                    b.classList.add('sent_msg')
                                    let c = document.createElement('p')
                                    c.innerHTML = message.messageText
                                    let d = document.createElement('span')
                                    d.classList.add('time_date')
                                    d.innerHTML = message.date.substring(0, 19).replace('T', ' | ')
                                    b.appendChild(c)
                                    b.appendChild(d)
                                    a.appendChild(b)
                                    msg_history.appendChild(a)                                }
                            })
                        }
                    })
                }

                msg_send_btn.addEventListener('click', (event) => {
                    addMessage()
                })

                write_msg.addEventListener('keyup', (event) => {
                    if (event.keyCode === 13) {
                        addMessage()
                    }
                })
                function addMessageToServer(m) {
                    fetch('https://localhost:44369/api/chatMessage/',
                        {
                            method: 'POST',
                            headers:{
                                'Content-Type': 'application/json'
                            },
                            body:JSON.stringify(m)
                        }).then((response) => {
                            return
                        })
                }
                function addMessage() {
                    if (write_msg.textLength > 0) {
                        messagesObject.forEach((msgObj, index) => {
                            if (msgObj.order == activeMsg.substring(4)) {
                                let d = new Date()
                                let da = [d.getFullYear(), d.getMonth() + 1, d.getDate()].join('-') + ' | ' +[d.getHours(), d.getMinutes(), d.getSeconds()].join(':') ;
                                msgItem = {
                                    id: null,
                                    customerId: allOrders[0].CustomId,
                                    orderId:msgObj.order,
                                    customersMessage: 1,
                                    messageText: write_msg.value.substring(0, write_msg.value.length -1),
                                }
                                addMessageToServer(msgItem)
                                msgItem.date = da
                                msgObj.messages.push(msgItem)
                                fullMessages(msgObj.order)
                                write_msg.value = ''
                            }
                        })
                    }
                }

                let orderForChath = document.getElementById('orderForChath');
                orderForChath.addEventListener('keyup', (event) => {
                    document.getElementById('inbox_chat').innerHTML = ' ';
                    allOrders.forEach((ord, index) => {                       
                        messagesObject.forEach((msgObj, index) => {
                            let a = document.getElementById('orderForChath');
                            if (msgObj.order.toString().startsWith(a.value) && msgObj.order == ord.RentId) {
                                let a = document.createElement('div');
                                a.classList.add('chat_list');
                                a.id = 'chat' + msgObj.order;
                                let b = document.createElement('div');
                                b.classList.add('chat_people');
                                let c = document.createElement('div');
                                c.classList.add('chat_ib');
                                let d = document.createElement('h5');
                                let e = document.createElement('p');
                                e.classList.add('chat_date');
                                e.innerHTML = ord.DateOrder.replace('T', ' | ');
                                d.innerHTML = ord.RentId;
                                c.appendChild(d);
                                c.appendChild(e);
                                b.appendChild(c);
                                a.appendChild(b);
                                a.addEventListener('click', (event) => {
                                    a.classList.add('active_chat');
                                    if (activeMsg !== undefined) {
                                        document.getElementById(activeMsg).classList.remove('active_chat')
                                    };
                                    activeMsg = a.id;
                                    let m = a.id.substring(4)
                                    fullMessages(m)
                                })
                                document.getElementById('inbox_chat').appendChild(a);
                            }
                        })
                    })
                })
            </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
