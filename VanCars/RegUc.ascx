<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegUc.ascx.cs" Inherits="VanCars.RegUc" %>

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
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Phone" placeholder="שם משתמש - אימייל" />
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
                <span class="hello-text text-thin">סיסמה</span>
            </div>
            <div class="form-group">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password" placeholder="סיסמה" />
            </div>
        </div>
    </div>

    <div>
        <asp:LinkButton ID="LinkForget" Text="שכחתי סיסמה" OnClick="LinkForget_Click" runat="server"></asp:LinkButton>
    </div>
    <div class="col-md-12" style="padding-top: 5px;">
        <asp:Button ID="BtnLogin" runat="server" Text="התחברות" CssClass="btn btn-block btn-theme btn-theme-dark btn-create" OnClick="BtnLogin_Click" />
    </div>
    <div>
        <asp:Literal ID="LtlMsg" runat="server"></asp:Literal>
    </div>
