/**
 * 
 */
// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Select DOM elements
    const utcTab = document.querySelector('.tab-option.utc');
    const electricTab = document.querySelector('.tab-option.electric');
    const searchBtn = document.querySelector('.search-btn');
    const navItems = document.querySelectorAll('.nav-item');
    
    // Nav menu active state
    navItems.forEach(item => {
        item.addEventListener('click', function() {
            // Remove active class from all items
            navItems.forEach(nav => nav.classList.remove('active'));
            // Add active class to clicked item
            this.classList.add('active');
        });
    });
    
    // UTC Tab functionality
    utcTab.addEventListener('click', function() {
        electricTab.classList.remove('active');
        utcTab.classList.add('active');
        searchBtn.textContent = 'Find My Bus';
        
        // Update button and UI colors to orange theme
        updateUIColors('#ff7b00', '#e67100');
        
        // Update arrow directions for UTC
        document.querySelector('.arrow-direction').style.borderLeftColor = '#ff7b00';
    });
    
    // Electric Tab functionality
    electricTab.addEventListener('click', function() {
        utcTab.classList.remove('active');
        electricTab.classList.add('active');
        searchBtn.textContent = 'Find My Electric Bus';
        
        // Update button and UI colors to green theme
        updateUIColors('#3d8168', '#346d58');
        
        // Update arrow directions for Electric
        document.querySelector('.arrow-direction').style.borderLeftColor = '#3d8168';
    });
    
    // Station clearing functionality
    document.querySelectorAll('.station-clear').forEach(clear => {
        clear.addEventListener('click', function() {
            const stationElement = this.closest('.station');
            const nameElement = stationElement.querySelector('.station-name');
            const codeElement = stationElement.querySelector('.station-code');
            
            // Animate the clearing
            nameElement.style.transition = 'opacity 0.3s ease';
            codeElement.style.transition = 'opacity 0.3s ease';
            nameElement.style.opacity = '0';
            codeElement.style.opacity = '0';
            
            setTimeout(() => {
                nameElement.textContent = '';
                codeElement.textContent = '';
                nameElement.style.opacity = '1';
                codeElement.style.opacity = '1';
            }, 300);
        });
    });
    
    // Exchange stations functionality with animation
    document.querySelector('.swap-arrow').addEventListener('click', function() {
        const stations = document.querySelectorAll('.station');
        const fromCode = stations[0].querySelector('.station-code').textContent;
        const fromName = stations[0].querySelector('.station-name').textContent;
        const toCode = stations[1].querySelector('.station-code').textContent;
        const toName = stations[1].querySelector('.station-name').textContent;
        
        // Add animation class
        this.classList.add('rotate-animation');
        stations[0].classList.add('fade-animation');
        stations[1].classList.add('fade-animation');
        
        // Swap values after brief animation
        setTimeout(() => {
            stations[0].querySelector('.station-code').textContent = toCode;
            stations[0].querySelector('.station-name').textContent = toName;
            stations[1].querySelector('.station-code').textContent = fromCode;
            stations[1].querySelector('.station-name').textContent = fromName;
            
            // Remove animation classes
            this.classList.remove('rotate-animation');
            stations[0].classList.remove('fade-animation');
            stations[1].classList.remove('fade-animation');
        }, 300);
    });
    
    // Search history item click functionality
    document.querySelectorAll('.history-item').forEach(item => {
        item.addEventListener('click', function() {
            const busNumber = this.querySelector('.history-bus-number').textContent;
            const busName = this.querySelector('.history-bus-name').textContent;
            const routeText = this.querySelector('.route-text').textContent;
            
            // Extract origin and destination from route text
            const [origin, destination] = routeText.split(' - ');
            
            // Highlight the clicked history item
            document.querySelectorAll('.history-item').forEach(el => {
                el.style.backgroundColor = '';
            });
            this.style.backgroundColor = '#fff0e0';
            
            // Optional: Populate search form with the history item data
            // This would depend on your application's requirements
            console.log(`Selected: ${busNumber} ${busName}, Route: ${origin} to ${destination}`);
        });
    });
    
    // Search button click effect
    searchBtn.addEventListener('click', function() {
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
            this.style.transform = '';
        }, 150);
    });
    
    // Bottom navigation items functionality
    document.querySelectorAll('.bottom-nav-item').forEach(item => {
        item.addEventListener('click', function() {
            // Highlight active bottom nav item
            document.querySelectorAll('.bottom-nav-item').forEach(nav => {
                nav.style.color = '#666';
            });
            this.style.color = '#ff7b00';
            
            // Show a simple animation
            this.style.transform = 'translateY(-3px)';
            
            // Reset animation after a short delay
            setTimeout(() => {
                this.style.transform = '';
            }, 300);
        });
    });
    
    // Search box click functionality
    document.querySelectorAll('.search-box').forEach(box => {
        box.addEventListener('click', function() {
            // Apply a subtle scale animation
            this.style.transform = 'scale(0.98)';
            setTimeout(() => {
                this.style.transform = '';
                // Simulate navigation or action
                console.log('Search box clicked:', this.querySelector('.bus-name, .bus-info').textContent);
            }, 200);
        });
    });
    
    // Station selection functionality - placeholder for actual implementation
    document.querySelectorAll('.station').forEach(station => {
        station.addEventListener('click', function(event) {
            // Only trigger if not clicking on clear button
            if (!event.target.closest('.station-clear')) {
                console.log('Station clicked, would open station selector');
                // Here you would typically show a station selection modal or dropdown
            }
        });
    });
    
    // Location selector functionality
    document.querySelector('.location').addEventListener('click', function() {
        console.log('Location selector clicked');
        // Animation effect
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
            this.style.transform = '';
            // Here you would typically show a location selection modal
        }, 200);
    });
    
    // Helper function to update UI colors based on selected tab
    function updateUIColors(primaryColor, hoverColor) {
        // Update search button
        searchBtn.style.backgroundColor = primaryColor;
        searchBtn.style.boxShadow = `0 4px 15px ${primaryColor}33`;
        
        // Custom CSS to update hover state
        let style = document.getElementById('dynamic-styles');
        if (!style) {
            style = document.createElement('style');
            style.id = 'dynamic-styles';
            document.head.appendChild(style);
        }
        
        // Update search button hover state
        style.textContent = `
            .search-btn:hover {
                background-color: ${hoverColor};
                box-shadow: 0 6px 20px ${primaryColor}4D;
            }
            .search-icon {
                background-color: ${primaryColor};
                box-shadow: 0 2px 10px ${primaryColor}33;
            }
            .search-icon:hover {
                box-shadow: 0 4px 15px ${primaryColor}4D;
            }
            .route-arrow {
                color: ${primaryColor};
            }
            .bottom-nav-item:hover, .nav-item:hover, .nav-item.active {
                color: ${primaryColor};
            }
            .nav-item.active::after {
                background-color: ${primaryColor};
            }
        `;
        
        // Update station dots
        document.querySelectorAll('.station-dot.empty').forEach(dot => {
            dot.style.borderColor = primaryColor;
        });
        
        document.querySelectorAll('.station-dot.filled').forEach(dot => {
            dot.style.backgroundColor = primaryColor;
            dot.style.borderColor = primaryColor;
        });
        
        // Update search icons
        document.querySelectorAll('.search-icon').forEach(icon => {
            icon.style.backgroundColor = primaryColor;
        });
        
        // Update the vertical line between stations
        const routeStyle = document.createElement('style');
        routeStyle.textContent = `
            .route-selection:before {
                background-color: ${primaryColor};
            }
            .route-selection:after {
                border-top-color: ${primaryColor};
            }
        `;
        document.head.appendChild(routeStyle);
        
        // Update station codes
        document.querySelectorAll('.station-code').forEach(code => {
            code.style.backgroundColor = primaryColor;
        });
    }
    
    // Initialize with default theme
    updateUIColors('#ff7b00', '#e67100');
    
    // Add animations for swap arrow and stations
    const styleSheet = document.createElement('style');
    styleSheet.textContent = `
        .rotate-animation {
            animation: rotate360 0.5s ease;
        }
        
        @keyframes rotate360 {
            0% { transform: rotate(90deg); }
            100% { transform: rotate(450deg); }
        }
        
        .fade-animation {
            animation: fadeInOut 0.3s ease;
        }
        
        @keyframes fadeInOut {
            0% { opacity: 1; }
            50% { opacity: 0.5; }
            100% { opacity: 1; }
        }
    `;
    document.head.appendChild(styleSheet);
});