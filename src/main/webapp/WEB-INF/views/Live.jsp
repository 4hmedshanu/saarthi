<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <title>Map Page</title>
  
  <style>
    .login-wrapper {
      width: 100%;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #fff5e6;
      padding: 20px;
      flex-direction: column;
    }

    .login-box {
      background: white;
      padding: 40px 30px;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      width: 100%;
      max-width: 400px;
      margin-bottom: 20px;
    }

    .login-box h2 {
      margin-bottom: 25px;
      color: #f57c00;
      font-size: 24px;
      text-align: center;
      font-weight: 700;
    }

    .login-box input {
      width: 100%;
      padding: 12px 15px;
      margin: 10px 0;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 15px;
    }

    .login-box button {
      width: 100%;
      padding: 12px;
      background-color: #f57c00;
      color: white;
      border: none;
      border-radius: 25px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s;
      margin-top: 15px;
    }

    .login-box button:hover {
      background-color: #e65100;
      transform: translateY(-1px);
    }

    .login-box .link {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
    }

    .login-box .link a {
      color: #f57c00;
      font-weight: 600;
    }

    .map-container {
      width: 100%;
      max-width: 800px;
      height: 400px;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }

    iframe {
      width: 100%;
      height: 100%;
      border: 0;
    }
    
    
    .map-container {
    padding: 0 20px;
    margin-bottom: 20px;
}

.map-section {
    background-color: #fff;
    border-radius: 15px;
    padding: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.map-frame {
    width: 100%;
    height: 200px;
    border-radius: 15px;
    overflow: hidden;
}

.map-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
    
  </style>
  
  
   <script type="text/javascript">
  google.charts.load('current', {
    'packages': ['map'],
    'mapsApiKey': 'AIzaSyBopy2_ule3HjT4jvAarZjbfMA0tVS1O-c' // Replace with your actual API key
  });

  google.charts.setOnLoadCallback(drawMap);

  function drawMap () {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Address');
    data.addColumn('string', 'Location');
    
    data.addRows([
    	  ['Almora, Uttarakhand, India', 'Almora'],
    	  ['Bageshwar, Uttarakhand, India', 'Bageshwar'],
    	  ['Champawat, Uttarakhand, India', 'Champawat'],
    	]);

    var options = {
      mapType: 'styledMap',
      zoomLevel: 7,
      showTooltip: true,
      showInfoWindow: true,
      useMapTypeControl: true,
      maps: {
        styledMap: {
          name: 'Styled Map',
          styles: [
            {featureType: 'poi.attraction', stylers: [{color: '#fce8b2'}]},
            {featureType: 'road.highway', stylers: [{hue: '#0277bd'}, {saturation: -50}]},
            {featureType: 'road.highway', elementType: 'labels.icon', stylers: [{hue: '#000'}, {saturation: 100}, {lightness: 50}]},
            {featureType: 'landscape', stylers: [{hue: '#259b24'}, {saturation: 10}, {lightness: -22}]}
          ]
        }
      }
    };

    var map = new google.visualization.Map(document.getElementById('map_div'));
    map.draw(data, options);
  }
</script>
  
</head>
<body>
  <div class="login-wrapper">
    <div class="login-box">
      <h2>Enter a pnr number</h2>
      <input type="text" placeholder=" Bus pnr Number">
      <button>Track</button>
      <div class="link">
        <a href="#">Need help?</a>
      </div>
    </div>

    <!-- Map Section -->
    <div class="map-container" style="height: 500px;">
    
    			<div class="map-section" style="height: 500px;">
                <div class="map-frame" style="height: 500px;" id="map_div"> 
                    <!-- Map -->
                </div>
            </div>
    </div>
    
  </div>
</body>
</html>
