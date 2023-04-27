function loadPlaces(map) {
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
