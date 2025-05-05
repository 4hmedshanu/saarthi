<%@page import="java.util.List"%>
<%@page import="entity.searchform"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results | UTTRAKHAND PARIVAHAN</title>
     <link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>">
    <link rel="stylesheet" href="search.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Results Header with Back Button -->
    <div class="results-header">
        <div class="header-container">
            <div class="back-button">
                <i class="fas fa-arrow-left"></i>
            </div>
            <div class="header-title">Search results</div>
            <div class="header-actions">
                <div class="share-button">
                    <i class="fas fa-share-alt"></i>
                </div>
                <div class="more-button" id="moreOptionsBtn">
                    <i class="fas fa-ellipsis-v"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- More Options Menu -->
    <div class="more-options-menu" id="moreOptionsMenu">
        <div class="menu-item">Share</div>
        <div class="menu-item">Language</div>
        <div class="menu-item">UK Parivahan Info</div>
        <div class="menu-item">Report Issue</div>
        <div class="menu-item">Settings</div>
        <div class="menu-item">Rate Us</div>
    </div>

    <!-- Filter Options -->
    <div class="filter-container">
        <div class="filter-scroll">
            <div class="filter-option" id="dateFilterBtn">
                <div class="dropdown">
                    <span>All Dates</span>
                    <i class="fas fa-caret-down"></i>
                </div>
            </div>
            <div class="filter-option" id="classFilterBtn">
                <div class="dropdown">
                    <span>General</span>
                    <i class="fas fa-caret-down"></i>
                </div>
            </div>
            <div class="filter-option" id="sortFilterBtn">
                <div class="dropdown">
                    <span>Sort by</span>
                    <i class="fas fa-caret-down"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Date Filter Dropdown -->
    <div class="filter-dropdown" id="dateFilterDropdown">
        <div class="dropdown-title">Choose the date when the bus starts from Tanakpur</div>
        <div class="dropdown-options">
            <div class="dropdown-option">
                <input type="radio" id="allDates" name="dateFilter" checked>
                <label for="allDates">All Dates</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="today" name="dateFilter">
                <label for="today">Today</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="tomorrow" name="dateFilter">
                <label for="tomorrow">Tomorrow</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="calendar" name="dateFilter">
                <label for="calendar">Choose from Calendar</label>
            </div>
        </div>
        <div class="dropdown-footer">
            <button class="cancel-btn">Cancel</button>
        </div>
    </div>

    <!-- Class Filter Dropdown -->
    <div class="filter-dropdown" id="classFilterDropdown">
        <div class="dropdown-title">Choose fare class</div>
        <div class="dropdown-options">
            <div class="dropdown-option">
                <input type="radio" id="gnUnreserved" name="classFilter" checked>
                <label for="gnUnreserved">General - Unreserved</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="slSleeper" name="classFilter">
                <label for="slSleeper">Garhwali - Sleeper</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="acSleeper" name="classFilter">
                <label for="acSleeper">Kumaoni - SLEEPER AC</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="2sacSitting" name="classFilter">
                <label for="2sacSitting">Himalayan - Sitting AC</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="fcFirst" name="classFilter">
                <label for="fcFirst">Devbhoomi - First Class</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="hideFares" name="classFilter">
                <label for="hideFares">Hide fares</label>
            </div>
        </div>
        <div class="dropdown-footer">
            <button class="cancel-btn">Cancel</button>
        </div>
    </div>

    <!-- Sort Filter Dropdown -->
    <div class="filter-dropdown" id="sortFilterDropdown">
        <div class="dropdown-title">Sort by</div>
        <div class="dropdown-options">
            <div class="dropdown-option">
                <input type="radio" id="departureTime" name="sortFilter">
                <label for="departureTime">Departure time</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="duration" name="sortFilter">
                <label for="duration">Duration</label>
            </div>
            <div class="dropdown-option">
                <input type="radio" id="arrivalTime" name="sortFilter" checked>
                <label for="arrivalTime">Arrival Time</label>
            </div>
        </div>
        <div class="dropdown-footer">
            <button class="cancel-btn">Cancel</button>
        </div>
    </div>
    
    <% searchform search=(searchform) request.getAttribute("destination");
        List<searchform> se =(List<searchform>) request.getAttribute("data");        		
                		%>

    <!-- Route Display -->
    <div class="route-display">
        <div class="route-info">
            <div class="origin">
            
            <%=search.getFrom() %>
            
            </div>
            <div class="direction-arrow">
                <i class="fas fa-long-arrow-alt-right"></i>
            </div>
            <div class="destination">
            <%=search.getTo() %>
            </div>
        </div>
    </div>
    
    
    <!-- Bus List -->
    <div class="bus-list">
        <!-- Bus Item 1 -->
        <%for (searchform ele: se){
    	   %> 
    	<a href="route">
        <div class="bus-item late-running">
            <div class="bus-details">
                <div class="bus-number">UK-05062</div>
                <div class="bus-time">
                    <span class="departure">4:35 AM</span>
                    <span class="duration">— 1h45m —</span>
                    <span class="arrival">6:20 AM</span>
                </div>
                <div class="bus-fare">₹55</div>
            </div>
            <div class="bus-info">
                <div class="bus-name"><%=ele.getRoute() %></div>
            </div>
            <div class="status-message">Running late</div>
            
        </div>
        </a>
        <%} %>
</div>

 
        <!-- Bus Item 2 -->
       
    
   
</body>
</html>