/**
 * 
 */

document.addEventListener('DOMContentLoaded', function() {
    // Get DOM elements
    const headerMenuIcon = document.getElementById('headerMenuIcon');
    const moreOptionsMenu = document.getElementById('moreOptionsMenu');
    const dateTrigger = document.getElementById('dateTrigger');
    const dateModal = document.getElementById('dateModal');
    const cancelDateBtn = document.getElementById('cancelDateBtn');
    const modalOverlay = document.getElementById('modalOverlay');
    const statusBarTrigger = document.getElementById('statusBarTrigger');
    const statusModal = document.getElementById('statusModal');
    const closeStatusBtn = document.getElementById('closeStatusBtn');
    const trainToggleArrow = document.getElementById('trainToggleArrow');
    const trainPanel = document.getElementById('trainPanel');
    const closePanelBtn = document.getElementById('closePanelBtn');
    const insideTrainToggle = document.getElementById('insideTrainToggle');
    const journeyMenuBtn = document.getElementById('journeyMenuBtn');
    const alertClose = document.querySelector('.alert-close');
    const alertBanner = document.querySelector('.alert-banner');
    const backNav = document.querySelector('.back-nav');

    // Function to close all modals and menus
    function closeAllModalAndMenus() {
        moreOptionsMenu.style.display = 'none';
        dateModal.style.display = 'none';
        statusModal.style.display = 'none';
        modalOverlay.style.display = 'none';
        trainPanel.classList.remove('show');
    }

    // Toggle the More Options menu
    headerMenuIcon.addEventListener('click', function(e) {
        e.stopPropagation();
        const isVisible = moreOptionsMenu.style.display === 'block';
        moreOptionsMenu.style.display = isVisible ? 'none' : 'block';
    });

    // Journey Menu Button functionality (same as header menu for now)
    journeyMenuBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        const isVisible = moreOptionsMenu.style.display === 'block';
        moreOptionsMenu.style.display = isVisible ? 'none' : 'block';
    });

    // Date dropdown functionality
    dateTrigger.addEventListener('click', function() {
        dateModal.style.display = 'block';
        modalOverlay.style.display = 'block';
    });

    // Cancel button for date modal
    cancelDateBtn.addEventListener('click', function() {
        dateModal.style.display = 'none';
        modalOverlay.style.display = 'none';
    });

    // Handle date option selection
    const dateOptions = document.querySelectorAll('.date-option input');
    dateOptions.forEach(option => {
        option.addEventListener('change', function() {
            if (this.checked) {
                const label = document.querySelector(`label[for="${this.id}"]`).textContent;
                dateTrigger.textContent = label.split('(')[0].trim();
                dateTrigger.innerHTML += '<i class="fas fa-caret-down"></i>';
                dateModal.style.display = 'none';
                modalOverlay.style.display = 'none';
            }
        });
    });

    // Status bar trigger functionality
    statusBarTrigger.addEventListener('click', function() {
        statusModal.style.display = 'block';
        modalOverlay.style.display = 'block';
    });

    // Close status modal
    closeStatusBtn.addEventListener('click', function() {
        statusModal.style.display = 'none';
        modalOverlay.style.display = 'none';
    });

    // Train toggle arrow to show train panel
    trainToggleArrow.addEventListener('click', function() {
        trainPanel.classList.add('show');
        modalOverlay.style.display = 'block';
    });

    // Close train panel
    closePanelBtn.addEventListener('click', function() {
        trainPanel.classList.remove('show');
        modalOverlay.style.display = 'none';
    });

    // Inside train toggle functionality
    insideTrainToggle.addEventListener('change', function() {
        const toggleStatus = document.querySelector('.toggle-status');
        toggleStatus.textContent = this.checked ? 'Yes' : 'No';
    });

    // Close alert banner
    if (alertClose) {
        alertClose.addEventListener('click', function() {
            alertBanner.style.display = 'none';
        });
    }

    // Back navigation functionality
    backNav.addEventListener('click', function() {
        // Normally would go back to previous page
        alert('Back button pressed. This would navigate to the previous page.');
    });

    // Close modal when clicking on overlay
    modalOverlay.addEventListener('click', function() {
        closeAllModalAndMenus();
    });

    // Close menu when clicking outside
    document.addEventListener('click', function() {
        moreOptionsMenu.style.display = 'none';
    });

    // Prevent clicks inside menus from closing them
    moreOptionsMenu.addEventListener('click', function(e) {
        e.stopPropagation();
    });

    // Handle clicks on menu items
    const menuItems = document.querySelectorAll('.menu-item');
    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            alert(`Selected: ${this.textContent}`);
            moreOptionsMenu.style.display = 'none';
        });
    });

    // Bus buttons functionality
    const seeMoreBuses = document.querySelector('.see-more-buses');
    if (seeMoreBuses) {
        seeMoreBuses.addEventListener('click', function() {
            alert('This would show more buses available from this stop.');
        });
    }

    const reportProblem = document.querySelector('.report-problem-container');
    if (reportProblem) {
        reportProblem.addEventListener('click', function() {
            alert('This would open a form to report problems with bus information.');
        });
    }

    // Maps button functionality
    const mapsButton = document.querySelector('.maps-button');
    if (mapsButton) {
        mapsButton.addEventListener('click', function() {
            alert('This would open Google Maps with directions to this location.');
        });
    }

    // Pay ticket button functionality
    const payTicketButton = document.querySelector('.pay-ticket-button');
    if (payTicketButton) {
        payTicketButton.addEventListener('click', function() {
            alert('This would redirect to the ticket payment page.');
        });
    }

    // Status modal buttons
    const feedbackButton = document.querySelector('.status-button:nth-child(1)');
    const shareButton = document.querySelector('.status-button:nth-child(2)');
    
    if (feedbackButton) {
        feedbackButton.addEventListener('click', function() {
            alert('This would open a feedback form for train status.');
        });
    }
    
    if (shareButton) {
        shareButton.addEventListener('click', function() {
            alert('This would open share options for train status.');
        });
    }

    // Refresh button functionality
    const refreshButton = document.querySelector('.refresh-button');
    if (refreshButton) {
        refreshButton.addEventListener('click', function() {
            alert('Refreshing train status information...');
            // Here you would normally fetch updated train status data
        });
    }

    // Action buttons functionality
    const alarmButton = document.querySelector('.action-button:nth-child(1)');
    const seatsButton = document.querySelector('.action-button:nth-child(2)');
    const shareActionButton = document.querySelector('.action-button:nth-child(3)');

    if (alarmButton) {
        alarmButton.addEventListener('click', function() {
            alert('This would set an alarm for train arrival.');
        });
    }

    if (seatsButton) {
        seatsButton.addEventListener('click', function() {
            alert('This would show seat availability information.');
        });
    }

    if (shareActionButton) {
        shareActionButton.addEventListener('click', function() {
            alert('This would open share options for train information.');
        });
    }

    // Add CSS styles for show class
    const style = document.createElement('style');
    style.textContent = `
        .train-panel.show {
            bottom: 0;
        }
        
        .modal {
            display: none;
        }
    `;
    document.head.appendChild(style);
});