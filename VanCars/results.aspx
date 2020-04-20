<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="results.aspx.cs" Inherits="WebApplication2.results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="js/index.js" type="text/javascript"></script>--%>
    <%--<script src="js/filter.min.js" type="text/javascript"></script>--%>
    <%--<script src="data/cars.js" type="text/javascript"></script>--%>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <%--<script src="js/jquery-3.4.1.js" ></script>--%>
    <link href="css/MyStyle.css" rel="stylesheet" type="text/css"  />


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

            <div class="widget shadow widget-find-car">
                <h4 class="widget-title">Find Best Rental Car</h4>
                <div class="widget-content">
                    <!-- Search form -->
                    <div class="form-search light">

                        <div class="form-group has-icon has-label">
                            <label for="formSearchUpLocation3">Picking Up Location</label>
                            <input type="text" class="form-control" id="formSearchUpLocation3" placeholder="Airport or Anywhere"/>
                            <span class="form-control-icon"><i class="fa fa-map-marker"></i></span>
                        </div>

                        <div class="form-group has-icon has-label">
                            <label for="formSearchOffLocation3">Dropping Off Location</label>
                            <input type="text" class="form-control" id="formSearchOffLocation3" placeholder="Airport or Anywhere">
                            <span class="form-control-icon"><i class="fa fa-map-marker"></i></span>
                        </div>

                        <div class="form-group has-icon has-label">
                            <label for="formSearchUpDate3">Picking Up Date</label>
                            <input type="text" class="form-control" id="formSearchUpDate3" placeholder="dd/mm/yyyy">
                            <span class="form-control-icon"><i class="fa fa-calendar"></i></span>
                        </div>

                        <div class="form-group has-icon has-label selectpicker-wrapper">
                            <label>Picking Up Hour</label>
                            <select class="selectpicker input-price" data-live-search="true" data-width="100%"
                                data-toggle="tooltip" title="Select">
                                <option>20:00 AM</option>
                                <option>21:00 AM</option>
                                <option>22:00 AM</option>
                            </select>
                            <span class="form-control-icon"><i class="fa fa-clock-o"></i></span>
                        </div>

                        <div class="form-group selectpicker-wrapper">
                            <label>Select Category</label>
                            <select class="selectpicker input-price" data-live-search="true" data-width="100%"
                                data-toggle="tooltip" title="Select">
                                <option>Select Category</option>
                                <option>Select Category</option>
                                <option>Select Category</option>
                            </select>
                        </div>

                        <div class="form-group selectpicker-wrapper">
                            <label>Select Type</label>
                            <select class="selectpicker input-price" data-live-search="true" data-width="100%"
                                data-toggle="tooltip" title="Select">
                                <option>Select Type</option>
                                <option>Select Type</option>
                                <option>Select Type</option>
                            </select>
                        </div>

                        <button type="submit" id="formSearchSubmit3" class="btn btn-submit btn-theme btn-theme-dark btn-block">Find Car</button>

                    </div>
                    <!-- /Search form -->
                </div>
            </div>

            <div class="widget shadow widget-filter-price">
                <fieldset id="rating_criteria">
                    <h4 class="widget-title">מנוע</h4>
                    <div class="widget-content">
                        <span id="rating_range_label" class="slider-label">1200 - 2000</span>
                        <div id="rating_slider" class="slider"></div>
                        <input type="hidden" id="rating_filter" value="8-10"/>
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
                    <h4 class="widget-title">שנת ייצור</h4>
                    <div class="widget-content">
                        <div class="form-group selectpicker-wrapper">
                            <select class="form-control selectpicker input-price" style="border-radius: 0px;" id="year_filter">
                                <option value="all">All (1920 - 2020)</option>
                                <option value="1920-1930">1920 - 1930</option>
                                <option value="1931-1940">1931 - 1940</option>
                                <option value="1941-1950">1941 - 1950</option>
                                <option value="1951-1960">1951 - 1960</option>
                                <option value="1961-1970">1961 - 1970</option>
                                <option value="1971-1980">1971 - 1980</option>
                                <option value="1981-1990">1981 - 1990</option>
                                <option value="1991-2000">1991 - 2000</option>
                                <option value="2001-2010">2001 - 2010</option>
                                <option value="2011-2020">2011 - 2020</option>
                            </select>
                        </div>
                    </div>
                </fieldset>
            </div>
            <br />
            <div class="well">
                <fieldset id="genre_criteria">
                    <legend>Genre</legend>
                        <label>
                            <span>All</span>
                            <input type="checkbox" value="All" id="all_genre" />                            
                        </label>                
                    <div>
                        <label>                            
                            <span>hertz</span>
                            <input type="checkbox" value="hertz" />
                        </label>
                    </div>
                    <div>
                        <label>
                            <span>albar</span>
                            <input type="checkbox" value="albar" />                            
                        </label>
                    </div>
                    <div>
                        <label>
                            <span>trifty</span>
                            <input type="checkbox" value="trifty" />
                        </label>
                    </div>
                    <div>
                        <label>
                            <span>shlomo sixst </span>
                            <input type="checkbox" value="shlomo sixst">
                        </label>
                    </div>
                    <div>
                        <label>
                            <span>Western </span>
                            <input type="checkbox" value="Western">
                        </label>
                    </div>
                    <div>
                        <label>
                            <span>Action </span>
                            <input type="checkbox" value="Action">
                        </label>
                    </div>
                    <div>
                        <label>
                            <span>Biography </span>
                            <input type="checkbox" value="Biography">
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="History">
                            <span>History </span>
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="War">
                            <span>War</span>
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="Fantasy">
                            <span>Fantasy</span>
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="Sci-Fi">
                            <span>Sci-Fi</span>
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="Mystery">
                            <span>Mystery</span>
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="Romance">
                            <span>Romance </span>
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="Family">
                            <span>Family </span>
                        </label>
                    </div>
                    <div>
                        <label>
                            <span>Horror </span>
                            <input type="checkbox" value="Horror">
                            
                        </label>
                    </div>
                    <div>
                        <label>                            
                            <span>Film-Noir</span>
                            <input type="checkbox" value="Film-Noir" checked="checked">
                        </label>
                    </div>
                    <div>
                        <label>
                            <span>Comedy</span>
                            <input type="checkbox" value="Comedy">
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="Animation">
                            <span>Animation</span>
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="Musical">
                            <span>Musical</span>
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="Music">
                            <span>Music</span>
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="Sport" />
                            <span>Sport</span>
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
        <input type="checkbox" value="<^= genre^>" /> <^= genre^>
            </label>
    </div>
    </script>  
    <script>
     

 
        function check() {
            filler = "";
            count = 0;
            var LowValEngine = document.getElementById("rating_range_label").textContent.substr(0, 4);
            var UpValEngine = document.getElementById("rating_range_label").textContent.substr(7, 4);
            var LowValPrice = document.getElementById("runtime_range_label").textContent.substr(0, 3);
            var UpValPrice = document.getElementById("runtime_range_label").textContent.substr(6, 3);
            cars.sort(function (a, b) { return a.PriceOfDay - b.PriceOfDay;})
            for (var i = 0; i < cars.length; i++) {
                if (cars[i].EngineCapacity >= LowValEngine && cars[i].EngineCapacity <= UpValEngine && cars[i].PriceOfDay >= LowValPrice && cars[i].PriceOfDay <= UpValPrice) {
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
                    filler += "<td class='buttons'><a class='btn btn-theme' href='order.aspx?Comapny=" + cars[i].Company + "&CarId=" + cars[i].CarId+"'>להשכרה</a></td>";
                    filler += "</tr></table></div></div>";
                    count++;
                }
            }
            document.getElementById("cars1").innerHTML = filler;
            document.getElementById("total_cars").innerHTML = count;
            return " " + LowValEngine + " - " + UpValEngine + " ";
        }
        function GetCompanyName(id) {
            for (var i = 0; i < companys.length ; i++) {
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
                $('#runtime_filter').val(ui.values[0] + '-' + ui.values[1]+'').trigger('change');
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




