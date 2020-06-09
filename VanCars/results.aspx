<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="results.aspx.cs" Inherits="WebApplication2.results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="js/index.js" type="text/javascript"></script>--%>
    <%--<script src="js/filter.min.js" type="text/javascript"></script>--%>
    <%--<script src="data/cars.js" type="text/javascript"></script>--%>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <%--<script src="js/jquery-3.4.1.js" ></script>--%>
    <link href="css/MyStyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server" />
    <div class="content-area">
        <br />
        <br />
        <br />
        <br />
        <br />
        <section class="page-section no-padding slider">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <br />
                        <div class="cars content row car-listing" id="cars1"></div>
                    </div>

                    <div class="sidebar col-md-3">

                        <h4>רכבים (<span id="total_cars"></span>)</h4>



                        <div class="widget shadow widget-filter-price">
                            <fieldset id="rating_criteria">
                                <h4 class="widget-title">מנוע</h4>
                                <div class="widget-content">
                                    <span id="rating_range_label" class="slider-label">1200 - 2000</span>
                                    <div id="rating_slider" class="slider"></div>
                                    <input type="hidden" id="rating_filter" value="8-10" />
                                </div>
                            </fieldset>
                        </div>
                        <br />
                        <div class="widget shadow widget-filter-price">
                            <fieldset id="runtime_criteria">
                                <h4 class="widget-title">מחיר ליום</h4>
                                <div class="widget-content">
                                    <span id="runtime_range_label" class="slider-label">100 - 350</span>
                                    <div id="runtime_slider" class="slider"></div>
                                    <input type="hidden" id="runtime_filter" value="100-350">
                                </div>
                            </fieldset>
                        </div>
                        <div class="widget shadow widget-filter-price">
                            <fieldset id="year_criteria">
                                <h4 class="widget-title">תיבת הילוכים</h4>
                                <div class="widget-content">
                                    <div class="form-group selectpicker-wrapper">
                                        <%--<select class="form-control selectpicker input-price" style="border-radius: 0px;" id="year_filter">--%>
                                        <select class="form-control  input-price" style="border-radius: 0px;" id="year_filter">
                                            <option value="1">בחר סוג הילוכים</option>
                                            <option value="אוטומטי">אוטומטי</option>
                                            <option value="ידני">ידני</option>
                                        </select>
                                    </div>
                                </div>
                            </fieldset>
                        </div>


                        <div class="widget shadow widget-filter-price">
                            <h4 class="widget-title">פרטי החיפוש</h4>
                            <div class="widget-content">
                                <div class="col-sm-12">
                                    <div class="form-group has-icon has-label">
                                        <label for="formSearchUpLocation2">סניף קבלת הרכב</label>
                                        <asp:DropDownList ID="DdlPickupLocation" runat="server" CssClass="form-control input-price" Style="border-radius: 0px;"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group has-icon has-label">
                                        <label for="formSearchUpLocation2">סניף החזרת הרכב</label>
                                        <asp:DropDownList ID="DdlReturnLocation" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row row-inputs">
                                    <div class="container-fluid">
                                        <div class="col-sm-12">
                                            <div class="form-group has-icon has-label">
                                                <label for="formSearchOffDate2">טווח תאריכים</label>
                                                <input type="text" name="daterange" id="returnda" class="form-control" style="padding-left: 0px" placeholder="mm/dd/yyyy - mm/dd/yyyy" onmouseover="changeDate(this.value)" />

                                                <asp:TextBox runat="server" ID="ReturnDate" CssClass="form-control daterangepicker" placeholder="dd/mm/yyyy"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row row-submit">
                                    <div class="container-fluid">
                                        <div class="col-md-12">
                                            <div class="inner">
                                                <asp:Button ID="BtnSearch" CssClass="btn btn-theme btn-block btn-theme-dark" Style="max-width: 658px;" runat="server" Text="חפש" OnClick="BtnSearch_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <br />
                        <div class="well">
                            <fieldset id="genre_criteria">
                                <legend>Genre</legend>
                                <label>
                                    <span>All</span>
                                    <input type="checkbox" value="All" id="all_genre" onchange="check()" checked="checked"/>
                                </label>
                                <div>
                                    <label>
                                        <span>hertz</span>
                                        <input type="checkbox" id="hertz" value="3" onchange="check()" />
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <span>albar</span>
                                        <input type="checkbox" id="albar" value="4" onchange="check()" />
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <span>trifty</span>
                                        <input type="checkbox" id="trifty" value="trifty" />
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <span>shlomo sixst </span>
                                        <input type="checkbox" id="shlomo_sixst"value="shlomo sixst">
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <span>Western </span>
                                        <input type="checkbox" id="Western" value="Western">
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <span>Action </span>
                                        <input type="checkbox" id="Action" value="Action">
                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <span>Biography </span>
                                        <input type="checkbox" id="Biography" value="Biography"/>
                                    </label>
                                </div>
                            </fieldset>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>
    <asp:Literal ID="LtlMsg" runat="server"></asp:Literal>
    <script id="genre_template" type="text/html">
        <div class="checkbox">
            <label>
                <input type="checkbox" value="<^= genre^>" />
                <^= genre^>
            </label>
        </div>
    </script>
    <script>

        $('input[name="daterange"]').daterangepicker({
            "autoApply": true,
        }, function (start, end, label) {
            console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
        });
        function changeDate(newDate) {

            document.getElementById('ContentPlaceHolder1_ReturnDate').text = newDate
            let retDate = document.getElementById('<%= ReturnDate.ClientID %>').value = newDate
            retDate.Text = newDate;
        }
        $(document).ready(() => {
            let retDate = document.getElementById('<%= ReturnDate.ClientID %>').value
            $("#returnda").val(retDate);
        })

        let year_filter = document.getElementById('year_filter');
        year_filter.addEventListener('click', (event) => { check() });
        function check() {
            filler = "";
            count = 0;
            var LowValEngine = document.getElementById("rating_range_label").textContent.substr(0, 4);
            var UpValEngine = document.getElementById("rating_range_label").textContent.substr(7, 4);
            var LowValPrice = document.getElementById("runtime_range_label").textContent.substr(0, 3);
            var UpValPrice = document.getElementById("runtime_range_label").textContent.substr(6, 3);
            let selectedYear = year_filter.options[year_filter.selectedIndex].value;
            cars.sort(function (a, b) { return a.PriceOfDay - b.PriceOfDay; })
            for (var i = 0; i < cars.length; i++) {
                if (cars[i].EngineCapacity >= LowValEngine && cars[i].EngineCapacity <= UpValEngine && cars[i].PriceOfDay >= LowValPrice && cars[i].PriceOfDay <= UpValPrice && (selectedYear == '1' || cars[i].GearBox == selectedYear)) {
                    if (document.getElementById('all_genre').checked == true) {
                        filler += "<div class='thumbnail no-border no-padding thumbnail-car-card clearfix' id=" + cars[i].id + ">";
                        filler += "<div class='media'>";
                        filler += "<a class='media-link' data-gal='prettyPhoto' href='data/pics/" + cars[i].PicName + "'style='height:130px; width:250px'>";
                        filler += "<img src='data/pics/" + cars[i].PicName + "' alt='' style='height:130px; width:250px''/>";
                        filler += "<span class='icon-view'><strong><i class='fa fa-eye'></i></strong></span></a></div><div class='caption'><div class='rating'>";
                        filler += "<span class='star'></span><span class='star active'></span><span class='star active'></span><span class='star active'></span><span class='star active'></span></div>";
                        filler += "<h4 class='caption-title'>" + cars[i].CarName + "</h4>";
                        filler += "<h5 class='caption-title-sub'>" + cars[i].PriceOfDay + "ש''ח ליום </h5>";
                        filler += "<div class'caption-text'>aaaaadsaffffffffffffffffffffffffffffffffffffffffffffffff dfffffffffffffgdfgdfgdfgfdgdfgfffffffffffffffffffaaaaa</div>";
                        filler += "<table class='table'><tr>";
                        filler += "<td><i class='fa fa-car'></i>" + cars[i].year + "</td>";
                        filler += "<td><i class='fa fa-dashboard'></i>" + cars[i].GearBox + "</td>";
                        filler += "<td><i class='fa fa-cog'></i>" + cars[i].EngineCapacity + "</td>";
                        filler += "<td><i class='fa fa-road'></i>" + GetCompanyName(cars[i].Company) + "</td>";
                        filler += "<td class='buttons'><a class='btn btn-theme' href='order.aspx?Comapny=" + cars[i].Company + "&CarId=" + cars[i].CarId + "'>להשכרה</a></td>";
                        filler += "</tr></table></div></div>";
                        count++;
                    } else {
                        for (let j = 0; j < companyChckbox.length;j++) {
                            if (document.getElementById(companyChckbox[j]).checked == true && cars[i].Company == document.getElementById(companyChckbox[j]).value) {
                                filler += "<div class='thumbnail no-border no-padding thumbnail-car-card clearfix' id=" + cars[i].id + ">";
                                filler += "<div class='media'>";
                                filler += "<a class='media-link' data-gal='prettyPhoto' href='data/pics/" + cars[i].PicName + "'style='height:130px; width:250px'>";
                                filler += "<img src='data/pics/" + cars[i].PicName + "' alt='' style='height:130px; width:250px''/>";
                                filler += "<span class='icon-view'><strong><i class='fa fa-eye'></i></strong></span></a></div><div class='caption'><div class='rating'>";
                                filler += "<span class='star'></span><span class='star active'></span><span class='star active'></span><span class='star active'></span><span class='star active'></span></div>";
                                filler += "<h4 class='caption-title'>" + cars[i].CarName + "</h4>";
                                filler += "<h5 class='caption-title-sub'>" + cars[i].PriceOfDay + "ש''ח ליום </h5>";
                                filler += "<div class'caption-text'>aaaaadsaffffffffffffffffffffffffffffffffffffffffffffffff dfffffffffffffgdfgdfgdfgfdgdfgfffffffffffffffffffaaaaa</div>";
                                filler += "<table class='table'><tr>";
                                filler += "<td><i class='fa fa-car'></i>" + cars[i].year + "</td>";
                                filler += "<td><i class='fa fa-dashboard'></i>" + cars[i].GearBox + "</td>";
                                filler += "<td><i class='fa fa-cog'></i>" + cars[i].EngineCapacity + "</td>";
                                filler += "<td><i class='fa fa-road'></i>" + GetCompanyName(cars[i].Company) + "</td>";
                                filler += "<td class='buttons'><a class='btn btn-theme' href='order.aspx?Comapny=" + cars[i].Company + "&CarId=" + cars[i].CarId + "'>להשכרה</a></td>";
                                filler += "</tr></table></div></div>";
                                count++;
                            }
                        }
                    }

                }
            }
            document.getElementById("cars1").innerHTML = filler;
            document.getElementById("total_cars").innerHTML = count;
            return " " + LowValEngine + " - " + UpValEngine + " ";
        }

        let companyChckbox = ['all_genre', 'hertz', 'albar', 'trifty', 'shlomo_sixst', 'Western', 'Action', 'Biography'];

        function GetCompanyName(id) {
            for (var i = 0; i < companys.length; i++) {
                if (companys[i].CompanyId == id) {
                    return companys[i].CompanyName
                }
            }
            return "כללי"
        }

        $("#rating_slider").slider({
            min: 1200,
            max: 2000,
            values: [1200, 2000],
            step: 100,
            range: true,
            slide: function (event, ui) {
                $("#rating_range_label").html(ui.values[0] + ' - ' + ui.values[1]);
                $('#rating_filter').val(ui.values[0] + '-' + ui.values[1]).trigger('change');
                check();
            }
        });
        $("#runtime_slider").slider({
            min: 100,
            max: 350,
            values: [100, 350],
            step: 1,
            range: true,
            slide: function (event, ui) {
                $("#runtime_range_label").html(ui.values[0] + ' - ' + ui.values[1] + ' ');
                $('#runtime_filter').val(ui.values[0] + '-' + ui.values[1] + '').trigger('change');
                check();

            }
        });

        $("#rating_range_label").on("change", function () { check() });
        //document.getElementById(rating_slider).onchange(check());
        $("#rating_criteria").click(check());



        $('#genre_criteria :checkbox').prop('checked', true);
        $('#all_genre').on('click', function () {
            $('#genre_criteria :checkbox').prop('checked', $(this).is(':checked'));
            check();
        });

    </script>


</asp:Content>




