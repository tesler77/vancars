<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="VanCars.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
          .modal-backdrop {
            position:absolute;
          }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .car-big-card .car-details .price strong {
            font-size: 30px;
        }
        .payments-options .panel-body {
        padding-right:25px;
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

                        <h3 class="block-title alt"><i class="fa fa-angle-down"></i>Extras & Frees</h3>
                        <form role="form" class="form-extras">

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="left">
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxl1" type="checkbox" />
                                            <label for="checkboxl1">כסא תינוק<span id="baby_seat" class="pull-left"></span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxl2" type="checkbox" />
                                            <label for="checkboxl2">כסא בוסטר לילד   <span id="boster" class="pull-left"></span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxl3" type="checkbox" />
                                            <label for="checkboxl3">מערכת ניווט <span id="nevigator" class="pull-left"></span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxl4" type="checkbox" />
                                            <label for="checkboxl4">ביטול השתתפות עצמית<span id="addition_insure" class="pull-left"></span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxl5" type="checkbox" />
                                            <label for="checkboxl5">נהג נוסף<span id="addition_driver" class="pull-left"></span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="right">
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr1" type="checkbox" checked="">
                                            <label for="checkboxr1">Ful Rent a Car Insures <span class="pull-left">Free</span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr2" type="checkbox" checked="">
                                            <label for="checkboxr2">Wheels and Glass Insures <span class="pull-left">Free</span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr3" type="checkbox" checked="">
                                            <label for="checkboxr3">Taking from Airport <span class="pull-left">Free</span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr4" type="checkbox" checked="">
                                            <label for="checkboxr4">Unlimited Kilometres for ALL cars <span class="pull-left">Free</span></label>
                                        </div>
                                        <div class="checkbox checkbox-danger">
                                            <input id="checkboxr5" type="checkbox" checked="">
                                            <label for="checkboxr5">VAT <span class="pull-left">Included</span></label>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </form>

                        <h3 class="block-title alt"><i class="fa fa-angle-down"></i>מידע אישי</h3>
                        <form action="#" class="form-delivery">
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
                                        <asp:TextBox ID="TxtOrdName" runat="server" placeholder="שם פרטי ושם משפחה*" class="form-control alt"></asp:TextBox>                                   
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtOrdEmail" runat="server" placeholder="כתובת אימייל*" class="form-control alt"></asp:TextBox>                                    
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtOrdTel" runat="server" placeholder="מספר טלפון" CssClass="form-control alt"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtOrdPhone" runat="server" placeholder="מספר נייד" CssClass="form-control alt"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <h3 class="block-title alt"><i class="fa fa-angle-down"></i>אפשרויות תשלום</h3>
                        <div class="panel-group payments-options" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel  panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapseOne">
                                            <span class="dot"></span>בחירה מכרטיס אשראי קיים
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading1">
                                    <div class="panel-body" id="creditCards" style="text-indent:50px;">
                                    </div>
                                </div>
                            </div>
                            <div class="panel radio panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" aria-controls="collapseTwo">
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
                                                            <asp:ListItem Value ="1">ויזה</asp:ListItem>
                                                            <asp:ListItem Value ="2">ישראכארד</asp:ListItem>
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

                        <h3 class="block-title alt"><i class="fa fa-angle-down"></i>Additional Information</h3>
                        <form action="#" class="form-additional">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea name="fad-message" id="fad-message" title="Addition information is required" class="form-control alt" placeholder="Additional Information" cols="30" rows="10"></textarea>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="overflowed reservation-now">
                            <div class="checkbox pull-right">
                                <input id="accept" type="checkbox" name="fd-name" title="Please accept" data-toggle="tooltip">
                                <label for="accept">I accept all information and Payments etc</label>
                            </div>
                            <asp:Button ID="BtnOrder" runat="server" OnClick="BtnOrder_Click" CssClass="btn btn-theme pull-left" Text="הזמן עכשיו" />
                        </div>

                    </div>
                    <!-- /CONTENT -->



                    <!-- SIDEBAR -->
                    <aside class="col-md-3 sidebar" id="sidebar">
                        <!-- widget detail reservation -->
                        <div class="widget shadow widget-details-reservation">
                            <h4 class="widget-title">Detail Reservation</h4>
                            <div class="widget-content">
                                <h5 class="widget-title-sub">Picking Up Location</h5>
                                <div class="media">
                                    <span class="media-object pull-right"><i class="fa fa-calendar"></i></span>
                                    <div class="media-body">
                                        <p>15 January 2015 / 08:00 am</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <span class="media-object pull-right"><i class="fa fa-location-arrow"></i></span>
                                    <div class="media-body">
                                        <p>From SkyLine AirPort</p>
                                    </div>
                                </div>
                                <h5 class="widget-title-sub">Droping Off Location</h5>
                                <div class="media">
                                    <span class="media-object pull-right"><i class="fa fa-calendar"></i></span>
                                    <div class="media-body">
                                        <p>15 January 2015 / 08:00 am</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <span class="media-object pull-right"><i class="fa fa-location-arrow"></i></span>
                                    <div class="media-body">
                                        <p>From SkyLine AirPort</p>
                                    </div>
                                </div>
                                <div class="button">
                                    <a href="#" class="btn btn-block btn-theme btn-theme-dark">Update Reservation</a>
                                </div>
                            </div>
                        </div>
                        <!-- /widget detail reservation -->
                        <!-- widget testimonials -->
                        <div class="widget shadow">
                            <div class="widget-title">Testimonials</div>
                            <div class="testimonials-carousel">
                                <div class="owl-carousel" id="testimonials">
                                    <div class="testimonial">
                                        <div class="media">
                                            <div class="media-body">
                                                <div class="testimonial-text">Vivamus eget nibh. Etiam cursus leo vel metus. Nulla facilisi. Aenean nec eros. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia.</div>
                                                <div class="testimonial-name">John Doe <span class="testimonial-position">Co- founder at Rent It</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="testimonial">
                                        <div class="media">
                                            <div class="media-body">
                                                <div class="testimonial-text">Vivamus eget nibh. Etiam cursus leo vel metus. Nulla facilisi. Aenean nec eros. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia.</div>
                                                <div class="testimonial-name">John Doe <span class="testimonial-position">Co- founder at Rent It</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="testimonial">
                                        <div class="media">
                                            <div class="media-body">
                                                <div class="testimonial-text">Vivamus eget nibh. Etiam cursus leo vel metus. Nulla facilisi. Aenean nec eros. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia.</div>
                                                <div class="testimonial-name">John Doe <span class="testimonial-position">Co- founder at Rent It</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /widget testimonials -->
                        <!-- widget helping center -->
                        <div class="widget shadow widget-helping-center">
                            <h4 class="widget-title">Helping Center</h4>
                            <div class="widget-content">
                                <p>Vivamus eget nibh. Etiam cursus leo vel metus. Nulla facilisi. Aenean nec eros.</p>
                                <h5 class="widget-title-sub">+90 555 444 66 33</h5>
                                <p><a href="mailto:support@supportcenter.com">support@supportcenter.com</a></p>
                                <div class="button">
                                    <a href="#" class="btn btn-block btn-theme btn-theme-dark">Support Center</a>
                                </div>
                            </div>
                        </div>
                        <!-- /widget helping center -->
                    </aside>
                    <!-- /SIDEBAR -->

                </div>
            </div>
        </section>
        <!-- /PAGE WITH SIDEBAR -->



    </div>
    <!-- /CONTENT AREA -->
    <script>
        var tot
        $(document).ready(function () {
            tot = temp[0].Days * temp[0].PriceOfDay
            $("#CarName").html(temp[0].CarName + " או דומה ")
            $("#GearBox").html(temp[0].GearBox)
            $("#EngineCapacity").html(" מנוע " + temp[0].EngineCapacity + " סמ''ק ")
            $("#TotPrice").html("סה''כ " + tot + " ש''ח")
            $("#day").html(" עבור " + temp[0].Days + " יום ")
            $("#Doors").html(temp[0].Doors + " דלתות")
            $("#Seats").html(temp[0].Seats + " מקמות ישיבה")
            $("#Baegs").html("מקום ל" + temp[0].Baegs + " מזוודות ")
            $("#baby_seat").html(extention[0].Price + " ש''ח ליום")
            $("#boster").html(extention[1].Price + " ש''ח ליום")
            $("#nevigator").html(extention[2].Price + " ש''ח ליום")
            $("#addition_insure").html(extention[3].Price + " ש''ח ליום")
            $("#addition_driver").html(" ש''ח ליום" + extention[4].Price)


            $("input").change(CalcChecked(extention[0].Price, temp[0].Days, "checkboxl1"))
            $("#checkboxl2").click(CalcChecked(extention[1].Price, temp[0].Days, "checkboxl2"))
            $("#checkboxl3").click(CalcChecked(extention[2].Price, temp[0].Days, "checkboxl3"))
            $("#checkboxl4").click(CalcChecked(extention[3].Price, temp[0].Days, "checkboxl4"))
            $("#checkboxl5").click(CalcChecked(extention[4].Price, temp[0].Days, "checkboxl5"))
            $("#creditCards").html(FullyCreditCards())
            

        })

        function FullyCreditCards() {
            var CardsString = "";
            for (var i = 0; i < cards.length; i++) {
                CardsString += "<input type='radio' id=" + cards[i].id + " name='crd' value=" + cards[i].id + " /><span>" + cards[i].Number + "</span><br />"                
            }
            return CardsString
        }



        function CalcChecked(PriceForDay, Days, CheckBox) {
            if ($('#' + CheckBox).is(":checked")) {
                CalcTot(PriceForDay, Days)
            }
        }

        function CalcTot(PriceForDay, Days) {
            let temp = PriceForDay * Days;
            tot = tot + temp;
            $("#TotPrice").html("סה''כ " + tot)
        }
    </script>
    <asp:Literal ID="LtlMsg1" runat="server"></asp:Literal>
    <asp:Literal Id="LtlMsg2" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Literal ID="LtlMsg" runat="server"></asp:Literal>
</asp:Content>
