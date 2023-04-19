import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.load()
    }

    load() {

        var map = L.map('map').setView([47.841834, 35.144769], 11);

        const tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom    : 19,
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);

        const request = new Request("/api/drivers", {
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
                var drivers = response;

                drivers.forEach(function (v) {

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

async function addMarker(d, map) {
    let markerColor = 'blue';

    switch (d.area_id) {
        case 1:
            markerColor = 'green';
            break;
        case 2:
            markerColor = 'yellow';
            break;
        case 3:
            markerColor = 'blue';
            break;
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
        title    : d.name + ' (' + d.place.name + ')',
        clickable: true,
        draggable: false,
        icon     : icon
    };

    //47.838182, 35.138694 Фестивальная
    let marker = L.marker([d.lat, d.lng], markerOptions);
    let from = {lat: 47.838182, lng: 35.138694};
    var to = {lat: d.lat, lng: d.lng};
    //var distance = (map.distance(from, to) / 1000).toFixed(1);


    marker.addTo(map);
    let popupBody = `
                        <b>Last Date:</b> ${d.updated_at ?? ''}<br>
                        <b>Driver Id:</b> ${d.id ?? ''}<br>
                        <b>Name:</b> ${d.name ?? ''}<br>
                        <b>Area:</b> ${d.area.name ?? ''}<br>
                        <b>Place:</b> ${d.place.name ?? ''}<br>
                    `;
    marker.bindPopup(popupBody).openPopup();
}
