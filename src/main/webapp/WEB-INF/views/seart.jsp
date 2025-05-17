<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Seat Layout</title>
    
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/seart.css'/>">
   
</head>
<body>





		
          

   
        
        
        
        <div class="main-content">
            <div class="bus-layout">
                <!-- Driver boundary line -->
                <div class="driver-boundary"></div>
                
                <!-- Driver section -->
                <div class="driver-section">
                    <div class="steering-wheel">
                        <svg viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="25" cy="25" r="20" fill="none" stroke="#999" stroke-width="2"/>
                            <circle cx="25" cy="25" r="5" fill="#999"/>
                            <line x1="25" y1="10" x2="25" y2="20" stroke="#999" stroke-width="2"/>
                            <line x1="25" y1="30" x2="25" y2="40" stroke="#999" stroke-width="2"/>
                            <line x1="10" y1="25" x2="20" y2="25" stroke="#999" stroke-width="2"/>
                            <line x1="30" y1="25" x2="40" y2="25" stroke="#999" stroke-width="2"/>
                        </svg>
                    </div>
                </div>
                <div class="driver-divider"></div>
                
                <!-- Seats section -->
                <div class="seats-container">
                    <!-- Row 1 -->
                    <div class="seat-row">
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat female"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat unavailable"></div>
                        <div class="seat available"></div>
                    </div>
                    
                    <!-- Row 2 -->
                    <div class="seat-row">
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat female"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat unavailable"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                    </div>
                    
                    <!-- Aisle space -->
                    <div class="aisle-space"></div>
                    
                    <!-- Row 3 -->
                    <div class="seat-row">
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat unavailable"></div>
                        <div class="seat available"></div>
                    </div>
                    
                    <!-- Row 4 -->
                    <div class="seat-row">
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat unavailable"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat available"></div>
                        <div class="seat unavailable"></div>
                        <div class="seat available"></div>
                        <div class="seat unavailable"></div>
                        <div class="seat available"></div>
                    </div>
                </div>
            </div>
            
            <div class="seat-legend">
                <h2>SEAT LEGEND</h2>
                <div class="legend-item">
                    <div class="legend-seat available"></div>
                    <span>Available</span>
                </div>
                <div class="legend-item">
                    <div class="legend-seat unavailable"></div>
                    <span>Unavailable</span>
                </div>
                <div class="legend-item">
                    <div class="legend-seat female"></div>
                    <span>Female</span>
                </div>
                <div class="legend-item">
                    <div class="legend-seat male"></div>
                    <span>Male</span>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html> 
    
    
    
    
    
    