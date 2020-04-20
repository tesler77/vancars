    <div class="thumbnail no-border no-padding thumbnail-car-card clearfix">
        <div class="media">
            <a class="media-link" data-gal="prettyPhoto" href="data/pics/<%= picname1%>" >

                <img src="data/pics/<%= picname2%>" alt="" />
                <span class="icon-view"><strong><i class="fa fa-eye"></i></strong></span>
            </a>
        </div>
        <div class="caption">
            <div class="rating">
                <span class="star"></span>
                <!--
                -->
                    <span class="star active"></span>
                <!--
                -->
                    <span class="star active"></span>
                <!--
                -->
                    <span class="star active"></span>
                <!--
                -->
                    <span class="star active"></span>
            </div>
            <h4 class="caption-title"><%= car%></h4>
            <h5 class="caption-title-sub"><%= price%> ש"ח ליום</h5>
            <div class="caption-text">Vivamus eget nibh. Etiam cursus leo vel metus. Nulla facilisi. Aenean nec eros. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia.</div>
            <table class="table">
                <tr>
                    <td><i class="fa fa-car"></i><%= year%></td>
                    <td><i class="fa fa-dashboard"></i><%= GearBox%></td>
                    <td><i class="fa fa-cog"></i><%= EngineCapacity%></td>
                    <td><i class="fa fa-road"></i><%= CompanyId%></td>
                    <td class="buttons"><a class="btn btn-theme" href="#">להשכרה</a></td>
                </tr>
            </table>
        </div>
    </div>
