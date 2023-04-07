import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.load()
    }

    load() {

        var map = L.map('map').setView([47.841834, 35.144769], 11);

        const tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom    : 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);

        const request = new Request("/api/visits", {
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
                var visits = response;

                visits.forEach(function (v) {

                    addMarker(v, map).then(() => {
                        console.log('markers load')
                    });

                });

            })
            .catch((error) => {
                console.error(error);
            });
    }


}

async function addMarker(v, map) {
    let markerColor = 'blue';

    switch (v.place.id) {
        case 1:
            markerColor = 'green';
            break;
        case 2:
            markerColor = 'yellow';
            break;
        case 3:
            markerColor = 'blue';
        case 4:
            markerColor = 'red';
    }

    let icon = new L.Icon({
        iconUrl    : `https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-${markerColor}.png`,
        shadowUrl  : 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
        iconSize   : [15, 25],
        iconAnchor : [12, 25],
        popupAnchor: [1, -34],
        shadowSize : [15, 15]
    });

    let markerOptions = {
        title    : v.driver.name + ' (' + v.place.name + ')',
        clickable: true,
        draggable: false,
        icon     : icon
    };

    let marker = L.marker([v.latitude, v.longitude], markerOptions);
    //marker.title = v.driver.name;
    marker.addTo(map);
    let popupBody = `
                        <b>Last Date:</b> ${v.last_date ?? ''}<br>
                        <b>Driver Id:</b> ${v.driver.id ?? ''}<br>
                        <b>Name:</b> ${v.driver.name ?? ''}<br>
                        <b>Area:</b> ${v.driver.area_id ?? ''}<br>
                        <b>Place:</b> ${v.place.name ?? ''}<br>
                    `;
    marker.bindPopup(popupBody).openPopup();
}
