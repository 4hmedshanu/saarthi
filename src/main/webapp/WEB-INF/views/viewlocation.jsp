
<%@page import="entity.stopage"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAARTHI - Train & Bus Information</title>
    <link rel="stylesheet" href="FINALPAGE.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/viewlocati.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
    google.charts.load('current', {
      'packages': ['map'],
      // Note: you will need to get a mapsApiKey for your project.
      // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
      'mapsApiKey': 'AIzaSyBopy2_ule3HjT4jvAarZjbfMA0tVS1O-c'
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
        zoomLevel: 12,
        showTooltip: true,
        showInfoWindow: true,
        useMapTypeControl: true,
        maps: {
          // Your custom mapTypeId holding custom map styles.
          styledMap: {
            name: 'Styled Map', // This name will be displayed in the map type control.
            styles: [
              {featureType: 'poi.attraction',
               stylers: [{color: '#fce8b2'}]
              },
              {featureType: 'road.highway',
               stylers: [{hue: '#0277bd'}, {saturation: -50}]
              },
              {featureType: 'road.highway',
               elementType: 'labels.icon',
               stylers: [{hue: '#000'}, {saturation: 100}, {lightness: 50}]
              },
              {featureType: 'landscape',
               stylers: [{hue: '#259b24'}, {saturation: 10}, {lightness: -22}]
              }
        ]}}
      };

      var map = new google.visualization.Map(document.getElementById('map_div'));

      map.draw(data, options);
    }
  </script>
    

