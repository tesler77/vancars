<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="VanCars.ForgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
        <div class="col-md-3">
            <div class="row">
                <asp:Literal ID="aaa" runat="server"></asp:Literal>
            </div>
        </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-lg-12 text-center block-title">
                            <div>
                                <br /><br />
                                
                                <asp:Literal ID="Msg2" runat="server" Text="נא הכנס את כתובת האימייל שלך"></asp:Literal><br /><br />
                            </div>
                            <div class="center-block">
                                <asp:TextBox ID="TxtForget" runat="server" CssClass="form-control center-block col-6"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <asp:Button ID="BtnForget"  runat="server" CssClass="btn-theme btn-block col-12 center-block" Text="לקבלת קוד חד פעמי" OnClick="BtnForget_Click"/>
                            </div>
                            <div class="col-12 text-center block-title">
                                <asp:Literal ID="LtlMsg" runat="server" Visible="false" Text="נא הזן את הסיסמה שקיבלת במייל"></asp:Literal>                     
                            <div class="center-block" >
                                <asp:TextBox ID="TxtTemporary" runat="server" Visible="false" CssClass="form-control"></asp:TextBox><br />
                            </div>
                             <div class="col-12">
                                 <asp:Button ID="BtnGo" runat="server" Text="המשך" CssClass="btn-theme btn-block center-block" Visible="false" OnClick="BtnGo_Click" />
                             </div>
                              <div>
                                <asp:Literal ID="LtlMsg2" runat="server" Text="נא הכנס סיסמא חדשה" Visible="false"></asp:Literal><br /><br />
                              </div>
                              <div class="center-block" >
                                  <asp:TextBox ID="pass" runat="server" placeholder="הזן סיסמה" TextMode="Password" CssClass="form-control" Visible="false"></asp:TextBox><br /><br />
                              </div>
                              <div class="center-block" >
                                  <asp:TextBox ID="pass2" runat="server" placeholder="אימות סיסמה" TextMode="Password" CssClass="form-control" Visible="false"></asp:TextBox><br />    <br />                              
                              </div>
                                <div class="col-lg-12 text-center block-title">
                                    <asp:Literal ID="Msg3" runat="server"></asp:Literal>
                                </div>
                              <div>
                                  <asp:Button ID="BtnChange" runat="server" Text="החלף סיסמה" CssClass="btn-theme btn-block center-block" Visible="false" OnClick="BtnChange_Click" /><br />
                              </div>
                          </div>
                        </div>                        
                    </div>
                </div>        
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $("#ContentPlaceHolder1_BtnForget").click(function () {
                if ($("#ContentPlaceHolder1_TxtForget").text != null) {
                    $("#text").show()
                    $("#ContentPlaceHolder1_BtnForget").hide("fast")
                }
            })
        })
    </script>
</asp:Content>
