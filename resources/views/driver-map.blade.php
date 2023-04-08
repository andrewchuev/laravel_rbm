@vite('resources/js/dashboard.js')
<style>
.leaflet-container {
			height: 500px;
			width: 800px;
			max-width: 100%;
			max-height: 100%;
		}
</style>


<input type="hidden" id="driver-id" value="{{ $driver_id ?? '' }}">
<div id="driver-map" data-controller="driver-map-loader"></div>



