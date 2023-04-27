import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.load()
    }

    load() {

        console.log('driver map load ', Date.now());

        var driverId = document.getElementById('driver-id');

        if (!driverId.value) {
            console.log('DriverId not found');
            return false;
        }

        const request = new Request("/api/driver/" + driverId.value, {
            method : "GET",
            headers: {
                "Accept"      : "application/json",
                "Content-Type": "application/json"
            },
        });

        var map;

        fetch(request)
            .then((response) => {
                if (response.status === 200) {
                    return response.json();
                } else {
                    throw new Error("Something went wrong on API server!");
                }
            })
            .then((response) => {
                var driver = response;


                console.log(driver);
                map = L.map('driver-map').setView([driver.lat, driver.lng], 16);

                const tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    maxZoom    : 19,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                }).addTo(map);


                addMarker(driver, map).then(() => {
                    console.log('marker load')
                });

                placesLoader(map);


            })
            .catch((error) => {
                console.error(error);
            });


    }


}

async function addMarker(d, map) {
    let markerColor = 'blue';

    let icon = new L.Icon({
        iconUrl    : `https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-${markerColor}.png`,
        shadowUrl  : 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
        iconSize   : [15, 25],
        iconAnchor : [12, 25],
        popupAnchor: [1, -34],
        shadowSize : [15, 15]
    });

    let markerOptions = {
        title    : d.name,
        clickable: true,
        draggable: false,
        icon     : icon
    };

    let marker = L.marker([d.lat, d.lng], markerOptions);

    marker.addTo(map);

}

async function placesLoader(map) {
    const request = new Request("/api/places", {
        method : "GET",
        headers: {
            "Accept"      : "application/json",
            "Content-Type": "application/json"
        },
    });

    fetch(request)
        .then((response) => {
            if (response.status === 200) {
                return response.json();
            } else {
                throw new Error("Something went wrong on API server!");
            }
        })
        .then((response) => {


            response.forEach(function (place) {
                if (!isValidPlaceData(place)) {
                    return;
                }
                console.log(place);
                L.polygon([
                    place.latlng_lb.split(','),
                    place.latlng_lt.split(','),
                    place.latlng_rt.split(','),
                    place.latlng_rb.split(',')
                ], {fillColor: place.fill_color, color: place.color, fillOpacity: 0.1}).addTo(map).bindPopup(place.name + ' ' + place.area.name)

            });

        })
        .catch((error) => {
            console.error(error);
        });

}

function isValidPlaceData(p) {

    if (p.latlng_center === null || p.latlng_lb === null || p.latlng_lt === null || p.latlng_rt === null || p.latlng_rb === null) {
        return false;
    }

    return true;
}
