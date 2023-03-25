<link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css">
<script src="https://openlayers.org/en/v4.6.5/build/ol.js" type="text/javascript"></script>

<script>
    /* OSM & OL example code provided by https://mediarealm.com.au/ */
    var map;
    var mapLat = 47.839382;
    var mapLng = 35.138212;

    //47.839382, 35.138212
    var mapDefaultZoom = 12;

    function initialize_map() {
        map = new ol.Map({
            target: "map",
            layers: [
                new ol.layer.Tile({
                    source: new ol.source.OSM({
                        url: "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    })
                })
            ],
            view  : new ol.View({
                center: ol.proj.fromLonLat([mapLng, mapLat]),
                zoom  : mapDefaultZoom
            })
        });
    }

    function add_map_point(lat, lng) {
        var vectorLayer = new ol.layer.Vector({
            source: new ol.source.Vector({
                features: [new ol.Feature({
                    geometry: new ol.geom.Point(ol.proj.transform([parseFloat(lng), parseFloat(lat)], 'EPSG:4326', 'EPSG:3857')),
                })]
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

        map.addLayer(vectorLayer);
    }


</script>

<?php
$points = '';
foreach ($visits as $visit) {
    if (!empty($visit['latitude']) && $visit['longitude']) {
        $points .= 'add_map_point(' . $visit['latitude'] . ', ' . $visit['longitude'] . '); ';
    }
    //echo $driver['lat'];
}
?>


<div id="map" style="width: 100%; height: 100%;"></div>

<script>

    initialize_map();
    <?php echo $points ?>

</script>
