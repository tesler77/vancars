<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="OrderConfirmation.aspx.cs" Inherits="VanCars.OrderConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section color">
        <div class="container">

            <div class="row">
                <div class="col-12 text-center">
                    <img src="\data\pics\aaa.png" alt="Rent It" />
                </div>
                <div class="col-12 text-center">
                    <strong id="header"></strong>
                </div>

                <div class="col-md-4">
                    <div class="contact-info">

                        <h2 class="block-title"><span>פרטי השוכר</span></h2>

                        <div class="media-list">
                            <div class="media">
                                <i class="pull-right fa fa-user"></i>
                                <div class="media-body">
                                    <strong>שם:</strong><br />
                                    <div id="NameInServer">
                                        <asp:Literal ID="LtlName" runat="server"></asp:Literal>
                                    </div>
                                </div>
                            </div>
                            <div class="media">
                                <i class="pull-right fa fa-phone"></i>
                                <div class="media-body">
                                    <strong>טלפון:</strong><br/>
                                    <asp:Literal ID="LtlPhone" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <div class="media">
                                <i class="pull-right fa fa-envelope-o"></i>
                                <div class="media-body">
                                    <strong>אימייל:</strong><br />
                                    <asp:Literal ID="LtlEmail" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <div class="media">
                                <i class="pull-right fa fa-home"></i>
                                <div class="media-body">
                                    <strong>כתובת:</strong><br />
                                    <asp:Literal ID="LtlAddress" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <div class="media">
                                <div class="media-body">
                                    Phasellus pellentesque purus in massa aenean in pede phasellus libero ac tellus pellentesque semper.
                                </div>
                            </div>
                            <div class="media">
                                <div class="media-body">
                                    <strong>Customer Service:</strong><br />
                                    <a href="mailto:hello@rentit.com">hello@rentit.com</a>
                                </div>
                            </div>
                            <div class="media">
                                <div class="media-body">
                                    <strong>Returns and Refunds:</strong><br>
                                    <a href="mailto:hello@rentit.com">hello@rentit.com</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-8 text-right">
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
                        <div class="media">
                            <div class="media-body">
                                <strong>מספר הזמנה:
                                <div id="OrderInServer">
                                    <asp:Literal ID="LtlOrdId" runat="server"></asp:Literal>
                                </div>
                                </strong>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>




            </div>

        </div>

    </section>
    <asp:Literal ID="Order" runat="server"></asp:Literal>
    <script>
        $(document).ready(function () {
            $("#header").text('היי ' + $("#NameInServer").text() + ' הזמנתך בוצעה בהצלחה. מספר ההזמנה הוא ' + $("#OrderInServer").text())
            fullData();
        })
        var c;
        (async () => {
            let s = await fetch('https://localhost:44361/api/Branch/1');
            let u = await s.json()
            c = JSON.parse(u);
            $("#fromBranch").html(c[0].BranchName + ' ' + c[0].CityName)
            if (c.length > 1) {
                $("#ToBranch").html(c[1].BranchName + ' ' + c[1].CityName);
            }
            else {
                $("#ToBranch").html(c[0].BranchName + ' ' + c[0].CityName);
            }
        })();

        function fullData() {
            $("#fromDate").html(or.PickupDate.substring(8, 10) + '/' + or.PickupDate.substring(5, 7) + '/' + or.PickupDate.substring(0, 4))
            $("#ToDate").html(or.ReturnDate.substring(8, 10) + '/' + or.ReturnDate.substring(5, 7) + '/' + or.ReturnDate.substring(0, 4))
            $("#CarName").html(car[0].CarName)
            for (let i = 0; i < companys.length; i++) {
                if (or.Company === companys[i].CompanyId) {
                    $("#CompanyName").html(companys[i].CompanyName)
                }
            }
            $("#extId").html(a1);
            $("#inId").html(a2);
        }


    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
