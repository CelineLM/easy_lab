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

const initMapbox = (coordinates) => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      
      const map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v10',
          center: [1.8883335, 46.603354],
          zoom: 5
      })
 
      
      const labMarkers = JSON.parse(mapElement.dataset.markers);

      labMarkers.forEach((labMarker) => {
        addMarkerToMap(map, labMarker, '#2f699b');
      });

      // addMarkerToMap(map, coordinates, '#309C86');
      fitMapToMarker(map, labMarkers);
  }
};

export { initMapbox };