<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" ValidateRequest="false" Inherits="WebApplication2.Reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylesheet.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />






    <div class="container">
        <div class="row">

            <div class="col-sm-8">
                <h3 class="block-title"><span>הרשמה</span></h3>
                <div class="row">
                    <div class="col-md-12 hello-text-wrap" style="margin-top: 5px">
                        <span class="hello-text text-thin">צור את חשבונך</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-md-6 <%--hello-text-wrap--%>">
                            <span class="hello-text text-thin">שם מלא</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" placeholder="שם מלא" /></div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-6 <%--hello-text-wrap--%>">
                            <span class="hello-text text-thin">כתובת</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control" placeholder="כתובת" /></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-md-6 hello-text-wrap">
                            <span class="hello-text text-thin">מספר זהות</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtId" runat="server" CssClass="form-control" placeholder="מספר זהות" /></div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-6 hello-text-wrap">
                            <span class="hello-text text-thin">עיר</span>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="TxtCity" runat="server" CssClass="form-control"></asp:DropDownList></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">תאריך לידה</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtDateOfBirth" runat="server" TextMode="Date" CssClass="form-control" /></div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">מספר רישיון</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtLicenseNumber" runat="server" CssClass="form-control" placeholder="מספר רישיון" /></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">תאריך הנפקת רישיון</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtDateOfIssuanceLicense" runat="server" TextMode="Date" CssClass="form-control" /></div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">דרגת רישיון</span>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="DdlLicensCode" runat="server" CssClass="form-control"></asp:DropDownList></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">אימייל - שם משתמש</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="אימייל - שם משתמש" /></div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">סיסמה</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="סיסמה" /></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">אימות סיסמה</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtConfirmPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="אימות סיסמה" /></div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">טלפון</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TxtPhone" runat="server" CssClass="form-control" TextMode="Phone" placeholder="טלפון" /></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">
                        <div class="col-md-2" style="margin-top: 10px; padding-right: 10px">
                            <label>
                                <asp:CheckBox ID="checkbox1" runat="server" /></label>
                        </div>
                        <div class="col-md-10">
                            <h6 style="padding: initial; color: black; font-family: 'Roboto', sans-serif; font-size: 15px">קראתי ואני מסכים לתנאים</h6>
                        </div>
                    </div>
                    <asp:Literal ID="LtlMsg" runat="server" Text="" />
                    <div class="col-md-7">
                        <asp:Button ID="BtnReg" runat="server" Text="הרשמה" CssClass="btn btn-theme btn-block btn-theme-dark" OnClick="BtnReg_Click" />

                    </div>
                </div>
                <br />
            </div>

            <div class="col-sm-4">
                <h3 class="block-title"><span>התחברות</span></h3>
                <div class="row">
                    <div class="col-md-12 hello-text-wrap">
                        <span class="hello-text text-thin" style="margin-top: 15px">שלום, ברוך הבא לחשבונך</span>
                        <br />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">שם משתמש</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Phone" placeholder="שם משתמש - אימייל" /></div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <span class="hello-text text-thin">סיסמה</span>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password" placeholder="סיסמה" /></div>
                    </div>
                </div>

                <div>
                    <asp:LinkButton ID="LinkForget" Text="שכחתי סיסמה" OnClick="LinkForget_Click" runat="server"></asp:LinkButton>
                </div>

                <div class="col-md-12" style="padding-top: 5px;">
                    <asp:Button ID="BtnLogin" runat="server" Text="התחברות" CssClass="btn btn-block btn-theme btn-theme-dark btn-create" OnClick="BtnLogin_Click" />
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <h3 class="block-title"><span>הירשם היום ותוכל</span></h3>

                <ul class="list-check">
                    <li>לצפות בסטטוס של הזמנותיך</li>
                    <li>לצפות במבצעים החמים</li>
                    <li>רשימות מועדפים שלך</li>
                    <li>הרשמה לקבלת מבצעים ועדכונים</li>
                    <li>ביצוע הזמנות מהירות</li>
                    <li>צפיה בהיסטוריית הזמנותיך</li>
                </ul>

            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>

