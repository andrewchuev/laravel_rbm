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
                var map = L.map('driver-map').setView([driver.lat, driver.lng], 16);

                const tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    maxZoom    : 19,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                }).addTo(map);



                addMarker(driver, map).then(() => {
                    console.log('marker load')
                });


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
    //marker.title = d.driver.name;
    marker.addTo(map);
    /*let popupBody = `
                        <b>Last Date:</b> ${d.updated_at ?? ''}<br>
                        <b>Driver Id:</b> ${d.id ?? ''}<br>
                        <b>Name:</b> ${d.name ?? ''}<br>
                        <b>Area:</b> ${d.area.name ?? ''}<br>
                        <b>Place:</b> ${d.place.name ?? ''}<br>
                    `;
    marker.bindPopup(popupBody).openPopup();*/
}
