import mapboxgl from 'mapbox-gl';

const addMarkersToMap = (map, marker, color) => {
  const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
  new mapboxgl.Marker({ color: `${color}`})
  .setLngLat([marker.lng, marker.lat])
  .setPopup(popup)
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

      const allMarkers = JSON.parse(mapElement.dataset.markers);

      allMarkers.slice(0, -1).forEach((labMarker) => {
        addMarkersToMap(map, labMarker, '#2f699b');
      });

      const searchMarker = allMarkers.slice(-1)[0];
      addMarkersToMap(map, searchMarker, '#309C86');

      fitMapToMarker(map, allMarkers);
  }
};

export { initMapbox };