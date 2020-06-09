<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="VanCars.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <h3 class="block-title" style="padding-right:15px;margin-left:15px"><span>התחברות</span></h3>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4 center-block" style="max-width:ma">


            <div class="col-md-12 hello-text-wrap">
                <span class="block-title text-center center-block" style="margin-top: 15px">בכדי שתוכל להשלים את הזמנת עליך להירשם</span>
                <br />
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

        <div class="col-md-12" style="padding-top: 5px;">
            <asp:Button ID="BtnLogin" runat="server" Text="התחברות" CssClass="center-block btn btn-block btn-theme btn-theme-dark btn-create" OnClick="BtnLogin_Click" />
        </div>
        <div>
            <asp:Literal ID="LtlMsg" runat="server"></asp:Literal>
        </div>
    </div>
    <div class="col-md-4"></div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
