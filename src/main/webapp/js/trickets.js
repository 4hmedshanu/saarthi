/**
 * 
 */

// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Tab switching functionality with animation
    const tabBtns = document.querySelectorAll('.tab-btn');
    const tabContents = document.querySelectorAll('.tab-content');
    
    // Show the active tab on initial load
    showActiveTab();
    
    tabBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            // Remove active class from all buttons and tabs
            tabBtns.forEach(b => b.classList.remove('active'));
            tabContents.forEach(t => t.classList.remove('active'));
            
            // Add active class to clicked button
            btn.classList.add('active');
            
            // Show corresponding tab content with animation
            const tabId = btn.getAttribute('data-tab');
            const activeTab = document.getElementById(tabId);
            activeTab.classList.add('active');
            
            // Adjust the buy ticket button visibility
            adjustBuyTicketButton(tabId);
        });
    });

    // Function to ensure the active tab is shown on page load
    function showActiveTab() {
        const activeBtn = document.querySelector('.tab-btn.active');
        if (activeBtn) {
            const tabId = activeBtn.getAttribute('data-tab');
            const activeTab = document.getElementById(tabId);
            if (activeTab) {
                // Hide all tabs first
                tabContents.forEach(t => t.classList.remove('active'));
                // Show the active tab
                activeTab.classList.add('active');
                // Adjust buy ticket button visibility
                adjustBuyTicketButton(tabId);
            }
        }
    }
    
    // Function to adjust buy ticket button visibility based on active tab
    function adjustBuyTicketButton(tabId) {
        const buyTicketSection = document.querySelector('.buy-ticket-section');
        // Always show the button regardless of tab (as per requirement)
        buyTicketSection.style.display = 'flex';
    }
});

// Trip details modal functionality with animation
function openTripDetails() {
    const modal = document.getElementById('tripDetailsModal');
    modal.style.display = 'block';
    
    // Force a reflow to ensure animation works
    modal.offsetWidth;
    
    // Add show class for animation
    modal.classList.add('show');
    
    // Prevent body scrolling when modal is open
    document.body.style.overflow = 'hidden';
}

function closeTripDetails() {
    const modal = document.getElementById('tripDetailsModal');
    
    // Remove show class to trigger fade out animation
    modal.classList.remove('show');
    
    // Wait for animation to finish before hiding the modal
    setTimeout(() => {
        modal.style.display = 'none';
        // Re-enable body scrolling
        document.body.style.overflow = 'auto';
    }, 300);
}

// Close modal when clicking outside
window.onclick = function(event) {
    const modal = document.getElementById('tripDetailsModal');
    if (event.target === modal) {
        closeTripDetails();
    }
}

