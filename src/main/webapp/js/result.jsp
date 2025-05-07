<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Elements for the more options menu
    const moreOptionsBtn = document.getElementById('moreOptionsBtn');
    const moreOptionsMenu = document.getElementById('moreOptionsMenu');
    
    // Elements for filter dropdowns
    const dateFilterBtn = document.getElementById('dateFilterBtn');
    const classFilterBtn = document.getElementById('classFilterBtn');
    const sortFilterBtn = document.getElementById('sortFilterBtn');
    
    const dateFilterDropdown = document.getElementById('dateFilterDropdown');
    const classFilterDropdown = document.getElementById('classFilterDropdown');
    const sortFilterDropdown = document.getElementById('sortFilterDropdown');
    
    // Back button functionality
    const backButton = document.querySelector('.back-button');
    if (backButton) {
        backButton.addEventListener('click', function() {
            // Navigate back or to home page
            window.history.back();
        });
    }
    
    // More options menu toggle
    if (moreOptionsBtn && moreOptionsMenu) {
        moreOptionsBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            moreOptionsMenu.classList.toggle('show');
        });
    }
    
    // Filter dropdown toggle functions
    function setupFilterDropdown(buttonElement, dropdownElement) {
        if (buttonElement && dropdownElement) {
            buttonElement.addEventListener('click', function(e) {
                e.stopPropagation();
                // Close all dropdowns first
                closeAllDropdowns();
                // Open the selected dropdown
                dropdownElement.classList.add('show');
            });
        }
    }
    
    // Setup each filter dropdown
    setupFilterDropdown(dateFilterBtn, dateFilterDropdown);
    setupFilterDropdown(classFilterBtn, classFilterDropdown);
    setupFilterDropdown(sortFilterBtn, sortFilterDropdown);
    
    // Function to close all dropdowns
    function closeAllDropdowns() {
        const allDropdowns = document.querySelectorAll('.filter-dropdown');
        allDropdowns.forEach(dropdown => {
            dropdown.classList.remove('show');
        });
        
        // Also close the more options menu
        if (moreOptionsMenu) {
            moreOptionsMenu.classList.remove('show');
        }
    }
    
    // Close dropdowns when clicking cancel buttons
    const cancelButtons = document.querySelectorAll('.cancel-btn');
    cancelButtons.forEach(button => {
        button.addEventListener('click', closeAllDropdowns);
    });
    
    // Close dropdowns when clicking outside
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.filter-option') && 
            !e.target.closest('.filter-dropdown') && 
            !e.target.closest('.more-button')) {
            closeAllDropdowns();
        }
    });
    
    // Handle radio button selections in dropdowns
    const radioButtons = document.querySelectorAll('.dropdown-option input[type="radio"]');
    radioButtons.forEach(radio => {
        radio.addEventListener('change', function() {
            if (this.checked) {
                const dropdownType = this.getAttribute('name');
                const selectedValue = this.nextElementSibling.textContent.trim();
                
                // Update the button text based on selection
                if (dropdownType === 'dateFilter') {
                    dateFilterBtn.querySelector('span').textContent = selectedValue;
                } else if (dropdownType === 'classFilter') {
                    classFilterBtn.querySelector('span').textContent = selectedValue;
                } else if (dropdownType === 'sortFilter') {
                    sortFilterBtn.querySelector('span').textContent = selectedValue;
                }
                
                // Apply the filter
                applyFilters();
                
                // Close the dropdown after selection
                setTimeout(closeAllDropdowns, 300);
            }
        });
    });
    
    // Apply filters function to filter the bus list
    function applyFilters() {
        const dateFilter = document.querySelector('input[name="dateFilter"]:checked')?.id || 'allDates';
        const classFilter = document.querySelector('input[name="classFilter"]:checked')?.id || 'gnUnreserved';
        const sortFilter = document.querySelector('input[name="sortFilter"]:checked')?.id || 'arrivalTime';
        
        const busList = document.querySelector('.bus-list');
        const busItems = document.querySelectorAll('.bus-item');
        
        if (!busList || !busItems.length) return;
        
        // Create array from NodeList for sorting
        const busArray = Array.from(busItems);
        
        // Apply date filter
        let filteredBuses = busArray;
        if (dateFilter !== 'allDates') {
            const today = new Date().toDateString();
            const tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            const tomorrowStr = tomorrow.toDateString();
            
            filteredBuses = busArray.filter(bus => {
                const statusText = bus.querySelector('.status-message')?.textContent || '';
                
                // Simple example - in a real app, this would check actual dates
                if (dateFilter === 'today') {
                    return !statusText.includes('Not running today');
                } else if (dateFilter === 'tomorrow') {
                    return true; // For demo purposes, assume all buses run tomorrow
                }
                return true;
            });
        }
        
        // Apply sorting
        filteredBuses.sort((a, b) => {
            const aTime = a.querySelector(sortFilter === 'departureTime' ? '.departure' : 
                           sortFilter === 'arrivalTime' ? '.arrival' : '.duration')?.textContent || '';
            const bTime = b.querySelector(sortFilter === 'departureTime' ? '.departure' : 
                           sortFilter === 'arrivalTime' ? '.arrival' : '.duration')?.textContent || '';
            
            // For duration, extract numeric values for comparison
            if (sortFilter === 'duration') {
                const aDuration = aTime.match(/\d+h\d+m/) ? 
                    parseInt(aTime.match(/(\d+)h/)[1]) * 60 + parseInt(aTime.match(/(\d+)m/)[1]) : 0;
                const bDuration = bTime.match(/\d+h\d+m/) ? 
                    parseInt(bTime.match(/(\d+)h/)[1]) * 60 + parseInt(bTime.match(/(\d+)m/)[1]) : 0;
                return aDuration - bDuration;
            }
            
            // For times, convert to comparable values
            const aTimeValue = convertTimeToMinutes(aTime);
            const bTimeValue = convertTimeToMinutes(bTime);
            return aTimeValue - bTimeValue;
        });
        
        // Clear and reappend sorted/filtered buses
        busList.innerHTML = '';
        filteredBuses.forEach(bus => {
            busList.appendChild(bus);
        });
        
        // Add visual indicator for active filters
        updateActiveFilters(dateFilter, classFilter, sortFilter);
    }
    
    // Helper function to convert time strings to minutes for comparison
    function convertTimeToMinutes(timeStr) {
        if (!timeStr) return 0;
        
        const isPM = timeStr.includes('PM');
        const timeParts = timeStr.replace(/\s?[AP]M/, '').split(':');
        
        let hours = parseInt(timeParts[0]);
        const minutes = parseInt(timeParts[1] || 0);
        
        // Convert to 24-hour format
        if (isPM && hours < 12) hours += 12;
        if (!isPM && hours === 12) hours = 0;
        
        return hours * 60 + minutes;
    }
    
    // Update visual indicators for active filters
    function updateActiveFilters(dateFilter, classFilter, sortFilter) {
        // This function would add visual cues to show active filters
        // For example, changing button colors or adding indicators
        // Implementation depends on your design requirements
    }
    
    // Make bus items clickable to show details
    const busItems = document.querySelectorAll('.bus-item');
    busItems.forEach(item => {
        item.addEventListener('click', function() {
            const busNumber = this.querySelector('.bus-number').textContent;
            const busName = this.querySelector('.bus-name').textContent;
            
            // Navigate to bus details page (example implementation)
            // In a real app, this would link to a details page
            console.log(`Viewing details for ${busName} (${busNumber})`);
            // window.location.href = `bus-details.html?id=${busNumber}`;
            
            // For demo purposes, toggle an active class
            busItems.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
        });
    });
    
    // Share functionality
    const shareButton = document.querySelector('.share-button');
    if (shareButton) {
        shareButton.addEventListener('click', function(e) {
            e.stopPropagation();
            
            // Check if Web Share API is available
            if (navigator.share) {
                navigator.share({
                    title: 'Uttrakhand Parivahan - Bus Schedule',
                    text: 'Check out the bus schedule from Tanakpur to Izzatnagar',
                    url: window.location.href
                })
                .catch(error => console.log('Error sharing:', error));
            } else {
                // Fallback for browsers that don't support Web Share API
                alert('Share this page: ' + window.location.href);
            }
        });
    }
    
    // Menu item actions
    const menuItems = document.querySelectorAll('.menu-item');
    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            const action = this.textContent.trim();
            console.log(`Menu action: ${action}`);
            
            // Close the menu
            closeAllDropdowns();
            
            // Handle specific menu actions
            switch(action) {
                case 'Share':
                    // Trigger share functionality
                    if (shareButton) shareButton.click();
                    break;
                case 'Language':
                    // Open language selector
                    alert('Language selection coming soon');
                    break;
                case 'Report Issue':
                    // Open issue reporting form
                    alert('Issue reporting coming soon');
                    break;
                // Add more cases as needed
            }
        });
    });
    
    // Initial filter application
    applyFilters();
    
    // Simulated real-time updates for bus status (for demo purposes)
    function simulateRealTimeUpdates() {
        const busItems = document.querySelectorAll('.bus-item');
        const randomBus = busItems[Math.floor(Math.random() * busItems.length)];
        
        if (randomBus) {
            const statusMessage = randomBus.querySelector('.status-message');
            if (!statusMessage) {
                const newStatus = document.createElement('div');
                newStatus.className = 'status-message';
                newStatus.textContent = 'Arriving soon';
                randomBus.appendChild(newStatus);
            } else {
                const statuses = ['Arriving soon', 'Delayed by 10 mins', 'Arriving on time', 'Running late'];
                statusMessage.textContent = statuses[Math.floor(Math.random() * statuses.length)];
            }
        }
        
        // Schedule next update
        setTimeout(simulateRealTimeUpdates, 30000); // Update every 30 seconds
    }
    
    // Uncomment to enable simulated updates
    // setTimeout(simulateRealTimeUpdates, 10000);
});