</head>
<body>
    <!-- Buss Information Section -->
    <% List<stopage> stop=(List<stopage>) request.getAttribute("data");
    	String bus_title=(String) request.getAttribute("bus");
    	String Start=(String) request.getAttribute("from");
    %>
    
    <section id="train-section">
        <div class="train-details-header">
            <div class="back-nav">
                <i class="fas fa-arrow-left"></i>
            </div>
            <div class="train-title"> 
            	<%=bus_title%>
            </div>
            <div class="menu-icon" id="headerMenuIcon">
                <i class="fas fa-ellipsis-vertical"></i>
            </div>
        </div>
        <div class="action-bar">
            <div class="date-dropdown" id="dateTrigger">
                Tomorrow
                <i class="fas fa-caret-down"></i>
            </div>
            <div class="action-buttons">
                <button class="action-button">
                    <i class="fas fa-bell"></i>
                    Alarm
                </button>
                <button class="action-button">
                    <i class="fas fa-chair"></i>
                    Seats
                </button>
                <button class="action-button">
                    <i class="fas fa-share-alt"></i>
                    Share
                </button>
            </div>
            
        </div>
        
        <div id="map_div" style="height: 500px; width: 900px"></div>
        

        <div class="journey-info">
            <div class="journey-arrival">Arrival</div>
            <div class="journey-date">Day1- May 06, Tue</div>
            <div class="journey-menu" id="journeyMenuBtn">
                <i class="fas fa-ellipsis-h"></i>
            </div>
        </div>
    </section>

    <!-- Menu dropdown -->
    <div class="more-options-menu" id="moreOptionsMenu">
        <div class="menu-item">Search Stops</div>
        <div class="menu-item">Add Favorite</div>
        <div class="menu-item">View Timetable</div>
    </div>

    <!-- Divider -->
    <div class="section-divider"></div>
    
    

    <!-- Bus Route Section -->
    <section id="bus-section">
        <!-- Bus/Train route timeline -->
        <div class="bus-route-container">
            <!-- Continuous vertical line that connects all the dots -->
            <div class="timeline-track"></div>
            
            
            
            <!-- Start with train icon -->
            <div class="stop-item">
                <div class="stop-time-container">
                    <div class="stop-label">Start</div>
                    <div class="stop-time">---</div>
                </div>
                <div class="stop-timeline">
                    <div class="train-icon-circle">
                        <i class="fas fa-subway"></i>
                        <div class="train-arrow"></div>
                    </div>
                </div>
                <div class="stop-info">
                    <div class="stop-name"><%=Start%></div>
                </div>
            </div>
            
            

            <!-- Stop 1 -->
            <% 
            	int i=1;
            for(stopage ele:stop){
            	%>
            	
            <div class="stop-item">
                <div class="stop-time-container">
                    <div class="scheduled-time">8:46 AM</div>
                    <div class="actual-time">8:46 AM</div>
                </div>
                <div class="stop-timeline">
                    <div class="timeline-dot"></div>
                </div>
                <div class="stop-info">
                    <div class="stop-name"> <%=ele.getStop()%></div>
                </div>
                
       
                
            </div>
            
            
            <% i++; }  %>
            <!-- Bus information card -->
                    <div class="bus-info-card">
                        <!-- First bus -->
                        <div class="bus-route-item">
                            <div class="bus-route-info">
                                <div class="bus-icon-container">
                                    <i class="fas fa-bus"></i>
                                </div>
                                <div class="bus-number">UK28</div>
                            </div>
                            <div class="bus-arrival">
                                <i class="fas fa-wifi wifi-icon"></i>
                                <span class="arrival-time">In 21 min</span>
                            </div>
                        </div>
                        
                        <div class="bus-divider"></div>
                        
                        <!-- Second bus -->
                        <div class="bus-route-item">
                            <div class="bus-route-info">
                                <div class="bus-icon-container">
                                    <i class="fas fa-bus"></i>
                                </div>
                                <div class="bus-number">UK32</div>
                            </div>
                            <div class="bus-arrival-with-availability">
                                <div class="arrival-info">
                                    <i class="fas fa-wifi wifi-icon"></i>
                                    <span class="arrival-time">In 21 min</span>
                                </div>
                                <div class="availability-indicator">
                                    <span class="availability-dot active"></span>
                                    <span class="availability-dot"></span>
                                    <span class="availability-dot"></span>
                                    <span class="availability-text">Available</span>
                                </div>
                            </div>
                        </div>
            
             <div class="stop-info">
                    
                    <div class="actions-container">
                        <!-- Google Maps Button (Left) -->
                        <div class="maps-button">
                            <img src="https://cdnjs.cloudflare.com/ajax/libs/simple-icons/3.0.1/googlemaps.svg" alt="Google Maps" class="maps-logo">
                            <span>Maps</span>
                        </div>
                        
                        <!-- Pay Button (Middle) -->
                        <div class="pay-ticket-button">
                            Pay For Ticket
                        </div>
                        
                        <!-- Left Arrow (Right) -->
                        <div class="train-toggle-arrow" id="trainToggleArrow">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                    </div>
                </div>


    
                        <div class="stop-info">
                    
                    <div class="actions-container">
                        <!-- Google Maps Button (Left) -->
                        <div class="maps-button">
                          <a href="tracking"><p><br>Map</p></a>
                        </div>
                        
                        
                        
                        <!-- Left Arrow (Right) -->
                        <div class="train-toggle-arrow" id="trainToggleArrow">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                    </div>
                </div>
                        
                        <!-- Left Arrow (Right) -->
                        <div class="train-toggle-arrow" id="trainToggleArrow">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                    </div>
             
        
        
        <!-- Fixed Status Bar at Bottom -->
        <div class="fixed-status-bar" id="statusBarTrigger">
            <div class="train-status-message" id="statusMessage">Not started from Dehradun yet</div>
        </div>

        <!-- Train Panel (Initially Hidden) -->
        <div class="train-panel" id="trainPanel">
            <div class="close-panel-button" id="closePanelBtn">
                <i class="fas fa-times"></i>
            </div>
            <div class="train-toggle-wrapper">
                <div class="train-toggle-section">
                    <div class="train-toggle-question">Inside this bus?</div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="insideTrainToggle">
                        <span class="toggle-slider"></span>
                    </label>
                    <div class="toggle-status">Yes</div>
                </div>
                <div class="train-toggle-info">
                    Receive faster buss updates
                </div>
            </div>
        </div>
    </section>

    <!-- Date Selection Modal -->
    <div class="modal" id="dateModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>When did the train start from Dehradun?</h2>
            </div>
            <div class="modal-body">
                <div class="date-option">
                    <input type="radio" id="calendar" name="date-option">
                    <label for="calendar">Choose from Calendar</label>
                </div>
                <div class="date-option">
                    <input type="radio" id="dayBeforeYesterday" name="date-option">
                    <label for="dayBeforeYesterday">Day Before Yesterday (Sat 03)</label>
                </div>
                <div class="date-option">
                    <input type="radio" id="yesterday" name="date-option">
                    <label for="yesterday">Yesterday (Sun 04)</label>
                </div>
                <div class="date-option">
                    <input type="radio" id="today" name="date-option">
                    <label for="today">Today (Mon 05)</label>
                </div>
                <div class="date-option">
                    <input type="radio" id="tomorrow" name="date-option" checked>
                    <label for="tomorrow">Tomorrow (Tue 06)</label>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancelDateBtn">Cancel</button>
            </div>
        </div>
    </div>

    <!-- Train Status Modal -->
    <div class="modal" id="statusModal">
        <div class="status-modal-content">
            <div class="status-header">
                <div class="status-title">Not started from Dehradun yet</div>
                <div class="status-update">Updated few seconds ago</div>
                <div class="refresh-button">
                    <i class="fas fa-sync-alt"></i>
                </div>
                <!-- Add this new close button -->
                 <div class="status-close-button" id="closeStatusBtn">
                     <i class="fas fa-times"></i>
                 </div>
            </div>
            <div class="status-body">
                <div class="route-endpoints">
                    <div class="start-point">Dehradun</div>
                    <div class="end-point">Delhi</div>
                </div>
                <div class="progress-bar">
                    <div class="progress-dot active"></div>
                    <div class="progress-line"></div>
                    <div class="progress-dot"></div>
                </div>
                <div class="status-info">
                    <div class="info-column">
                        <h3>Next Stop</h3>
                        <div class="stop-name">Rishikesh</div>
                        <div class="stop-details">23km - 8:46 AM</div>
                    </div>
                    <div class="vertical-divider"></div>
                    <div class="info-column">
                        <h3>To Reach</h3>
                        <div class="stop-name">Delhi</div>
                        <div class="stop-details">235km - 10:33 AM</div>
                    </div>
                </div>
                <div class="delay-status">
                    <h3>No Delay</h3>
                </div>
                <div class="action-buttons-status">
                    <button class="status-button">
                        <i class="fas fa-comment-alt"></i>
                        Feedback
                    </button>
                    <button class="status-button">
                        <i class="fas fa-share-alt"></i>
                        Share
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Overlay -->
    <div class="modal-overlay" id="modalOverlay"></div>
    
    
    
    
</body>
</html>