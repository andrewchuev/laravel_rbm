import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.load();

    }

    load() {

        var map = L.map('map').setView([44.759394552646555, 67.64602452645396], 13);

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

        //polygons(map);
        getPlaces(map);
    }


}

async function getPlaces(map) {
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
    marker.bindPopup(popupBody);


}

async function polygons(map) {

    /*var m = L.marker([47.838182, 35.138694], {draggable:true}).bindLabel('Фестивальная', { noHide: true })
        .addTo(map)
        .showLabel();*/


    /*const polygon = L.polygon([
        [44.758025, 67.644409],
        [44.759632, 67.644391],
        [44.759603, 67.647739],
        [44.757978, 67.647835]
    ], {fillColor: 'green', color: '#ec0a0a', fillOpacity: 0.1}).addTo(map).bindPopup('База').openPopup();*/

    /*L.polygon([
        [44.757917, 67.643573],
        [44.759600, 67.643487],
        [44.759524, 67.648176],
        [44.757886, 67.648208]
    ], {fillColor: 'red', color: '#ec0a0a', fillOpacity: 0.1}).addTo(map).bindPopup('База Буденовское').openPopup();

    L.polygon([
        [44.797394, 67.719009],
        [44.798741, 67.718913],
        [44.798749, 67.721423],
        [44.797417, 67.721541]
    ], {fillColor: 'red', color: '#ec0a0a', fillOpacity: 0.1}).addTo(map).bindPopup('Шламонакопитель 4 уч').openPopup();*/

    var points = [
        {
            id    : 1,
            latlng: [44.759394552646555, 67.64602452645396],
            'name': 'База Буденовское'
        },
        {
            id    : 2,
            latlng: [44.79817787549735, 67.72020027116405],
            'name': 'Шламонакопитель 4 уч'
        },
        {
            id    : 3,
            latlng: [44.77400200000002, 67.6569305595236],
            'name': 'Шламонакопитель 2 уч'
        },
        {
            id    : 4,
            latlng: [44.795413953907676, 67.72121936960475],
            'name': 'Водозабор 4 уч'
        },
        {
            id    : 4,
            latlng: [44.78369189817399, 67.6753224619999],
            'name': 'Водозабор 2 уч'
        },
        {
            id    : 4,
            latlng: [44.74527942919972, 67.64992590848664],
            'name': 'Водозабор 1 уч'
        },
        {
            id    : 4,
            latlng: [44.73774519388355, 67.64835301195922],
            'name': 'Шламонакопитель 1 уч'
        },
        {
            id    : 4,
            latlng: [44.737300891976844, 67.67223727593912],
            'name': 'Шламонакопитель 3 уч'
        }
    ];

    /*points.map((p) => {
        let tooltip = L.tooltip(p.latlng, {content: p.name, permanent: true}).addTo(map);
    });*/
}

