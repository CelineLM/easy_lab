import { initMapbox } from './init_mapbox';

const formElement = document.getElementById('search-form');
formElement.addEventListener('submit', (event) => {
  // prevent form's default behavior
  event.preventDefault();

  // get input value
  const address = document.getElementById('address').value;
  const mapboxKey = 'pk.eyJ1IjoiY2VsaW5lbG91bSIsImEiOiJja2RhOHRtM3IwdWJzMnpwYzJ6a2lvdnVxIn0.DnyUk35OMDeVWvvGDq23Ag';
  // trigger request to Google Maps API
  fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${mapboxKey}`)
    .then(response => response.json())
    .then((data) => {
      const coordinates = {
        lng: data.features[0].geometry.coordinates[0],
        lat: data.features[0].geometry.coordinates[1]
      };
      initMapbox(coordinates);
    });
});

const initMapAlone =  () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      
      const map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v10',
          center: [ 1.8883335, 46.603354 ],
          zoom: 7
      })
  }
};

export { formElement };