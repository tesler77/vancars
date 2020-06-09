<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="VanCars.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .modal-backdrop {
            position: absolute;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .car-big-card .car-details .price strong {
            font-size: 30px;
        }

        .payments-options .panel-body {
            padding-right: 25px;
        }

        input[type=radio] {
            float: right;
            width: 20px;
            height: 20px;
            border: solid 3px #d3d3d3;
            border-radius: 10px;
            margin-left: 10px;
            color: #7f7f7f;
        }
    </style>
    <!-- CONTENT AREA -->
    <div class="content-area">

        <!-- BREADCRUMBS -->
        <section class="page-section breadcrumbs text-left">
            <div class="container">
                <div class="page-header">
                    <h1>Car Booking</h1>
                </div>
                <ul class="breadcrumb">
                    <li><a href="search.aspx">בית</a></li>
                    <li><a href="#">Pages</a></li>
                    <li class="active">הזמנה ותשלום</li>
                </ul>
            </div>
        </section>
        <!-- /BREADCRUMBS -->

        <!-- PAGE WITH SIDEBAR -->
        <section class="page-section with-sidebar sub-page">
            <div class="container">
                <div class="row">
                    <!-- CONTENT -->
                    <div class="col-md-9 content" id="content">

                        <h3 class="block-title alt"><i class="fa fa-angle-down"></i>מידע על הרכב</h3>
                        <div class="car-big-card alt">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="owl-carousel img-carousel">
                                        <div class="item">
                                            <a class="btn btn-zoom" href="data/pics/yunday_i25.png" data-gal="prettyPhoto"><i class="fa fa-arrows-h"></i></a>
                                            <a href="data/pics/yunday_i25.png" data-gal="prettyPhoto">
                                                <img class="img-responsive" src="data/pics/yunday_i25.png" alt="" /></a>
                                        </div>
                                        <div class="item">
                                            <a class="btn btn-zoom" href="data/pics/car-600x426x1.jpg" data-gal="prettyPhoto"><i class="fa fa-arrows-h"></i></a>
                                            <a href="data/pics/car-600x426x1.jpg" data-gal="prettyPhoto">
                                                <img class="img-responsive" src="data/pics/car-600x426x1.jpg" alt="" /></a>
                                        </div>
                                        <div class="item">
                                            <a class="btn btn-zoom" href="data/pics/car-600x426x1.jpg" data-gal="prettyPhoto"><i class="fa fa-arrows-h"></i></a>
                                            <a href="data/pics/car-600x426x1.jpg" data-gal="prettyPhoto">
                                                <img class="img-responsive" src="data/pics/car-600x426x1.jpg" alt="" /></a>
                                        </div>
                                        <div class="item">
                                            <a class="btn btn-zoom" href="data/pics/car-600x426x1.jpg" data-gal="prettyPhoto"><i class="fa fa-arrows-h"></i></a>
                                            <a href="data/pics/car-600x426x1.jpg" data-gal="prettyPhoto">
                                                <img class="img-responsive" src="data/pics/car-600x426x1.jpg" alt="" /></a>
                                        </div>
                                    </div>
                                    <div class="row car-thumbnails">
                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <a href="#" onclick="jQuery('.img-carousel').trigger('to.owl.carousel', [0,300]);">
                                                <img src="data/pics/car-70x70x1.jpg" alt="" /></a>
                                        </div>
                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <a href="#" onclick="jQuery('.img-carousel').trigger('to.owl.carousel', [1,300]);">
                                                <img src="data/pics/car-70x70x1.jpg" alt="" /></a>
                                        </div>
                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <a href="#" onclick="jQuery('.img-carousel').trigger('to.owl.carousel', [2,300]);">
                                                <img src="data/pics/car-70x70x1.jpg" alt="" /></a>
                                        </div>
                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <a href="#" onclick="jQuery('.img-carousel').trigger('to.owl.carousel', [3,300]);">
                                                <img src="data/pics/car-70x70x1.jpg" alt="" /></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="car-details">
                                        <div class="list">
                                            <ul>
                                                <li class="title">
                                                    <h2>
                                                        <div id="CarName"></div>
                                                        <span id="GearBox"></span></h2>
                                                </li>
                                                <li id="EngineCapacity"></li>
                                                <li>רכב חדיש</li>
                                                <li id="Seats"></li>
                                                <li id="Doors"></li>
                                                <li id="Baegs"></li>
                                            </ul>
                                        </div>
                                        <div class="price text-center">
                                            <strong id="TotPrice"></strong></br><span id="day"></span> <i class="fa fa-info-circle"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="page-divider half transparent" />

                        <h3 class="block-title alt"><i class="fa fa-angle-down"></i>הרחבת שירותים ותוספות</h3>
                        <form role="form" class="form-extras">

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="left">
                                        <asp:Repeater ID="rptExt" runat="server">
                                            <ItemTemplate>
                                                <div class="checkbox checkbox-danger">
                                                    <input id="<%# Eval("id") %>" type="checkbox" onchange="aaa(this.id)" />
                                                    <label for="<%# Eval("id") %>"><%# Eval("description") %><span class="pull-left"><%# Eval("Price") + "  ש''ח ליום" %></span></label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <%-- <div class="checkbox checkbox-danger">
                                            <input id="checkboxl1" type="checkbox" onchange="aaa(this.id)" />
                                            <label for="checkboxl1">כסא תינוק<span id="baby_seat" class="pull-left"></span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxl2" type="checkbox" onchange="aaa(this.id)" />
                                            <label for="checkboxl2">כסא בוסטר לילד   <span id="boster" class="pull-left"></span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxl3" type="checkbox" onchange="aaa(this.id)" />
                                            <label for="checkboxl3">מערכת ניווט <span id="nevigator" class="pull-left"></span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxl4" type="checkbox" onchange="aaa(this.id)" />
                                            <label for="checkboxl4">ביטול השתתפות עצמית<span id="addition_insure" class="pull-left"></span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxl5" type="checkbox" onchange="aaa(this.id)" />
                                            <label for="checkboxl5">נהג נוסף<span id="addition_driver" class="pull-left"></span></label>
                                        </div>--%>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="right">
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr1" type="checkbox" checked="">
                                            <label for="checkboxr1">ביטוח רכב <span class="pull-left">חינם </span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr2" type="checkbox" checked="">
                                            <label for="checkboxr2">ביטוח שמשות<span class="pull-left"> חינם</span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr3" type="checkbox" checked="">
                                            <label for="checkboxr3">איסוף מסניף קרוב - <span class="pull-left">חינם</span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr4" type="checkbox" checked="">
                                            <label for="checkboxr4">קילומטרים ללא הגבלה <span class="pull-left">חינם</span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr5" type="checkbox" checked="">
                                            <label for="checkboxr5">מע''מ <span class="pull-left">כלול</span></label>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </form>

                        <h3 class="block-title alt"><i class="fa fa-angle-down"></i>מידע אישי</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="radio radio-inline">
                                    <input type="radio" id="inlineRadio1" value="Mr" name="radioInline" checked="">
                                    <label for="inlineRadio1">מר</label>
                                </div>
                                <div class="radio radio-inline">
                                    <input type="radio" id="inlineRadio2" value="Ms" name="radioInline">
                                    <label for="inlineRadio2">גברת</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TxtOrdName" runat="server" class="form-control" placeholder="שם פרטי ושם משפחה*"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TxtOrdEmail" runat="server" placeholder="כתובת אימייל*" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TxtOrdTel" runat="server" placeholder="מספר טלפון" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TxtOrdPhone" runat="server" placeholder="מספר נייד" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <h3 class="block-title alt"><i class="fa fa-angle-down"></i>אפשרויות תשלום</h3>
                        <div class="panel-group payments-options" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel  panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" id="existsCard" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapseOne">
                                            <span class="dot"></span>בחירה מכרטיס אשראי קיים
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading1">
                                    <div class="panel-body" id="creditCards" style="text-indent: 50px;">
                                    </div>
                                </div>
                            </div>
                            <div class="panel radio panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" id="newCard" data-parent="#accordion" href="#collapse2" aria-expanded="false" aria-controls="collapseTwo">
                                            <span class="dot"></span>הזנת כרטיס אשראי
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2">
                                    <div class="panel-body">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="CompanyDdl" runat="server" class="form-control">
                                                            <asp:ListItem Selected="True" Value="-1">חברת אשראי</asp:ListItem>
                                                            <asp:ListItem Value="1">ויזה</asp:ListItem>
                                                            <asp:ListItem Value="2">ישראכארד</asp:ListItem>
                                                            <asp:ListItem Value="3">דיינרס</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="TxtCard" runat="server" class="form-control" placeholder="מספר אשראי"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="monthDdl" runat="server" class="form-control">
                                                            <asp:ListItem Selected="True" Value="-1">חודש</asp:ListItem>
                                                            <asp:ListItem Value="1">1  -  ינואר</asp:ListItem>
                                                            <asp:ListItem Value="2">2  - פברואר </asp:ListItem>
                                                            <asp:ListItem Value="3">3  -  מרץ</asp:ListItem>
                                                            <asp:ListItem Value="4">4  -  אפריל</asp:ListItem>
                                                            <asp:ListItem Value="5">5  -  מאי</asp:ListItem>
                                                            <asp:ListItem Value="6">6  -  יוני</asp:ListItem>
                                                            <asp:ListItem Value="7">7  -  יולי</asp:ListItem>
                                                            <asp:ListItem Value="8">8  -  אוגוסט</asp:ListItem>
                                                            <asp:ListItem Value="9">9  -  ספטמבר</asp:ListItem>
                                                            <asp:ListItem Value="10">10 - אוקטובר</asp:ListItem>
                                                            <asp:ListItem Value="11">11 - נובמבר</asp:ListItem>
                                                            <asp:ListItem Value="12">12 - דצמבר</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="YearDdl" runat="server" class="form-control">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="TxtCvv" runat="server" class="form-control" TextMode="Number" placeholder="ספרות ביטחון"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" placeholder="שם בעל הכרטיס"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="TxtId" runat="server" CssClass="form-control" placeholder="מספר זהות בעל הכרטיס"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h3 class="block-title alt"><i class="fa fa-angle-down"></i>לבקשה מיוחדת מהנציג בסניף</h3>
                        <form action="#" class="form-additional">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea name="fad-message" id="fad-message" title="Addition information is required" class="form-control alt" placeholder="בקשה מיוחדת" cols="30" rows="10"></textarea>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="overflowed reservation-now">
                            <div class="checkbox pull-right">
                                <input id="accept" type="checkbox" name="fd-name" title="Please accept" data-toggle="tooltip">
                                <label for="accept">אני מסכים לכל התנאים של החברה</label>
                            </div>
                            <asp:Button ID="BtnOrder" runat="server" OnClick="BtnOrder_Click" Height="0px" BorderWidth="0" />
                            <button type="button" id="btnOrd" class="btn btn-theme pull-left">הזמן עכשיו</button>
                            <asp:HiddenField runat="server" ID="hdnCard" Value="-1" />
                        </div>

                    </div>
                    <!-- /CONTENT -->



                    <!-- SIDEBAR -->
                    <aside class="col-md-3 sidebar" id="sidebar">
                        <!-- widget detail reservation -->
                        <div class="widget shadow widget-details-reservation">
                            <h4 class="widget-title">פרטי איסוף והחזרה</h4>
                            <div class="widget-content">
                                <h5 class="widget-title-sub">פרטי איסוף</h5>
                                <div class="media">
                                    <span class="media-object pull-right"><i class="fa fa-calendar"></i></span>
                                    <div class="media-body">
                                        <p id="fromDate"></p>
                                    </div>
                                </div>
                                <div class="media">
                                    <span class="media-object pull-right"><i class="fa fa-location-arrow"></i></span>
                                    <div class="media-body">
                                        <p id="fromBranch"></p>
                                    </div>
                                </div>
                                <h5 class="widget-title-sub">פרטי החזרה</h5>
                                <div class="media">
                                    <span class="media-object pull-right"><i class="fa fa-calendar"></i></span>
                                    <div class="media-body">
                                        <p id="toDate"></p>
                                    </div>
                                </div>
                                <div class="media">
                                    <span class="media-object pull-right"><i class="fa fa-location-arrow"></i></span>
                                    <div class="media-body">
                                        <p id="ToBranch"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /widget detail reservation -->

                        <!-- widget helping center -->
                        <div class="widget shadow widget-helping-center">
                            <h4 class="widget-title">מרכז התמיכה</h4>
                            <div class="widget-content">
                                <p>אנו עומדים לרשותכם עבור כל תקלה או בעיה במענה טלפוני 24 שעות או במייל</p>
                                <h5 class="widget-title-sub">054-849-7170</h5>
                                <p><a href="mailto:support@vancar.com">support@vancar.com</a></p>
                            </div>
                        </div>
                        <!-- /widget helping center -->
                    </aside>
                    <!-- /SIDEBAR -->

                </div>
            </div>
        </section>
        <!-- /PAGE WITH SIDEBAR -->

        <asp:Literal runat="server" ID="ltlAlert"></asp:Literal>
        <asp:HiddenField ID="ccc" runat="server" />
        <asp:HiddenField ID="hdnSelectedExt" runat="server" />
        <!-- /CONTENT AREA -->
        <script>
            var days
            var tot
            var selectedExtensions = [];
            $(document).ready(function () {
                $("#CarName").html(temp[0].CarName + " או דומה ")
                $("#GearBox").html(temp[0].GearBox)
                $("#EngineCapacity").html(" מנוע " + temp[0].EngineCapacity + " סמ''ק ")
                $("#Doors").html(temp[0].Doors + " דלתות")
                $("#Seats").html(temp[0].Seats + " מקמות ישיבה")
                $("#Baegs").html("מקום ל" + temp[0].Baegs + " מזוודות ")
                let pickDate = new Date(search.PickupDate)
                let retDate = new Date(search.ReturnDate)
                days = (retDate - pickDate) / (1000 * 60 * 60 * 24)
                $("#day").html(" עבור " + days + " יום ")
                tot = days * temp[0].PriceOfDay
                $("#TotPrice").html("סה''כ " + tot + " ש''ח")
                $("#creditCards").html(FullyCreditCards())
                $("#fromDate").html(search.PickupDate);
                $("#toDate").html(search.ReturnDate);
                getBranchData()
            })

            function FullyCreditCards() {
                var CardsString = "";
                for (var i = 0; i < cards.length; i++) {
                    CardsString += "<input type='radio' id=" + cards[i].id + " name='crd' value=" + cards[i].id + " /><span>" + cards[i].Number + "</span><br />"
                }
                return CardsString
            }

            function aaa(id) {
                extention.forEach((value, key) => {
                    if (value.id == id) {
                        CalcChecked(value.Price, days, id)
                    }
                })
            }

            function CalcChecked(PriceForDay, Days, CheckBox) {
                if ($('#' + CheckBox).is(":checked")) {
                    CalcTot(PriceForDay, Days)
                    extention.forEach((value, key) => {
                        if (value.id == CheckBox) {
                            selectedExtensions.push(value);
                        }
                    })
                } else {
                    CalcTot(-PriceForDay, Days)
                    let temp = selectedExtensions;
                    selectedExtensions = [];
                    temp.forEach((value, key) => {
                        if (value.id != CheckBox) {
                            selectedExtensions.push(value)
                        }
                    })
                }
            }

            function CalcTot(PriceForDay, Days) {
                let temp = PriceForDay * Days;
                tot = tot + temp;
                $("#TotPrice").html("סה''כ " + tot + " ש''ח")
            }


            var c;
            async function getBranchData() {
                let s = await fetch('https://localhost:44361/api/Branch/' + search.PickupLocation);
                let u = await s.json()
                c = JSON.parse(u);
                $("#fromBranch").html(c[0].BranchName + ' ' + c[0].CityName)
                if (c.length > 1) {
                    $("#ToBranch").html(c[1].BranchName + ' ' + c[1].CityName);
                }
                else {
                    $("#ToBranch").html(c[0].BranchName + ' ' + c[0].CityName);
                }
            };
            var selecteCard;
            document.getElementById('btnOrd').addEventListener('click', (event) => {
                if (document.getElementById('accept').checked == false) {
                    alert('נא אשר את התנאים')
                } else {
                    if (document.getElementById('existsCard').getAttribute('aria-expanded') == 'false' && document.getElementById('newCard').getAttribute('aria-expanded') == 'false') {
                        alert('נא הזן או בחר כרטיס אשראי');
                    } else if (document.getElementById('existsCard').getAttribute('aria-expanded') == 'true') {
                        cards.forEach((value, key) => {
                            if (document.getElementById(value.id).checked == true) {
                                selecteCard = true;
                                $('#ContentPlaceHolder1_hdnCard').val(value.id)
                            }
                        })
                        if (selecteCard == true) {
                            $("#ContentPlaceHolder1_hdnSelectedExt").val(JSON.stringify(selectedExtensions))
                            document.getElementById('ContentPlaceHolder1_BtnOrder').click();
                        } else {
                            alert('נא בחר כרטיס אשראי')
                        }

                    } else {
                        if ($('#ContentPlaceHolder1_CompanyDdl').val() == '-1' || $('#ContentPlaceHolder1_TxtCard').val == '' || $('#ContentPlaceHolder1_monthDdl').val() == '-1' || $('#ContentPlaceHolder1_YearDdl').val() == '-1' || $('#ContentPlaceHolder1_TxtCvv').val() == '' || $('#ContentPlaceHolder1_TxtName').val() == '' || $('#ContentPlaceHolder1_TxtId').val() == '') {
                            alert('נא הזן את כל השדות בכרטיס האשראי החדש')
                        } else {
                            $("#ContentPlaceHolder1_hdnSelectedExt").val(JSON.stringify(selectedExtensions))
                            document.getElementById('ContentPlaceHolder1_BtnOrder').click();
                        }
                    }
                }
            })


        </script>
        <asp:Literal ID="LtlMsg1" runat="server"></asp:Literal>
        <asp:Literal ID="LtlMsg2" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Literal ID="LtlMsg" runat="server"></asp:Literal>
</asp:Content>
