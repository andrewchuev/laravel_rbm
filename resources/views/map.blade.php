@vite('resources/js/dashboard.js')
<style>
.leaflet-container {
			height: 800px;
			width: 1200px;
			max-width: 100%;
			max-height: 100%;
		}
</style>


<div id="map" data-controller="drivers-map-loader"></div>

{{--<script>
    const map = L.map('map').setView([47.841834, 35.144769], 11);

    const tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom    : 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);

    var visits = <?= $visits ?>;

    visits.forEach(function (v) {
        let marker = L.marker([v.latitude, v.longitude]);
        marker.title = v.driver.name;
        marker.addTo(map);
        marker.bindPopup(v.driver.name + '<br>' + v.place.name).openPopup();
    });
</script>--}}


