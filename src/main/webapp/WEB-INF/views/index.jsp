<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saarthi Web</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
</head>
<body>
    <div class="container">
        <header>
            <div class="header-content">
                <div class="app-name">SAARTHI</div>
                <div class="nav-section">
                    <div class="nav-items">
                        <button class="login-btn"><a href="login" targe="_black">Login</a></button>
                        <button class="nav-item"><a href="Utc" >UTC Bus</a></button>
                        <button class="nav-item"><a href="electric" >Electric Bus</a></button>
                        <button class="nav-item"><a href="mytrickets">My Tickets</a></button>
                        <button class="nav-item"><a href="#">findRoute</a></button>
                    </div>
                    
                    <div class="location-btn">
                        <svg class="location-pin" width="16" height="16" viewBox="0 0 24 24" fill="none">
                            <path d="M12 2C8.13 2 5 5.13 5 9C5 14.25 12 22 12 22C12 22 19 14.25 19 9C19 5.13 15.87 2 12 2ZM12 11.5C10.62 11.5 9.5 10.38 9.5 9C9.5 7.62 10.62 6.5 12 6.5C13.38 6.5 14.5 7.62 14.5 9C14.5 10.38 13.38 11.5 12 11.5Z" fill="#777777"/>
                        </svg>
                        <span class="location-text">Dehradun</span>
                        <svg class="location-arrow" width="16" height="16" viewBox="0 0 24 24" fill="none">
                            <path d="M8.59 16.59L13.17 12L8.59 7.41L10 6L16 12L10 18L8.59 16.59Z" fill="#777777"/>
                        </svg>
                    </div>
                </div>
            </div>
        </header>

        <div class="search-section">
            <div class="search-container">
                <svg class="search-icon" width="20" height="20" viewBox="0 0 24 24" fill="none">
                    <path d="M15.5 14H14.71L14.43 13.73C15.41 12.59 16 11.11 16 9.5C16 5.91 13.09 3 9.5 3C5.91 3 3 5.91 3 9.5C3 13.09 5.91 16 9.5 16C11.11 16 12.59 15.41 13.73 14.43L14 14.71V15.5L19 20.49L20.49 19L15.5 14ZM9.5 14C7.01 14 5 11.99 5 9.5C5 7.01 7.01 5 9.5 5C11.99 5 14 7.01 14 9.5C14 11.99 11.99 14 9.5 14Z" fill="#F57C00"/>
                </svg>
                <input type="text" placeholder="Find and track your bus">
            </div>
        </div>

        <div class="main-content">
            <div class="airport-banner">
                <div class="banner-content">
                    <div class="banner-title">SAARTHI BUS</div>
                    <div class="banner-subtitle"><strong>Get rides from Dehradun Airport (T2)</strong> to Haridwar and Rishikesh</div>
                </div>
                <div class="banner-arrow">></div>
            </div>

            <div class="explore-title-section">
                <div class="line"></div>
                <div class="explore-title">EXPLORE SAARTHI</div>
                <div class="line"></div>
            </div>
            
            <div class="bus-cards-section">
      
                <div class="bus-card electric-bus">
                <a href="Electric_bus" target="_black">
                
                    <div class="bus-card-title">Electric Bus</div>
                    <div class="bus-card-info">Guaranteed seating</div>
                    <div class="bus-card-highlight">Luxury</div>
                    <div class="bus-image">
                        <div class="bus-categories">
                            <div class="category ac"><a href="ele_Ac" target="_black">AC Bus</a></div>
                            <div class="category non-ac"><a href="ele_non_ac" target="_black">Non-AC Bus</a></div>
                        </div>
                        <div class="bus-photos">
                            <div class="bus-photo">AC Electric Bus</div>
                            <div class="bus-photo">Non-AC Electric Bus</div>
                        </div>
                    </div>
                    </a>
                </div>
                <a href="Utc" target="_black">
                
                <div class="bus-card utc-bus">
                    <div class="bus-card-title">UTC Bus</div>
                    <div class="bus-card-info">Lifeline of Uttarakhand</div>
                    <div class="bus-card-price">Starting from ₹99</div>
                    <div class="bus-image">
                        <div class="bus-categories">
                            <div class="category ac"> <a href="Utc_AC" target="_black">AC Bus</a> </div>
                            <div class="category non-ac"> <a href="Non_ac_utc" target="_black">Non-AC Bus</a> </div>
                        </div>
                        <div class="bus-photos">
                            <div class="bus-photo">AC UTC Bus</div>
                            <div class="bus-photo">Non-AC UTC Bus</div>
                        </div>
                    </div>
                  
                </div>
                  </a>
            </div>

            <div class="card-section">
                <div class="card-container">
                    <div class="card-image"></div>
                    <div class="card-content">
                        <div class="card-title">Electric Card</div>
                        <div class="card-description">Recharge, view balance, and more</div>
                    </div>
                </div>
            </div>

            <div class="tickets-section">
                <div class="tickets-container">
                    <span class="ticket-icon">🎟️</span>
                    <span class="ticket-text">My tickets / passes</span>
                </div>
            </div>
        </div>

        <footer>
            <div class="footer-content">
                <p>© 2025 Saarthi - Making travel easier in Uttarakhand</p>
            </div>
        </footer>
    </div>
</body>
</html>