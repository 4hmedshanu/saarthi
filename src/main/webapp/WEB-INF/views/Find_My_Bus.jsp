<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find My Bus | SAARTHI</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/Finde_my_bus.css'/>">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="nav-bar">
        <div class="nav-container">
            <div class="logo" ><a href="home">SAARTHI</a></div>
            <div class="nav-menu">
                <div class="nav-item find-bus active">Find My Bus</div>
                <div class="nav-item"><a href="Utc">UTC Bus</a></div>
                <div class="nav-item"><a href="electric">Electric Bus</a></div>
                <div class="nav-item"><a href="mytrickets">My Tickets</a></div>
                <div class="location">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>Tanakpur</span>
                    <i class="fas fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </nav>

    <!-- Find Bus Header -->
    <div class="find-bus-header">
        <div class="find-bus-title">Find My Bus</div>
        <div class="find-bus-help"><i class="fas fa-question-circle"></i></div>
    </div>

    <!-- Main Content -->
    <div class="main-container">
        <!-- Header Bar -->
        <div class="tab-header">
            <div class="tab-option utc active">UTC BUS</div>
            <div class="tab-option electric">ELECTRIC BUS</div>
        </div>

        <!-- Search Form -->
        
        <div class="search-form">
        <form action="Find" method="get">
        
             <div class="route-selection">
				      <!-- From Station -->
				      <div class="station">
				        <div class="station-dot empty"></div>
				        <div class="station-code">HW</div>
				        <div class="station-name"><input type="text" name="from" value="Tanakpur"  required></div>
				        <div class="station-clear"><input type="reset" value="×"></div>
			  </div>
                
                <!-- Arrow path with horizontal line and direction arrow -->
                <div class="arrow-path">
                    <div class="arrow-line"></div>
                    <div class="arrow-direction"></div>
                    <div class="exchange-container">
                        <div class="swap-arrow">
                            <i class="fas fa-exchange-alt"></i>
                        </div>
                    </div>
                </div>
                
                
               <!-- To Station -->
			      <div class="station">
			        <div class="station-dot filled"></div>
			        <div class="station-code">TPU</div>
			        <div class="station-name"><input type="text" name="to" value="dharchula" required></div>
			        <div class="station-clear"><input type="reset" value="×"></div>
			      </div>
			    </div>
            
            <button class="search-btn">Find My Bus</button>
            </form>
        </div>

        <!-- Search Boxes -->
        <div class="search-boxes">
            <div class="search-box">
                <div class="bus-number">2932</div>
                <div class="bus-name">Tanakpur Dehradun AC Double</div>
                <div class="search-icon"><i class="fas fa-search"></i></div>
            </div>
            
            <div class="search-box">
                <div class="station-icon"><i class="fas fa-broadcast-tower"></i></div>
                <div class="bus-info">Bus station departure board</div>
                <div class="search-icon"><i class="fas fa-search"></i></div>
            </div>
        </div>

        <!-- Search History -->
        <div class="history-container">
            <div class="history-title">SEARCH HISTORY</div>
            
            <div class="history-item">
                <div class="item-details">
                    <span class="history-bus-number">5062</span>
                    <span class="history-bus-name">Kathgodam Special</span>
                </div>
                <div class="history-route">
                    <span class="route-text">TPU - HW</span>
                    <span class="route-arrow"><i class="fas fa-chevron-right"></i></span>
                </div>
            </div>
            
            <div class="history-item">
                <div class="item-details">
                    <span class="history-bus-number">5076</span>
                    <span class="history-bus-name">Haldwani Express</span>
                </div>
                <div class="history-route">
                    <span class="route-text">TPU - HW</span>
                    <span class="route-arrow"><i class="fas fa-chevron-right"></i></span>
                </div>
            </div>
            
            <div class="history-item">
                <div class="item-details">
                    <span class="history-bus-number">5061</span>
                    <span class="history-bus-name">Tanakpur Special</span>
                </div>
                <div class="history-route">
                    <span class="route-text">HW - TPU</span>
                    <span class="route-arrow"><i class="fas fa-chevron-right"></i></span>
                </div>
            </div>
            
            <div class="history-item">
                <div class="item-details">
                    <span class="history-bus-number">5076</span>
                    <span class="history-bus-name">Haldwani Express</span>
                </div>
                <div class="history-route">
                    <span class="route-text">TPU - HW</span>
                    <span class="route-arrow"><i class="fas fa-chevron-right"></i></span>
                </div>
            </div>
        </div>

        <!-- Bottom Navigation -->
        <div class="bottom-nav">
            <div class="bottom-nav-item">
                <i class="fas fa-search"></i>
                <a href="tracking"><p>PNR</p></a>
            </div>
            <div class="bottom-nav-item">
                <i class="fas fa-ticket-alt"></i>
                <span>TICKETS</span>
            </div>
        </div>
    </div>
     <script type="text/javascript" src="<c:url value='/js/Finde_my_bus.js'/>"></script>
     
     
     
         <script>
		    window.onload = function () {
		      // Auto-detect location when page loads
		      navigator.geolocation.getCurrentPosition(success, error);
		
		      function success(position) {
		        const lat = position.coords.latitude;
		        const lon = position.coords.longitude;
		
		        fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lon}&zoom=10`)
		          .then(res => res.json())
		          .then(data => {
		            document.getElementById("location").textContent =
		              data.address.city ||
		              data.address.town ||
		              data.address.village ||
		              data.address.county ||
		              data.address.state_district ||
		              "Unknown";
		          });
		      }
		
		      function error(err) {
		        document.getElementById("location").textContent = "Location unavailable";
		      }
		    }
  </script>
  
</body>
</html>