<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="VanCars.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
<asp:RadioButton ID="rd1" runat="server" text="aaa" GroupName="abc" />
<asp:RadioButton ID="rd2" runat="server" text="bbb" GroupName="abc" />
<asp:RadioButton ID="rd3" runat="server" text="ccc" GroupName="abc" />
        <asp:Literal ID="LtlMsg" runat="server" Text="" />    
</asp:Content>
