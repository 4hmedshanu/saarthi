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
    
    <style type="text/css">
    			.chatbot-icon {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #0d6efd;
      color: white;
      font-size: 24px;
      padding: 15px;
      border-radius: 50%;
      cursor: pointer;
      box-shadow: 0 4px 10px rgba(0,0,0,0.3);
      z-index: 1000;
  }

  .chatbot-modal {
      display: none;
      position: fixed;
      bottom: 80px;
      right: 20px;
      width: 320px;
      height: 420px;
      background-color: white;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.2);
      z-index: 1001;
      flex-direction: column;
      overflow: hidden;
  }

  .chatbot-header {
      background-color: #0d6efd;
      color: white;
      padding: 10px;
      font-weight: bold;
      display: flex;
      justify-content: space-between;
      align-items: center;
  }

  .chatbot-body {
      flex: 1;
      padding: 10px;
      height: 300px;
      overflow-y: auto;
      display: flex;
      flex-direction: column;
  }

  .chatbot-input {
      display: flex;
      padding: 10px;
      border-top: 1px solid #ccc;
  }

  .chatbot-input input {
      flex: 1;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 5px;
  }

  .chatbot-input button {
      margin-left: 8px;
      padding: 8px 12px;
      background-color: #0d6efd;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
  }

  .bot-message, .user-message {
      margin: 5px 0;
      padding: 8px;
      border-radius: 10px;
      max-width: 80%;
  }

  .bot-message {
      background-color: #f1f0f0;
      align-self: flex-start;
  }

  .user-message {
      background-color: #dcf8c6;
      align-self: flex-end;
  }

  .close-chat {
      cursor: pointer;
      font-size: 20px;
  }
    </style>
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
                        <button class="nav-item"><a href="find">Find My Bus</a></button>
                    </div>
                    
                    <div class="location-btn">
                        <svg class="location-pin" width="16" height="16" viewBox="0 0 24 24" fill="none">
                            <path d="M12 2C8.13 2 5 5.13 5 9C5 14.25 12 22 12 22C12 22 19 14.25 19 9C19 5.13 15.87 2 12 2ZM12 11.5C10.62 11.5 9.5 10.38 9.5 9C9.5 7.62 10.62 6.5 12 6.5C13.38 6.5 14.5 7.62 14.5 9C14.5 10.38 13.38 11.5 12 11.5Z" fill="#777777"/>
                        </svg>
                        <span class="location-text">Tanakpur</span>
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
                       
           
                            <div style="width: 50%; height: 200px; overflow: hidden; position: relative;">
							  <img src="<c:url value='/photo/bus_1.jpg'/>" alt="AC Bus"
							       style="width: 50%; height: 50%; object-fit: fit; display: block; margin: auto">
							</div>
							
                            <div style="width: 50%; height: 200px; overflow: hidden; position: relative;">
									  <img src="<c:url value='/photo/bus_2.jpg'/>" alt="Non-AC Bus"
									       style="width: 50%; height: 50%; object-fit: fit; display: block;margin: auto">
						</div>
						
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
                       
           
                            <div style="width: 50%; height: 200px; overflow: hidden; position: relative;">
							  <img src="<c:url value='/photo/bus_1.jpg'/>" alt="AC Bus"
							       style="width: 50%; height: 50%; object-fit: fit; display: block; margin: auto">
							</div>
							
                            <div style="width: 50%; height: 200px; overflow: hidden; position: relative;">
									  <img src="<c:url value='/photo/bus_2.jpg'/>" alt="AC Bus"
									       style="width: 50%; height: 50%; object-fit: fit; display: block;margin: auto">
						</div>
						
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
    
    
    
    <!-- Chatbot Icon Button -->
    
    <!-- Chatbot Icon Button -->
			<div class="chatbot-icon" onclick="toggleChatbot()">
			    💬
			</div>
			
			<!-- Chatbot Modal -->
			<div class="chatbot-modal" id="chatbotModal">
			    <div class="chatbot-header">
			        SAARTHI-AI: Smart Bus Tracking System
			         <span class="close-chat" onclick="toggleChatbot()">×</span>
			    </div>
			    <div class="chatbot-body" id="chatBody">
			        <div class="bot-message">Hello! How can I help you today?</div>
			    </div>
			    <div class="chatbot-input">
			    
			        <input type="text" id="userInput" name="message" placeholder="Type your message..." />
			        <button onclick="sendMessage()" >Send</button>
			    </div>
			</div>
			
			 <script type="text/javascript" src="<c:url value='/js/chatbot.js'/>"></script>
</body>
</html>