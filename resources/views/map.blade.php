<script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
<link href="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/css/ol.css" rel="stylesheet" type="text/css">
<div class="ol-popup" id="popup">
    <a class="ol-popup-closer" href="#" id="popup-closer"></a>
    <div id="popup-content"></div>
</div>
<div id="map" style="width: 100%; height: 100%;"></div>

<style>
    .ol-attribution.ol-logo-only,
    .ol-attribution.ol-uncollapsible {
        max-width: calc(100% - 3em) !important;
        height: 1.5em !important;
    }

    .ol-control button,
    .ol-attribution,
    .ol-scale-line-inner {
        font-family: 'Lucida Grande', Verdana, Geneva, Lucida, Arial, Helvetica, sans-serif !important;
    }

    .ol-popup {
        font-family: 'Lucida Grande', Verdana, Geneva, Lucida, Arial, Helvetica, sans-serif !important;
        font-size: 12px;
        position: absolute;
        background-color: white;
        -webkit-filter: drop-shadow(0 1px 4px rgba(0, 0, 0, 0.2));
        filter: drop-shadow(0 1px 4px rgba(0, 0, 0, 0.2));
        padding: 15px;
        border-radius: 10px;
        border: 1px solid #cccccc;
        bottom: 12px;
        left: -50px;
        min-width: 100px;
    }

    .ol-popup:after,
    .ol-popup:before {
        top: 100%;
        border: solid transparent;
        content: " ";
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none;
    }

    .ol-popup:after {
        border-top-color: white;
        border-width: 10px;
        left: 48px;
        margin-left: -10px;
    }

    .ol-popup:before {
        border-top-color: #cccccc;
        border-width: 11px;
        left: 48px;
        margin-left: -11px;
    }

    .ol-popup-closer {
        text-decoration: none;
        position: absolute;
        top: 2px;
        right: 8px;
    }

    .ol-popup-closer:after {
        content: "✖";
        color: #c3c3c3;
    }

</style>

<script>


    var attribution = new ol.control.Attribution({
        collapsible: false
    });

    var map = new ol.Map({
        controls: ol.control.defaults({attribution: false}).extend([attribution]),
        layers  : [
            new ol.layer.Tile({
                source: new ol.source.OSM({
                    url: 'https://a.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    //attributions: [ol.source.OSM.ATTRIBUTION, 'Tiles courtesy of <a href="https://geo6.be/">GEO-6</a>'],
                    maxZoom: 18
                })
            })
        ],
        target  : 'map',
        view    : new ol.View({
            center : ol.proj.fromLonLat([35.144769, 47.841834]),
            maxZoom: 18,
            zoom   : 11
        })
    });

    var visits = <?php echo $visits; ?>;
    console.log(visits);

    document.addEventListener("DOMContentLoaded", () => {

        features = [];
        for (let i = 0; i < visits.length; i++) {
            features[i] = new ol.Feature({
                geometry   : new ol.geom.Point(ol.proj.fromLonLat([parseFloat(visits[i].longitude), parseFloat(visits[i].latitude)])),
                description: visits[i].driver.name + "\n" + visits[i].place.name
            })
        }

        console.log(features);
        var layer = new ol.layer.Vector({
            source: new ol.source.Vector({
                features: features
            }),
            style : new ol.style.Style({
                image: new ol.style.Icon({
                    anchor      : [0.5, 0.5],
                    anchorXUnits: "fraction",
                    anchorYUnits: "fraction",
                    src         : "https://upload.wikimedia.org/wikipedia/commons/e/ec/RedDot.svg"
                })
            })
        });


        map.addLayer(layer);


        var container = document.getElementById('popup');
        var content = document.getElementById('popup-content');
        var closer = document.getElementById('popup-closer');

        var overlay = new ol.Overlay({
            element         : container,
            autoPan         : true,
            autoPanAnimation: {
                duration: 250
            }
        });
        map.addOverlay(overlay);

        closer.onclick = function () {
            overlay.setPosition(undefined);
            closer.blur();
            return false;
        };

        map.on('singleclick', function (event) {
            if (map.hasFeatureAtPixel(event.pixel) === true) {
                var coordinate = event.coordinate;

                var feature = map.forEachFeatureAtPixel(event.pixel, function (feature) {
                    return feature;
                });

                content.innerHTML = feature.get('description');
                overlay.setPosition(coordinate);
            } else {
                overlay.setPosition(undefined);
                closer.blur();
            }
        });
    });

</script>
