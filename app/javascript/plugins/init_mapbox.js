import mapboxgl from 'mapbox-gl';

const addMarkerToMap = (map, marker, color) => {
  new mapboxgl.Marker({ color: `${color}`})
  .setLngLat([marker.lng, marker.lat])
  .addTo(map);
};

const fitMapToMarker = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      
      const map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v10'
      })

      const labMarkers = JSON.parse(mapElement.dataset.markers);
      console.log(labMarkers);
      const marker = {
        lat: 44.8592175,
        lng: -0.565732
      };

      labMarkers.forEach((labMarker) => {
        addMarkerToMap(map, labMarker, '#2f699b');
      });

      addMarkerToMap(map, marker, '#309C86');
      fitMapToMarker(map, marker);
  }
};

export { initMapbox };