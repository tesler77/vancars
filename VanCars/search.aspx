<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="WebApplication2.search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" EnablePartialRendering="true">
    <%--<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>--%>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server" />

    <style>
        .modal-backdrop {
            position: inherit;
        }

        .modal-content {
            top: 300px;
            border-top-width: 0px;
            margin-top: 0px;
            padding-bottom: 10px;
            padding-top: 20px;
            padding-right: 10px;
            padding-left: 10px;
            width: 500px;
            height: 370px;
            border-width: 5px;
            border-color: #e00;
            border-radius: 7px;
        }

        div#exampleModal {
            background-color: rgba(0,0,0,0.6);
        }

        #map {
            height: 400px; /* The height is 400 pixels */
            width: 80%; /* The width is the width of the web page */
        }
    </style>

    <div class="content-area" style="background-color: azure;">

        <!-- PAGE -->
        <br />
        <section class="page-section no-padding slider">

            <div class="container" style="z-index; -1: ">

                <div class="row">
                    <div class="col-md-6 col-sm-8 col-xs-12">
                        <br />
                        <br />
                        <br />
                        <br />
                        <h2 class="caption-subtitle">Find Your Car!<br />
                            Rent A Car Theme</h2>
                        <p class="caption-text">
                            Vivamus in est sit amet risus rutrum facilisis sed ut mauris. Aenean aliquam ex ut sem aliquet, eget vestibulum erat pharetra. Maecenas vel urna nulla. Mauris non risus pulvinar.
                        </p>
                        <p class="caption-text">
                            <a class="btn btn-theme btn-theme-md" href="#">See All Vehicles</a>
                        </p>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class=" container">
                            <div class="owl-item">
                                <div class="item slide2 ver2">
                                    <div class="caption">
                                        <div class="container">
                                            <div class="div-table">
                                                <div class="div-cell">
                                                    <div class="caption-content">
                                                        <!-- Search form -->
                                                        <div class="form-search light">
                                                            <div class="form-title">
                                                                <i class="fa fa-globe"></i>
                                                                <h2>Search for Cheap Rental Cars Wherever Your Are</h2>
                                                            </div>

                                                            <div class="row row-inputs">
                                                                <div class="container-fluid">
                                                                    <div class="col-sm-12">
                                                                        <div class="form-group has-icon has-label">
                                                                            <label for="formSearchUpLocation2">סניף קבלת הרכב</label>
                                                                            <asp:DropDownList ID="DdlPickupLocation" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                            <span class="form-control-icon"><i class="fa fa-location-arrow"></i></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-12">
                                                                        <div class="form-group has-icon has-label">
                                                                            <label for="formSearchOffLocation2">סניף החזרת רכב</label>
                                                                            <asp:DropDownList ID="DdlReturnLocation" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                            <span class="form-control-icon"><i class="fa fa-location-arrow"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row row-inputs">
                                                                <div class="container-fluid">
                                                                    <div class="col-sm-12">
                                                                        <div class="form-group has-icon has-label">
                                                                            <label for="formSearchOffDate2">טווח תאריכים</label>
                                                                            <%--<asp:TextBox runat="server" ID="ReturnDate" CssClass="form-control datepicker" placeholder="dd/mm/yyyy"></asp:TextBox>--%>
                                                                                        <input type="text" name="daterange" id="returnda" class="form-control" placeholder="mm/dd/yyyy - mm/dd/yyyy" onchange="changeDate(this.value)" />

                                                                            <asp:TextBox runat="server" ID="ReturnDate" CssClass="form-control daterangepicker" placeholder="dd/mm/yyyy"></asp:TextBox>
                                                                            <span class="form-control-icon"><i class="fa fa-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <asp:UpdatePanel ID="ModalPanel" runat="server">
                                                                <ContentTemplate>
                                                                    <div class="row row-submit">
                                                                        <div class="container-fluid">
                                                                            <div class="inner">
                                                                                <i class="fa fa-plus-circle"></i><a href="#">Advanced Search</a>
                                                                                <asp:Button ID="BtnSearch" CssClass="btn btn-theme btn-submit pull-left" runat="server" Text="חפש" OnClick="BtnSearch_Click" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <!-- /Search form -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="map">
                </div>
            </div>
            <button type="button" id="aaa" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="visibility: hidden">
            </button>

            <script>

                $('input[name="daterange"]').daterangepicker({
                    "autoApply": true,
                }, function (start, end, label) {
                    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
                });
                var pos
                var branchs
                var br
                function ShowLoginModal() {
                    $("#aaa").trigger("click");
                };
                $(document).ready(function () {
                    $("#ContentPlaceHolder1_ReturnDate").attr("placeholder", "dd/mm/yyyy")
                    getLocation();

                })

                function getLocation() {
                    if (navigator.geolocation) {
                        navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
                    } else {
                        alert("הדף הזה דורש גישה למיקום שלך");
                        if (navigation.geolocation) { }
                    }
                }

                function geoSuccess(position) {
                    pos = { "lat": position.coords.latitude, "lng": position.coords.longitude }
                    locations = [
                        { lat: pos.lat, lng: pos.lng }
                    ]

                }
                function geoError() {
                    alert("הדף הזה דורש גישה למיקום שלך")
                    if (navigation.getLocation) {
                        getLocation();
                    }
                }

                function GetBranchs() {
                    $.ajax({
                        type: "POST",
                        url: "https://localhost:44369/api/Branchs",
                        contentType: "application/json;charset=utf-8",
                        dataType: "json",
                        success: OnSuccess,
                        error: OnError

                    })
                }
                function OnSuccess(response) {
                    branchs = response
                    branchs = branchs.replace(/\\/g, '')
                    branchs = JSON.parse(branchs)
                    for (var i = 0; i < branchs.length; i++) {
                        var x = parseFloat(branchs[i].lat) - pos.lat
                        var y = parseFloat(branchs[i].lng) - pos.lng
                        var c = Math.sqrt(x * x + y * y)
                        if (c < 0) { c = c * -1 }
                        branchs[i]["distance"] = c
                    }
                    branchs.sort(function (a, b) { return parseFloat(a.distance) - parseFloat(b.distance) });
                    br = branchs

                }
                function OnError(response) {
                    alert(Response);
                }

                var map;
                function aaa() {
                    function initMap() {
                        getLocation()
                        map = new google.maps.Map(document.getElementById('map'), {
                            center: { lat: pos.lat, lng: pos.lng },
                            //center: { lat: 31.790123, lng: 34.658155 },
                            zoom: 17
                        });
                        //var marker = new google.maps.Marker({
                        //    position: { lat: pos.lat, lng: pos.lng },
                        //    map: map
                        //})
                        locations = fullLocations();
                        var labels = 'אבגדהוזחטיכלמנסעפצקרשת';
                        var markers = locations.map(function (location, i) {
                            return new google.maps.Marker({
                                position: location,
                                label: labels[i % labels.length]
                            });
                        });
                        var markerCluster = new MarkerClusterer(map, markers,
                            { imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m' });
                    }
                    initMap();
                }



                function CalculateDstance() {
                    getLocation()
                    GetBranchs()

                }
                function changeDate(newDate) {

                 document.getElementById('ContentPlaceHolder1_ReturnDate').text = newDate
                    let retDate = document.getElementById('<%= ReturnDate.ClientID %>').value = newDate
                    retDate.Text = newDate;
                }
                $(document).ready(() => { $('#returnda').val('')})
            </script>
        </section>
        <!-- /PAGE -->

    </div>

</asp:Content>
