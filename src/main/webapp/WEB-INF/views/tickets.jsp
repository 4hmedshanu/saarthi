<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAARTHI - My Tickets</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/trickets.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <!-- Navigation Bar -->
    <header class="navbar">
        <div class="container">
            <div class="logo">
                <h1>SAARTHI</h1>
            </div>
            <div class="nav-location-wrapper">
                <nav>
                    <ul class="nav-links">
                        <li><a href="home">Home</a></li>
                        <li><a href="Utc">UTC Bus</a></li>
                        <li><a href="electric">Electric Bus</a></li>
                        <li><a href="mytrickets" class="active">My Tickets</a></li>
                        <li><a href="#">findRoute</a></li>
                    </ul>
                </nav>
                <div class="location">
                    <i class="fas fa-map-marker-alt location-icon"></i>
                    <span>Dehradun</span>
                    <i class="fas fa-chevron-right location-arrow"></i>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container">
        <section class="tickets-section">
            <div class="tickets-header">
                <h2>My tickets / passes</h2>
                <button class="faq-btn"><i class="fas fa-question-circle"></i> FAQ</button>
            </div>
            
            <div class="ticket-tabs">
                <button class="tab-btn active" data-tab="active">Active</button>
                <button class="tab-btn" data-tab="history">History</button>
            </div>
            
            <div class="tabs-container">
                <!-- Active Tickets Tab -->
                <div class="tab-content active" id="active">
                    <div class="no-tickets">
                        <div class="empty-folder-illustration">
                            <img src="/api/placeholder/120/90" alt="Empty folder">
                        </div>
                        <p>You have no active tickets or passes</p>
                    </div>
                </div>
                
                <!-- History Tab -->
                <div class="tab-content" id="history">
                    <h3>Past rides</h3>
                    
                    <div class="ticket-card">
                        <div class="ticket-header">
                            <h4>UTC Bus Ticket</h4>
                            <span class="status completed"><i class="fas fa-check-circle"></i> Completed</span>
                        </div>
                        
                        <div class="ticket-details">
                            <div class="bus-info">
                                <p class="bus-number"><i class="fas fa-bus"></i> A-507</p>
                                <div class="route">
                                    <div class="station">
                                        <span class="dot"></span>
                                        <span class="station-name">Dehradun ISBT</span>
                                    </div>
                                    <div class="route-line"></div>
                                    <div class="station">
                                        <span class="dot"></span>
                                        <span class="station-name">Rishikesh Bus Terminal</span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="validation-info">
                                <p>Validated at</p>
                                <p class="validation-time">03:48 PM, 28 Mar 2025</p>
                            </div>
                            
                            <div class="ticket-actions">
                                <button class="details-btn" onclick="openTripDetails()"><i class="fas fa-list"></i> View details</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="buy-ticket-section">
                <button class="buy-btn"><i class="fas fa-ticket-alt"></i> Buy Ticket / Pass</button>
            </div>
        </section>
    </main>

    <!-- Trip Details Modal -->
    <div id="tripDetailsModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close-btn" onclick="closeTripDetails()"><i class="fas fa-arrow-left"></i></button>
                <h2>Ride details</h2>
                <span class="status-badge">✓ Completed</span>
            </div>
            <div class="modal-body">
                <div class="trip-detail-item ac-badge">
                    <span>AC</span>
                </div>
                <div class="trip-detail-item">
                    <div class="bus-icon"><i class="fas fa-bus"></i></div>
                    <span class="bus-number">A-507</span>
                </div>
                <div class="trip-route">
                    <div class="station">
                        <span class="dot"></span>
                        <span class="station-name">Dehradun ISBT</span>
                    </div>
                    <div class="route-line"></div>
                    <div class="station">
                        <span class="dot"></span>
                        <span class="station-name">Rishikesh Bus Terminal</span>
                    </div>
                </div>
                
                <div class="trip-expiry-info">
                    <div class="label">Expired on</div>
                    <div class="value">03:48 PM, 28 Mar 2025</div>
                </div>
                
                <div class="trip-passenger-info">
                    <div class="label"><i class="fas fa-user"></i> 1 Adult</div>
                </div>
                
                <div class="booking-details">
                    <h3>Booking details</h3>
                    <div class="detail-row">
                        <div class="label">Booking Date</div>
                        <div class="value">03:43 PM, 28 Mar 2025</div>
                    </div>
                    <div class="detail-row">
                        <div class="label">Booking id</div>
                        <div class="value">bwr2n</div>
                    </div>
                </div>
                
                <div class="price-details">
                    <h3>Price details</h3>
                    <div class="detail-row">
                        <div class="label">ADULT 1 X ₹125</div>
                        <div class="value">₹125</div>
                    </div>
                    <div class="detail-row">
                        <div class="label">CGST On Adult</div>
                        <div class="value">₹6.25</div>
                    </div>
                    <div class="detail-row">
                        <div class="label">SGST On Adult</div>
                        <div class="value">₹6.25</div>
                    </div>
                    <div class="detail-row">
                        <div class="label">Surge charge on Adult</div>
                        <div class="value">₹12.50</div>
                    </div>
                    <div class="detail-row total">
                        <div class="label">Total</div>
                        <div class="value">₹150.00</div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    
     <script type="text/javascript" src="<c:url value='/js/trickets.js'/>"></script>
</body>
</html>