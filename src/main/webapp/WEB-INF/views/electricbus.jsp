<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electric Bus - SAARTHI</title>
       
    <link rel="stylesheet" href="<c:url value='/css/electric.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="logo">SAARTHI</div>
        <div class="nav-links">
            <a href="home" class="nav-link">Home</a>
            <a href="Utc" class="nav-link">UTC Bus</a>
            <a href="electric" class="nav-link active">Electric Bus</a>
            <a href="mytrickets" class="nav-link">My Tickets</a>
            <a href="find" class="nav-link">Find My Bus</a>
            
        </div>
        <div class="location-container">
            <div class="location">
                <i class="fas fa-map-marker-alt"></i>
                <span>Tanakpur</span>
                <i class="fas fa-chevron-right"></i>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Section 1: Booking Header -->
        <div class="booking-header">
            <div class="brand">
                <h1><span class="electric">ELECTRIC</span> <span class="bus">BUS</span></h1>
                <p>Pre-book for <span>luxury</span> experience</p>
            </div>
            <div class="notification">
                <i class="fas fa-bell"></i>
            </div>
        </div>

        <!-- Promotional Banner -->
        <div class="promo-banner">
            <div class="promo-text">
                <h2>First 2 rides</h2>
                <h3>at just ₹75 each</h3>
            </div>
            <div class="gift-icon">
                <img src="/api/placeholder/80/80" alt="Gift">
            </div>
        </div>

        <!-- Section 2: Split Content -->
        <div class="split-content">
            <!-- Left Side - Search Box -->
            <div class="search-section">
                <div class="journey-line">
                    <div class="journey-points">
                        <div class="point start"></div>
                        <div class="line"></div>
                        <div class="point end"></div>
                    </div>
                    <div class="search-fields">
                    
                    <form action="Find" method="get" >
                    
                        <div class="search-input">
                            <input type="text" placeholder="Where from?" name="from">
                        </div>
                        <div class="exchange-icon">
                            <i class="fas fa-arrow-up"></i>
                            <i class="fas fa-arrow-down"></i>
                        </div>
                        <div class="search-input">
                            <input type="text" placeholder="Where to?" name="to">
                        </div>
                    </div>
                </div>
                <button class="search-btn" type="submit">Search for bus</button>
                
                </from>
            </div>

            <!-- Right Side - Bus Features -->
            <div class="features-section">
               <div class="bus-image-container">
                    <img src="<c:url value='/photo/bus_1.jpg'/>" alt="Electric Bus" class="bus-image">
                </div>
                <div class="features">
                    <div class="feature">
                        <i class="fas fa-couch"></i>
                        <p>Premium<br>seats</p>
                    </div>
                    <div class="feature-divider"></div>
                    <div class="feature">
                        <i class="fas fa-map-marker-alt"></i>
                        <a href="tracking"><p>Live<br>tracking</p></a>
                    </div>
                    <div class="feature-divider"></div>
                    <div class="feature">
                        <i class="fas fa-plug"></i>
                        <p>USB<br>charging</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section 3: Tickets and Routes -->
        <div class="tickets-routes-section">
            <!-- My Tickets/Passes -->
            <div class="my-tickets">
                <i class="fas fa-ticket-alt"></i>
                <p>My tickets / passes</p>
            </div>

            <!-- Popular Routes -->
            <div class="routes-section">
                <div class="routes-header">
                    <h2>Popular routes</h2>
                    <div class="view-all">
                        <a href="#">View all routes <i class="fas fa-chevron-right"></i></a>
                    </div>
                </div>
                
                <!-- Route 1 -->
                <div class="route-card">
                    <div class="route-details">
                        <div class="route-number">
                            <i class="fas fa-bus"></i>
                            <span>S-155</span>
                        </div>
                        <div class="route-path">
                            <div class="route-stop">
                                <div class="stop-icon start"></div>
                                <p>Chhatrapati Shivaji Maharaj Terminus</p>
                            </div>
                            <div class="route-line"></div>
                            <div class="route-stop">
                                <div class="stop-icon end"></div>
                                <p class="destination">Chhatrapati Shivaji Maharaj Terminus GPO</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Route 2 -->
                <div class="route-card">
                    <div class="route-details">
                        <div class="route-number">
                            <i class="fas fa-bus"></i>
                            <span>S-902</span>
                        </div>
                        <div class="route-path">
                            <div class="route-stop">
                                <div class="stop-icon start"></div>
                                <p>Chhatrapati Shivaji Maharaj Terminus</p>
                            </div>
                            <div class="route-line"></div>
                            <div class="route-stop">
                                <div class="stop-icon end"></div>
                                <p class="destination">Bhatia Baug</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Route 3 -->
                <div class="route-card">
                    <div class="route-details">
                        <div class="route-number">
                            <i class="fas fa-bus"></i>
                            <span>S-167</span>
                        </div>
                        <div class="route-path">
                            <div class="route-stop">
                                <div class="stop-icon start"></div>
                                <p>Ahilyabai Holkar Chowk</p>
                            </div>
                            <div class="route-line"></div>
                            <div class="route-stop">
                                <div class="stop-icon end"></div>
                                <p class="destination">Ahilyabai Holkar Chowk</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Customer Support -->
            <div class="customer-support">
                <i class="fas fa-headset monochrome"></i>
                <p>Customer support</p>
            </div>
        </div>
    </div>
</body>
</html>