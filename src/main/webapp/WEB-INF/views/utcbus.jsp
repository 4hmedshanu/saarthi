<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UTC Bus - Saarthi</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/utcbus.css'/>">
    
</head>
<body>
    <div class="app-container">
        <!-- Updated header section to match the screenshot -->
        <div class="header">
            <div class="logo">Saarthi</div>
            <div class="nav-container">
                <div class="nav-item"><a href="home">Home</a></div>
                <div class="nav-item highlight"><a href="">UTC Bus</a></div>
                <div class="nav-item"><a href="">Electric Bus</a></div>
                <div class="nav-item"><a href="">My Tickets</a></div>
                
                <div class="location-dropdown">
                    <svg class="location-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12,2C8.13,2,5,5.13,5,9c0,5.25,7,13,7,13s7-7.75,7-13C19,5.13,15.87,2,12,2z M12,11.5c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5s2.5,1.12,2.5,2.5S13.38,11.5,12,11.5z" fill="#777777"/>
                    </svg>
                    <div class="location-name">Dehradun</div>
                    <svg class="arrow-icon" width="12" height="12" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7.41,8.59L12,13.17l4.59-4.58L18,10l-6,6l-6-6L7.41,8.59z" fill="#777777"/>
                    </svg>
                </div>
            </div>
        </div>
        
        <!-- REPLACED: Search box with the new format -->
        <form action="search" method="get">
        <div class="search-container">
            <div class="search-form">
                <div class="route-selection">
                    <div class="route-marker">
                        <div class="route-point hollow"></div>
                        <div class="route-line"></div>
                        <div class="route-point solid"></div>
                    </div>
                    <div class="input-fields">
                        <div class="input-group">
                            <input type="text" placeholder="Where from?">
                        </div>
                        <div class="input-group">
                            <input type="text" placeholder="Where to?">
                        </div>
                    </div>
                    <div class="swap-button">
                        <span class="swap-icon">↕</span>
                    </div>
                </div>
                <button class="search-button" type="submit">Search for bus</button>
            </div>
        </div>
        
         </form>
        <div class="recent-routes">
            <div class="route-item">
                <div class="route-dots">
                    <div class="dot-from"></div>
                    <div class="connection-line"></div>
                    <div class="dot-to"></div>
                </div>
                <div class="route-details">
                    <div class="from-location">Dehradun ISBT</div>
                    <div class="to-location">Mussoorie Mall Road</div>
                </div>
            </div>
            <div class="route-item">
                <div class="route-dots">
                    <div class="dot-from"></div>
                    <div class="connection-line"></div>
                    <div class="dot-to"></div>
                </div>
                <div class="route-details">
                    <div class="from-location">Haridwar Railway Station</div>
                    <div class="to-location">Rishikesh Bus Depot</div>
                </div>
            </div>
            <div class="route-item">
                <div class="route-dots">
                    <div class="dot-from"></div>
                    <div class="connection-line"></div>
                    <div class="dot-to"></div>
                </div>
                <div class="route-details">
                    <div class="from-location">Nainital Bus Stand</div>
                    <div class="to-location">Bhimtal Lake</div>
                </div>
            </div>
            <div class="route-item">
                <div class="route-dots">
                    <div class="dot-from"></div>
                    <div class="connection-line"></div>
                    <div class="dot-to"></div>
                </div>
                <div class="route-details">
                    <div class="from-location">Haldwani Bus Stop</div>
                    <div class="to-location">Nainital Zoo</div>
                </div>
            </div>
            <div class="route-item">
                <div class="route-dots">
                    <div class="dot-from"></div>
                    <div class="connection-line"></div>
                    <div class="dot-to"></div>
                </div>
                <div class="route-details">
                    <div class="from-location">Mussoorie Library</div>
                    <div class="to-location">Kempty Falls</div>
                </div>
            </div>
            <div class="route-item">
                <div class="route-dots">
                    <div class="dot-from"></div>
                    <div class="connection-line"></div>
                    <div class="dot-to"></div>
                </div>
                <div class="route-details">
                    <div class="from-location">Rishikesh Market</div>
                    <div class="to-location">Laxman Jhula</div>
                </div>
            </div>
            <div class="route-item">
                <div class="route-dots">
                    <div class="dot-from"></div>
                    <div class="connection-line"></div>
                    <div class="dot-to"></div>
                </div>
                <div class="route-details">
                    <div class="from-location">Almora Bus</div>
                    <div class="to-location">Kausani</div>
                </div>
            </div>
        </div>
        
        <div class="quick-payments">
            <div class="start-dot"></div>
            <div class="quick-payments-text">QUICK PAYMENTS</div>
            <div class="end-dot"></div>
        </div>
        
        <div class="buy-ticket">
            <div class="ticket-icon">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M22,10V6c0-1.11-0.9-2-2-2H4C2.9,4,2,4.89,2,6v4c1.11,0,2,0.89,2,2s-0.89,2-2,2v4c0,1.1,0.9,2,2,2h16c1.1,0,2-0.9,2-2v-4c-1.11,0-2-0.89-2-2S20.9,10,22,10z M13,17.5h-2v-2h2V17.5z M13,13h-2v-2h2V13z M13,8.5h-2v-2h2V8.5z" fill="white"/>
                </svg>
            </div>
            <div class="ticket-info">
                <div class="ticket-title">Buy mobile ticket</div>
                <div class="ticket-subtitle">Pay with wallet, UPI or cards</div>
            </div>
        </div>
        
        <div class="nearest-stop">
            <div class="section-header">
                <div class="section-title">Nearest bus stop</div>
                <div class="see-all">See all stops <span class="dot">›</span></div>
            </div>
            
            <div class="stop-info">
                <div class="stop-header">
                    <div class="stop-icon">
                        <div class="location-pin">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M12,2C8.13,2,5,5.13,5,9c0,5.25,7,13,7,13s7-7.75,7-13C19,5.13,15.87,2,12,2z M12,11.5c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5s2.5,1.12,2.5,2.5S13.38,11.5,12,11.5z" fill="#777777"/>
                            </svg>
                        </div>
                        <div class="stop-name">Dehradun Depot</div>
                    </div>
                    <div class="walk-info">
                        <svg class="walk-icon" width="14" height="14" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M13.5,5.5c1.1,0,2-0.9,2-2s-0.9-2-2-2s-2,0.9-2,2S12.4,5.5,13.5,5.5z M9.8,8.9L7,23h2.1l1.8-8l2.1,2v6h2v-7.5l-2.1-2l0.6-3C14.8,12,16.8,13,19,13v-2c-1.9,0-3.5-1-4.3-2.4l-1-1.6c-0.4-0.6-1-1-1.7-1c-0.3,0-0.5,0.1-0.8,0.1L6,8.3V13h2V9.6L9.8,8.9z" fill="#777777"/>
                        </svg>
                        <div>1 min away</div>
                    </div>
                </div>
                
                <div class="bus-list">
                    <div class="bus-item">
                        <div class="bus-icon">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M4,16c0,0.88,0.39,1.67,1,2.22V20c0,0.55,0.45,1,1,1h1c0.55,0,1-0.45,1-1v-1h8v1c0,0.55,0.45,1,1,1h1c0.55,0,1-0.45,1-1v-1.78c0.61-0.55,1-1.34,1-2.22V6c0-3.5-3.58-4-8-4S4,2.5,4,6V16z M7.5,17c-0.83,0-1.5-0.67-1.5-1.5S6.67,14,7.5,14S9,14.67,9,15.5S8.33,17,7.5,17z M16.5,17c-0.83,0-1.5-0.67-1.5-1.5s0.67-1.5,1.5-1.5s1.5,0.67,1.5,1.5S17.33,17,16.5,17z M18,11H6V6h12V11z" fill="white"/>
                            </svg>
                        </div>
                        <div class="bus-info">
                            <div class="bus-number-container">
                                <div class="bus-number">A-507</div>
                                <div class="ac-label">AC</div>
                            </div>
                            <div class="bus-destination">To Mussoorie Mall Road</div>
                        </div>
                        <div class="bus-time">
                            <div class="wifi-signal">
                                <svg class="wifi-icon" width="14" height="14" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M1,9l2,2c4.97-4.97,13.03-4.97,18,0l2-2C16.93,2.93,7.08,2.93,1,9z M9,17l3,3l3-3C13.35,15.34,10.66,15.34,9,17z M5,13l2,2c2.76-2.76,7.24-2.76,10,0l2-2C15.14,9.14,8.87,9.14,5,13z" fill="#4299E1"/>
                                </svg>
                            </div>
                            <div class="in-min">
                                In 11 min
                            </div>
                            <div class="people-icons">
                                <svg class="person-icon person-gray" width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12,12c2.21,0,4-1.79,4-4s-1.79-4-4-4S8,5.79,8,8S9.79,12,12,12z M12,14c-2.67,0-8,1.34-8,4v2h16v-2C20,15.34,14.67,14,12,14z"/>
                                </svg>
                                <svg class="person-icon person-gray" width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12,12c2.21,0,4-1.79,4-4s-1.79-4-4-4S8,5.79,8,8S9.79,12,12,12z M12,14c-2.67,0-8,1.34-8,4v2h16v-2C20,15.34,14.67,14,12,14z"/>
                                </svg>
                                <svg class="person-icon person-gray" width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12,12c2.21,0,4-1.79,4-4s-1.79-4-4-4S8,5.79,8,8S9.79,12,12,12z M12,14c-2.67,0-8,1.34-8,4v2h16v-2C20,15.34,14.67,14,12,14z"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bus-item">
                        <div class="bus-icon">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M4,16c0,0.88,0.39,1.67,1,2.22V20c0,0.55,0.45,1,1,1h1c0.55,0,1-0.45,1-1v-1h8v1c0,0.55,0.45,1,1,1h1c0.55,0,1-0.45,1-1v-1.78c0.61-0.55,1-1.34,1-2.22V6c0-3.5-3.58-4-8-4S4,2.5,4,6V16z M7.5,17c-0.83,0-1.5-0.67-1.5-1.5S6.67,14,7.5,14S9,14.67,9,15.5S8.33,17,7.5,17z M16.5,17c-0.83,0-1.5-0.67-1.5-1.5s0.67-1.5,1.5-1.5s1.5,0.67,1.5,1.5S17.33,17,16.5,17z M18,11H6V6h12V11z" fill="white"/>
                            </svg>
                        </div>
                        <div class="bus-info">
                            <div class="bus-number">313</div>
                            <div class="bus-destination">To Rishikesh Bus Depot</div>
                        </div>
                        <div class="bus-time">
                            <div class="every-min">Every 35 min</div>
                            <div class="people-icons">
                                <svg class="person-icon person-gray" width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12,12c2.21,0,4-1.79,4-4s-1.79-4-4-4S8,5.79,8,8S9.79,12,12,12z M12,14c-2.67,0-8,1.34-8,4v2h16v-2C20,15.34,14.67,14,12,14z"/>
                                </svg>
                                <svg class="person-icon person-gray" width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12,12c2.21,0,4-1.79,4-4s-1.79-4-4-4S8,5.79,8,8S9.79,12,12,12z M12,14c-2.67,0-8,1.34-8,4v2h16v-2C20,15.34,14.67,14,12,14z"/>
                                </svg>
                                <svg class="person-icon person-unavailable" width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12,12c2.21,0,4-1.79,4-4s-1.79-4-4-4S8,5.79,8,8S9.79,12,12,12z M12,14c-2.67,0-8,1.34-8,4v2h16v-2C20,15.34,14.67,14,12,14z"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="see-all-buses">
                <div class="see-all">See all buses <span class="dot">›</span></div>
            </div>
        </div>
        
        <!-- Changed arrows to dots in BUSES AROUND YOU section -->
        <div class="buses-divider">
            <div class="start-dot"></div>
            <div class="buses-divider-text">BUSES AROUND YOU</div>
            <div class="end-dot"></div>
        </div>
        
        <div class="map-container">
            <div class="map-section">
                <div class="map-frame">
                    <img class="map-image" src="https://via.placeholder.com/800x400?text=Map" alt="Bus map">
                </div>
            </div>
        </div>
        
        <div class="tickets-section">
            <div class="tickets-button">
                <svg class="tickets-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M22,10V6c0-1.11-0.9-2-2-2H4C2.9,4,2,4.89,2,6v4c1.11,0,2,0.89,2,2s-0.89,2-2,2v4c0,1.1,0.9,2,2,2h16c1.1,0,2-0.9,2-2v-4c-1.11,0-2-0.89-2-2S20.9,10,22,10z M13,17.5h-2v-2h2V17.5z M13,13h-2v-2h2V13z M13,8.5h-2v-2h2V8.5z" fill="#F57C00"/>
                </svg>
                <div class="tickets-text">My Tickets / passes</div>
            </div>
        </div>
    </div>
</body>
</html>