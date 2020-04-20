<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ContactUs.aspx.cs" Inherits="VanCars.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-area">

        <style>
            #map{
                height:700px;
                width:80%;
                
            }
        </style>

        <!-- BREADCRUMBS -->
        <section class="page-section breadcrumbs text-center">
            <div class="container">
                <div class="page-header">
                    <h1>צור קשר</h1>
                </div>
                <ul class="breadcrumb">
                    <li><a href="#">בית</a></li>
                    <li><a href="#">דפים</a></li>
                    <li class="active">יצירת קשר</li>
                </ul>
            </div>
        </section>
        <!-- /BREADCRUMBS -->

        <!-- PAGE -->
        <section class="page-section color">
            <div class="container">

                <div class="row">

                    <div class="col-md-4">
                        <div class="contact-info">

                            <h2 class="block-title"><span>צור קשר</span></h2>

                            <div class="media-list">
                                <div class="media">
                                    <i class="pull-right fa fa-home"></i>
                                    <div class="media-body">
                                        <strong>כתובת:</strong><br>
                                        אברהם שפירא 37 אשדוד
                                    </div>
                                </div>
                                <div class="media">
                                    <i class="pull-right fa fa-phone"></i>
                                    <div class="media-body">
                                        <strong>טלפון:</strong><br>
                                        054-8497170
                                    </div>
                                </div>
                                <div class="media">
                                    <i class="pull-right fa fa-envelope-o"></i>
                                    <div class="media-body">
                                        <strong>פקס:</strong><br>
                                        05485497170
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="media-body">
                                        <strong>שרות לקוחות:</strong><br>
                                        <a href="mailto:hello@rentit.com">support@vancar.com</a>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="media-body">
                                        <strong>החזרות וזיכויים:</strong><br>
                                        <a href="mailto:hello@rentit.com">return@vancar.com</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-8 text-right">

                        <h2 class="block-title"><span>טופס יצירת קשר</span></h2>

                        <!-- Contact form -->
                      

                            <div class="outer required">
                                <div class="form-group af-inner">
                                    <label class="sr-only" for="name">שם</label>
                                    <asp:TextBox ID="TxtName" runat="server" placeholder="שם" cssclass="form-control placeholder"></asp:TextBox>
                                </div>
                            </div>

                            <div class="outer required">
                                <div class="form-group af-inner">
                                    <label class="sr-only" for="email">אמייל</label>
                                    <asp:TextBox ID="TxtEmail" runat="server" placeholder="אמייל" cssclass="form-control placeholder"></asp:TextBox>
                     
                                </div>
                            </div>

                            <div class="outer required">
                                <div class="form-group af-inner">
                                    <label class="sr-only" for="subject">נושא הפניה</label>
                                    <asp:TextBox ID="TxtSubject" runat="server" placeholder="נושא הפניה" css  class="form-control placeholder"></asp:TextBox>

                                </div>
                            </div>

                            <div class="form-group af-inner">
                                <label class="sr-only" for="input-message">פרטי הפניה</label>
                                <asp:TextBox ID="TxtMsg" runat="server" placeholder="פרטי הפניה" cssclass="form-control placeholder" Height="200px" TextMode="MultiLine"></asp:TextBox>
                     
                            </div>

                            <div class="outer required">
                                <div class="form-group">
                                    <asp:Button ID="BtnSend" runat="server" cssclass="btn btn-theme btn-block center-block" Text="שלח פניה" OnClick="BtnSend_Click"/>

                                </div>
                            </div>

                       
                        <!-- /Contact form -->

                    </div>

                </div>

            </div>
        </section>
        <!-- /PAGE -->

        <!-- PAGE -->
        <section class="page-section no-padding">
            <div class="container full-width">

                <!-- Google map -->
                <div class="center-block">
                      <div id="map" class="center-block"></div>
                    </div>
                <script>

                    
                    var map;
                    function initMap() {
                        map = new google.maps.Map(document.getElementById('map'), {
                            center: { lat: 31.790123, lng: 34.658155 },
                            zoom: 17
                        });
                        var marker = new google.maps.Marker({
                            position: { lat: 31.790123, lng: 34.658155 },
                            map: map
                        })
                    }
                </script>
                <!-- /Google map -->


            </div>
        </section>
        <!-- /PAGE -->
        <asp:Literal ID="ltlJs" runat="server"></asp:Literal>
    </div>
    <footer class="footer">
        <div class="footer-widgets">
            <div class="container">
                <div class="row">

                    <div class="col-md-3">
                        <div class="widget">
                            <h4 class="widget-title">אודותינו</h4>
                            
                            <p>אנו מתמחים בהשוואת מחירים מול כל חברות השכרת הרכבים וביצוע הזמנוצ מאובטחות  ושמירת היסטוריית הזמנות .</p>
                            <ul class="social-icons">
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" class="instagram"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="#" class="pinterest"><i class="fa fa-pinterest"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="widget">
                            <h4 class="widget-title">חדשות ומבצעים</h4>
                            <p>הירשם לקבלת עדכונים והצעות ותהיה מעודכן לפני כולם</p>
                            <form action="#">
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="הירשם וקבל זיכוי של 100  ש''ח בחשבונך" />
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-theme btn-theme-transparent">הירשם</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="widget widget-categories">
                            <h4 class="widget-title">מידע</h4>
                            <ul>
                                <li><a href="#">אודותינו Us</a></li>
                                <li><a href="#">מידע על משלוחים</a></li>
                                <li><a href="#">צור קשר</a></li>
                                <li><a href="#">תנאים והגבלות</a></li>
                                <li><a href="#">מדיניות פרטיות</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="widget widget-tag-cloud">
                            <h4 class="widget-title">תגיות</h4>
                            <ul>
                                <li><a href="#">פורד</a></li>
                                <li><a href="#">פורשה</a></li>
                                <li><a href="#">ב.מ.וו</a></li>
                                <li><a href="#">אאודי</a></li>
                                <li><a href="#">הונדה</a></li>
                                <li><a href="#">טויוטה</a></li>
                                <li><a href="#">לקסוס</a></li>
                                <li><a href="#">מיצובישי</a></li>
                                <li><a href="#">ניסן</a></li>
                                <li><a href="#">אופל</a></li>
                                <li><a href="#">רולס רויס</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </footer>
</asp:Content>
