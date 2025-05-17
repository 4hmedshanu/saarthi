function toggleChatbot() {
  const modal = document.getElementById("chatbotModal");
  modal.style.display = modal.style.display === "flex" ? "none" : "flex";
  modal.style.flexDirection = "column";
}

const qaPairs = [
	{
		  	    q: "ticket from tanakpur to delhi",
		  	    a: "the price of ticket to DELHI is ₹615."
	},
	{
	    q: "How can I book a bus ticket online?",
	    a: "You can book tickets easily through Saarthi. Select your origin, destination, date, number of passengers, and preferred seats, then complete the payment."
	  },
	  {
	    q: "Is it possible to book tickets via phone?",
	    a: "Yes, phone booking is available. Please call our customer service at [Your Phone Number] during [Operating Hours]."
	  },
	  {
	    q: "Can I book tickets at the bus station?",
	    a: "Yes, tickets can be purchased at our authorized counters at major bus stations like Bhainsali and Sohrab Gate in Meerut."
	  },
	  {
	    q: "How far in advance can I book my journey?",
	    a: "Bookings typically open [Number, e.g., 30] days in advance. Check [Your Website/App] for specific route availability."
	  },
	  {
	    q: "Can I choose my preferred seat?",
	    a: "Yes, seat selection is available during the online booking process, subject to availability on the seat map."
	  },
	  {
	    q: "Do I need an account to book tickets?",
	    a: "Guest booking is available, but creating an account on [Your Website/App] allows easy management of your bookings and faster checkout."
	  },
	  {
	    q: "What is the maximum number of seats I can book in one transaction?",
	    a: "You can typically book a maximum of [Number, e.g., 6] seats in a single online transaction."
	  },
	  {
	    q: "Can I make a group booking?",
	    a: "For group bookings (more than [Number] passengers), please contact our dedicated group booking desk at [Group Booking Contact Info]."
	  },
	  {
	    q: "How do I know if my booking is confirmed?",
	    a: "You will receive a confirmation SMS and email with your ticket details (PNR number) immediately after successful payment."
	  },
	  {
	    q: "I haven't received my e-ticket/M-ticket. What should I do?",
	    a: "Please check your spam/junk folder. If still not found, contact our customer support at [Phone Number] or [Email Address] with your booking reference or phone number."
	  },
	  {
	    q: "Can I book a ticket for an infant?",
	    a: "Infants below [Age, e.g., 2 or 5] years may travel under specific conditions. Please check our Child Travel Policy at [Policy Link]."
	  },
	  {
	    q: "Can I modify my booking details (like date or name) after confirmation?",
	    a: "Modification of booking details like date or passenger name is generally not allowed. You may need to cancel the existing ticket and book a new one as per policy."
	  },
	  {
	    q: "How can I find the bus schedule from Meerut to Delhi?",
	    a: "Enter 'Meerut' as origin and 'Delhi' as destination on [Your Website/App] search bar, select date, and click search to view available buses and timings."
	  },
	  {
	    q: "How long does the bus journey from Meerut to Delhi usually take?",
	    a: "The estimated journey time is approximately [Time, e.g., 1.5 to 2.5] hours, depending on traffic and the specific service."
	  },
	  {
	    q: "Are there direct buses from Meerut to Lucknow?",
	    a: "Yes, we operate direct services. Please check [Your Website/App] for schedules and availability for the Meerut-Lucknow route."
	  },
	  {
	    q: "Where is the main bus stand in Meerut?",
	    a: "Major bus operations are from Bhainsali Bus Stand and Sohrab Gate Bus Station in Meerut. Check your ticket for the exact boarding point."
	  },
	  {
	    q: "What are the boarding points in Meerut?",
	    a: "Common boarding points include Bhainsali Bus Stand, Sohrab Gate, and potentially specific points on bypass roads. Check the booking page for options."
	  },
	  {
	    q: "What are the dropping points in Delhi?",
	    a: "Common dropping points in Delhi include ISBT Kashmere Gate, Anand Vihar ISBT, Sarai Kale Khan, etc. Check your ticket or booking details for the specific location."
	  },
	  {
	    q: "Can I track my bus in real-time?",
	    a: "Yes, live bus tracking is available for many services via a link provided in your confirmation SMS/email or on [Your Website/App]."
	  },
	  {
	    q: "What happens if my bus is delayed?",
	    a: "We strive for punctuality, but delays can occur due to unforeseen circumstances. You can track the bus location, and significant delays will be communicated via SMS if possible."
	  },
	  {
	    q: "Are night buses available?",
	    a: "Yes, we operate overnight services on many long-distance routes. Check the schedule for availability."
	  },
	  {
	    q: "What is the bus fare from Meerut to Delhi?",
	    a: "Fares vary based on bus type (AC, Non-AC, Sleeper) and operator. Prices typically start from around [Lowest Price] INR. Check [Your Website/App] for exact fares."
	  },
	  {
	    q: "Are there any discounts available?",
	    a: "We may offer discounts for children, senior citizens, or promotional offers. Please check the 'Offers' section on [Your Website/App] or during booking."
	  },
	  {
	    q: "What payment methods are accepted online?",
	    a: "We accept Credit Cards, Debit Cards, Net Banking, UPI (Google Pay, PhonePe, etc.), and popular mobile wallets."
	  },
	  {
	    q: "Is online payment secure?",
	    a: "Yes, all online transactions are processed through secure, encrypted payment gateways."
	  },
	  {
	    q: "Can I pay with cash?",
	    a: "Cash payment is usually accepted only for bookings made at our physical counters."
	  },
	  {
	    q: "Are there different fares for different seats on the same bus?",
	    a: "Sometimes, certain seats (like front rows, lower berths in sleepers) might be priced slightly higher as premium seats."
	  },
	  {
	    q: "Is GST included in the ticket price?",
	    a: "Yes, the displayed fare usually includes all applicable taxes like GST."
	  },

	  {
	    q: "What is the free luggage allowance per passenger?",
	    a: "Passengers are typically allowed [Number] kg of free checked-in luggage and one small carry-on bag. Refer to our Luggage Policy at [Policy Link]."
	  },
	  {
	    q: "What items are prohibited in luggage?",
	    a: "Hazardous materials, explosives, flammable items, illegal substances, and fragile items (at owner's risk) are prohibited. Check [Policy Link] for details."
	  },
	  {
	    q: "What if I lose my luggage?",
	    a: "[Service Name] is not responsible for lost or stolen luggage, but please report it immediately to the crew or customer support for assistance."
	  },
	  {
	    q: "Are amenities like blankets and water bottles provided?",
	    a: "Amenities vary by service type. AC sleeper/Volvo buses often provide blankets and may offer water bottles. Check service features during booking."
	  },
	  {
	    q: "Is Wi-Fi available on the bus?",
	    a: "Wi-Fi may be available on select premium services. Check the bus amenities list when booking."
	  },
	  {
	    q: "Are there charging points for mobile phones?",
	    a: "Most AC buses and many newer Non-AC buses are equipped with charging points near seats."
	  },
	  {
	    q: "Are there restrooms/toilets on the bus?",
	    a: "Restrooms are generally available on premium long-distance Volvo/Scania services. For others, scheduled restroom breaks are provided."
	  },
	  {
	    q: "What types of buses do you operate (AC, Non-AC, Sleeper)?",
	    a: "We operate a fleet including Ordinary, Jan Rath AC, Shatabdi AC, Pink Express AC, Gold Line Non-AC, Volvo AC, AC Sleeper, and Non-AC Seater/Sleeper buses."
	  },
	  {
	    q: "How can I cancel my bus ticket?",
	    a: "You can cancel your ticket online through the 'Manage Booking' or 'Cancel Ticket' section on [Your Website/App] using your PNR/Ticket number."
	  },
	  {
	    q: "What is the cancellation policy and charges?",
	    a: "Cancellation charges depend on how far in advance you cancel before departure. Please refer to our detailed Cancellation Policy at [Policy Link]."
	  },
	  {
	    q: "How long does it take to get a refund after cancellation?",
	    a: "Refunds are typically processed within [Number, e.g., 5-7] working days to the original payment source."
	  },
	  {
	    q: "What happens if the bus service is cancelled by the operator?",
	    a: "In case of service cancellation by [Service Name], passengers are eligible for a full refund or alternative arrangements where possible."
	  },
	  {
	    q: "What safety measures are taken for passengers?",
	    a: "We prioritize safety with regular vehicle maintenance, trained drivers, adherence to speed limits, and emergency procedures. Some buses have CCTV."
	  },
	  {
	    q: "Are there specific seats reserved for female passengers?",
	    a: "Yes, often adjacent seats to a single lady passenger are reserved for other ladies, where feasible and indicated during booking."
	  },
	  {
	    q: "What documents do I need to carry while travelling?",
	    a: "You must carry your e-ticket or M-ticket (SMS/App confirmation) along with a valid government-issued photo ID proof (like Aadhar, Voter ID, Passport, Driving License)."
	  },
	  {
	    q: "How can I contact customer support?",
	    a: "You can reach our 24/7 customer support via phone at [Phone Number], email at [Email Address], or through the help section on [Your Website/App]."
	  },
	  {
	    q: "I forgot my account password. How can I reset it?",
	    a: "Click on 'Forgot Password' on the login page of [Your Website/App] and follow the instructions sent to your registered email/mobile."
	  },
	  {
	    q: "Where can I provide feedback about my journey?",
	    a: "We value your feedback. Please use the feedback form on [Your Website/App] or email us at [Feedback Email Address]."
	  },
	  {
	    q: "What is the enquiry number for Bhainsali Bus Stand, Meerut?",
	    a: "You can try contacting the UPSRTC enquiry number listed for Bhainsali, Meerut at [Enquiry Number from Search Results, e.g., 0121-2420117 / 9412703103]."
	  },
	  {
	    q: "What is the enquiry number for Sohrab Gate Bus Station, Meerut?",
	    a: "You can try contacting the UPSRTC enquiry number listed for Sohrab Gate, Meerut at [Enquiry Number from Search Results, e.g., 0121-2762193]."
	  },
	  {
	    q: "Are pets allowed on the bus?",
	    a: "Pets are generally not allowed on board. Please refer to our specific Pet Policy, if any, at [Policy Link]."
	  },
	  {
	    q: "What is the policy for travelling with children?",
	    a: "Children above [Age, e.g., 5] years typically require a full fare ticket. Please check our Child Travel Policy at [Policy Link] for details on age limits and documentation."
	  },
	  {
	    q: "Is smoking or consuming alcohol permitted on the bus?",
	    a: "No, smoking and consumption of alcohol are strictly prohibited on all our buses."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to CHIDIAPUR on the Chanigarh sector 17 route?",
	    a: "You can travel to CHIDIAPUR on the way to Chanigarh sector 17. It's 298 km from Tanakpur and costs ₹485."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to UTTAM NAGAR on the Jaipur route?",
	    a: "Yes, there is a stop at UTTAM NAGAR on the way to Jaipur. It is 80 km from Tanakpur and the fare is ₹100."
	  },
	  {
	    q: "How can I travel from Tanakpur to Gurugaon?",
	    a: "The bus from Tanakpur to Gurugaon stops at MAHIPALPUR which is 379 km away and costs ₹590."
	  },
	  {
	    q: "Distance from Tanakpur to MANIYAWALA while going to Chanigarh sector 17?",
	    a: "You can travel to MANIYAWALA on the way to Chanigarh sector 17. It's 192 km from Tanakpur and costs ₹325."
	  },
	  {
	    q: "Distance from Tanakpur to MAHUKH while going to Dharchula?",
	    a: "The bus from Tanakpur to Dharchula stops at MAHUKH which is 110 km away and costs ₹250."
	  },
	  {
	    q: "How can I travel from Tanakpur to Jaipur?",
	    a: "To reach Jaipur, you can stop at BHUMARI, 24 km from Tanakpur. The fare is ₹35."
	  },
	  {
	    q: "What is the fare from Tanakpur to KHATIMA on the Chanigarh sector 17 route?",
	    a: "Yes, there is a stop at KHATIMA on the way to Chanigarh sector 17. It is 25 km from Tanakpur and the fare is ₹40."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to SISAI KHERA on the Haridwar route?",
	    a: "To reach Haridwar, you can stop at SISAI KHERA, 49 km from Tanakpur. The fare is ₹85."
	  },
	  {
	    q: "Distance from Tanakpur to BRIJGHAT while going to Hisar?",
	    a: "Yes, there is a stop at BRIJGHAT on the way to Hisar. It is 248 km from Tanakpur and the fare is ₹405."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to PATAN NAGAR on the Jaipur route?",
	    a: "The distance from Tanakpur to PATAN NAGAR on the Jaipur route is 55 km. Fare is ₹70."
	  },
	  {
	    q: "What's the cost to travel to CHAMARIKHEDA from Tanakpur on Chanigarh sector 17 route?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at CHAMARIKHEDA which is 394 km away and costs ₹655."
	  },
	  {
	    q: "Give me route details from Tanakpur to Jaipur.",
	    a: "The distance from Tanakpur to PILAKNI on the Jaipur route is 233 km. Fare is ₹280."
	  },
	  {
	    q: "Give me route details from Tanakpur to Haridwar.",
	    a: "The bus from Tanakpur to Haridwar stops at PULBATTA which is 80 km away and costs ₹135."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Lucknow.",
	    a: "You can travel to SHAHAJAHANPUR on the way to Lucknow. It's 207 km from Tanakpur and costs ₹290."
	  },
	  {
	    q: "How can I travel from Tanakpur to Gurugaon?",
	    a: "Yes, there is a stop at DHOULLAKUWA on the way to Gurugaon. It is 369 km from Tanakpur and the fare is ₹585."
	  },
	  {
	    q: "What is the fare from Tanakpur to BARRA on the Hisar route?",
	    a: "The bus from Tanakpur to Hisar stops at BARRA which is 69 km away and costs ₹115."
	  },
	  {
	    q: "Give me route details from Tanakpur to Gurugaon.",
	    a: "You can travel to LALPUR KICHHA on the way to Gurugaon. It's 93 km from Tanakpur and costs ₹165."
	  },
	  {
	    q: "Give me route details from Tanakpur to Dharchula.",
	    a: "The distance from Tanakpur to CHIDA on the Dharchula route is 112 km. Fare is ₹255."
	  },
	  {
	    q: "What's the cost to travel to SHUKHI DHANG from Tanakpur on Dharchula route?",
	    a: "To reach Dharchula, you can stop at SHUKHI DHANG, 23 km from Tanakpur. The fare is ₹55."
	  },
	  {
	    q: "Distance from Tanakpur to KUKAS while going to Jaipur?",
	    a: "The bus from Tanakpur to Jaipur stops at KUKAS which is 572 km away and costs ₹660."
	  },
	  {
	    q: "Bus details to reach BIDORA from Tanakpur on way to Hisar?",
	    a: "To reach Hisar, you can stop at BIDORA, 47 km from Tanakpur. The fare is ₹86."
	  },
	  {
	    q: "Distance from Tanakpur to DELHI ANANDVIHAR while going to Hisar?",
	    a: "To reach Hisar, you can stop at DELHI ANANDVIHAR, 340 km from Tanakpur. The fare is ₹575."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to BHOOTPURI on the Chanigarh sector 17 route?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at BHOOTPURI which is 211 km away and costs ₹350."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Chanigarh sector 17.",
	    a: "Yes, there is a stop at KANGDI on the way to Chanigarh sector 17. It is 319 km from Tanakpur and the fare is ₹515."
	  },
	  {
	    q: "How can I travel from Tanakpur to Gurugaon?",
	    a: "The bus from Tanakpur to Gurugaon stops at BHOT which is 133 km away and costs ₹230."
	  },
	  {
	    q: "What's the cost to travel to BANBASA from Tanakpur on Chanigarh sector 17 route?",
	    a: "To reach Chanigarh sector 17, you can stop at BANBASA, 11 km from Tanakpur. The fare is ₹20."
	  },
	  {
	    q: "Give me route details from Tanakpur to Dharchula.",
	    a: "The bus from Tanakpur to Dharchula stops at SADGARH which is 172 km away and costs ₹385."
	  },
	  {
	    q: "Is there a stop at LALPUR KICCHA on the way from Tanakpur to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at LALPUR KICCHA which is 93 km away and costs ₹165."
	  },
	  {
	    q: "What's the cost to travel to SAHARANPUR from Tanakpur on Chanigarh sector 17 route?",
	    a: "Yes, there is a stop at SAHARANPUR on the way to Chanigarh sector 17. It is 494 km from Tanakpur and the fare is ₹810."
	  },
	  {
	    q: "Bus details to reach NANAK MATTA from Tanakpur on way to Haridwar?",
	    a: "The distance from Tanakpur to NANAK MATTA on the Haridwar route is 44 km. Fare is ₹80."
	  },
	  {
	    q: "Give me route details from Tanakpur to Chanigarh sector 17.",
	    a: "To reach Chanigarh sector 17, you can stop at SITARGANJ, 54 km from Tanakpur. The fare is ₹95."
	  },
	  {
	    q: "How far is SHIMBHAWALI from Tanakpur on the way to Hisar?",
	    a: "The distance from Tanakpur to SHIMBHAWALI on the Hisar route is 268 km. Fare is ₹435."
	  },
	  {
	    q: "What is the total distance from Tanakpur to Nainital?",
	    a: "The total distance from Tanakpur to Nainital is 161 kilometers"
	  },
	 
	  {
	    q: "Tell me about buses from Tanakpur to Chanigarh sector 17.",
	    a: "You can travel to MANIYAWALA on the way to Chanigarh sector 17. It's 192 km from Tanakpur and costs ₹325."
	  },
	  {
	    q: "What's the cost to travel to DARYAI NHALE from Tanakpur on Jaipur route?",
	    a: "The distance from Tanakpur to DARYAI NHALE on the Jaipur route is 278 km. Fare is ₹330."
	  },
	  {
	    q: "What is the fare from Tanakpur to SINDHOLI on the Lucknow route?",
	    a: "The bus from Tanakpur to Lucknow stops at SINDHOLI which is 335 km away and costs ₹460."
	  },
	  {
	    q: "Give me route details from Tanakpur to Haridwar.",
	    a: "The bus from Tanakpur to Haridwar stops at SHYAMPUR HRD which is 314 km away and costs ₹510."
	  },
	  {
	    q: "How far is CHANDI GHAT PUL HRD from Tanakpur on the way to Haridwar?",
	    a: "The bus from Tanakpur to Haridwar stops at CHANDI GHAT PUL HRD which is 326 km away and costs ₹530."
	  },
	  {
	    q: "How far is GHAT from Tanakpur on the way to Dharchula?",
	    a: "The distance from Tanakpur to GHAT on the Dharchula route is 122 km. Fare is ₹275."
	  },
	  {
	    q: "What is the fare from Tanakpur to UTTAM NAGAR on the Jaipur route?",
	    a: "You can travel to UTTAM NAGAR on the way to Jaipur. It's 80 km from Tanakpur and costs ₹100."
	  },
	  {
	    q: "What is the fare from Tanakpur to BAREILY SATELITE on the Lucknow route?",
	    a: "To reach Lucknow, you can stop at BAREILY SATELITE, 118 km from Tanakpur. The fare is ₹170."
	  },
	  {
	    q: "What is the fare from Tanakpur to AMOURI on the Dharchula route?",
	    a: "The distance from Tanakpur to AMOURI on the Dharchula route is 46 km. Fare is ₹105."
	  },
	  {
	    q: "How can I travel from Tanakpur to Dharchula?",
	    a: "Yes, there is a stop at SHAWALA on the way to Dharchula. It is 55 km from Tanakpur and the fare is ₹125."
	  },
	  {
	    q: "Distance from Tanakpur to KICHHA while going to Jaipur?",
	    a: "The bus from Tanakpur to Jaipur stops at KICHHA which is 100 km away and costs ₹120."
	  },
	  {
	    q: "How far is MAJOLA from Tanakpur on the way to Jaipur?",
	    a: "To reach Jaipur, you can stop at MAJOLA, 47 km from Tanakpur. The fare is ₹60."
	  },
	  {
	    q: "How far is MANOHARPUR from Tanakpur on the way to Jaipur?",
	    a: "Yes, there is a stop at MANOHARPUR on the way to Jaipur. It is 537 km from Tanakpur and the fare is ₹620."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Gurugaon.",
	    a: "To reach Gurugaon, you can stop at SISAI KHERA, 49 km from Tanakpur. The fare is ₹85."
	  },
	  {
	    q: "How can I travel from Tanakpur to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at SATSANGBHAWAN which is 408 km away and costs ₹680."
	  },
	  {
	    q: "How can I travel from Tanakpur to Chanigarh sector 17?",
	    a: "Yes, there is a stop at PULBATTA on the way to Chanigarh sector 17. It is 80 km from Tanakpur and the fare is ₹135."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Dharchula.",
	    a: "The distance from Tanakpur to LOHAGHAT on the Dharchula route is 89 km. Fare is ₹200."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to BANLAKE on the Dharchula route?",
	    a: "You can travel to BANLAKE on the way to Dharchula. It's 67 km from Tanakpur and costs ₹150."
	  },
	  {
	    q: "How can I travel from Tanakpur to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at MATHOSHMORE which is 114 km away and costs ₹205."
	  },
	  {
	    q: "How can I travel from Tanakpur to Hisar?",
	    a: "The bus from Tanakpur to Hisar stops at BHOT which is 133 km away and costs ₹230."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Gurugaon.",
	    a: "Yes, there is a stop at DALPATPUR on the way to Gurugaon. It is 164 km from Tanakpur and the fare is ₹285."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Chanigarh sector 17.",
	    a: "You can travel to NAGINA on the way to Chanigarh sector 17. It's 243 km from Tanakpur and costs ₹405."
	  },
	  {
	    q: "How can I travel from Tanakpur to Gurugaon?",
	    a: "To reach Gurugaon, you can stop at KICHHA, 85 km from Tanakpur. The fare is ₹140."
	  },
	  {
	    q: "Give me route details from Tanakpur to Chanigarh sector 17.",
	    a: "To reach Chanigarh sector 17, you can stop at GADARPUR, 118 km from Tanakpur. The fare is ₹210."
	  },
	  {
	    q: "Bus details to reach SHAHAJAHANPUR from Tanakpur on way to Lucknow?",
	    a: "The bus from Tanakpur to Lucknow stops at SHAHAJAHANPUR which is 207 km away and costs ₹290."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to SATSANGBHAWAN on the Chanigarh sector 17 route?",
	    a: "You can travel to SATSANGBHAWAN on the way to Chanigarh sector 17. It's 408 km from Tanakpur and costs ₹680."
	  },
	  {
	    q: "Is there a stop at MAYAD on the way from Tanakpur to Hisar?",
	    a: "To reach Hisar, you can stop at MAYAD, 507 km from Tanakpur. The fare is ₹760."
	  },
	  {
	    q: "Is there a stop at BASTIYA on the way from Tanakpur to Dharchula?",
	    a: "To reach Dharchula, you can stop at BASTIYA, 8 km from Tanakpur. The fare is ₹20."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to HISSAR CANTT on the Hisar route?",
	    a: "The bus from Tanakpur to Hisar stops at HISSAR CANTT which is 514 km away and costs ₹770."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to MAYAD on the Hisar route?",
	    a: "The bus from Tanakpur to Hisar stops at MAYAD which is 507 km away and costs ₹760."
	  },
	  {
	    q: "Is there a stop at BARRA on the way from Tanakpur to Chanigarh sector 17?",
	    a: "Yes, there is a stop at BARRA on the way to Chanigarh sector 17. It is 69 km from Tanakpur and the fare is ₹115."
	  },
	  {
	    q: "Distance from Tanakpur to BHIJGHAT while going to Gurugaon?",
	    a: "The bus from Tanakpur to Gurugaon stops at BHIJGHAT which is 248 km away and costs ₹405."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Haridwar.",
	    a: "The bus from Tanakpur to Haridwar stops at NANAK MATTA which is 44 km away and costs ₹80."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Hisar.",
	    a: "The bus from Tanakpur to Hisar stops at MORADABAD which is 177 km away and costs ₹305."
	  },
	  {
	    q: "How can I travel from Tanakpur to Dharchula?",
	    a: "The distance from Tanakpur to OGLA on the Dharchula route is 198 km. Fare is ₹445."
	  },
	  {
	    q: "How far is SANSKRIT UNIVERSITY from Tanakpur on the way to Chanigarh sector 17?",
	    a: "To reach Chanigarh sector 17, you can stop at SANSKRIT UNIVERSITY, 342 km from Tanakpur. The fare is ₹550."
	  },
	  {
	    q: "Distance from Tanakpur to BIDORA while going to Haridwar?",
	    a: "The distance from Tanakpur to BIDORA on the Haridwar route is 47 km. Fare is ₹85."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to KAMAL PATH on the Gurugaon route?",
	    a: "You can travel to KAMAL PATH on the way to Gurugaon. It's 8 km from Tanakpur and costs ₹15."
	  },
	  {
	    q: "Distance from Tanakpur to JHANSI while going to Jaipur?",
	    a: "The bus from Tanakpur to Jaipur stops at JHANSI which is 30 km away and costs ₹40."
	  },
	  {
	    q: "How far is NANAK MATTA from Tanakpur on the way to Haridwar?",
	    a: "The bus from Tanakpur to Haridwar stops at NANAK MATTA which is 44 km away and costs ₹80."
	  },
	  {
	    q: "What's the cost to travel to DO SADKA HR from Tanakpur on Chanigarh sector 17 route?",
	    a: "To reach Chanigarh sector 17, you can stop at DO SADKA HR, 480 km from Tanakpur. The fare is ₹795."
	  },
	  {
	    q: "What is the fare from Tanakpur to PAAKBARA on the Hisar route?",
	    a: "Yes, there is a stop at PAAKBARA on the way to Hisar. It is 188 km from Tanakpur and the fare is ₹320."
	  },
	  {
	    q: "How can I travel from Tanakpur to Haridwar?",
	    a: "Yes, there is a stop at BHAGUWALA on the way to Haridwar. It is 293 km from Tanakpur and the fare is ₹475."
	  },
	  {
	    q: "How far is SULTANPUR PATTI from Tanakpur on the way to Haridwar?",
	    a: "The distance from Tanakpur to SULTANPUR PATTI on the Haridwar route is 142 km. Fare is ₹245."
	  },
	  {
	    q: "Bus details to reach CHAKRAPUR from Tanakpur on way to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at CHAKRAPUR which is 18 km away and costs ₹30."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to BILKHET on the Dharchula route?",
	    a: "Yes, there is a stop at BILKHET on the way to Dharchula. It is 41 km from Tanakpur and the fare is ₹95."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Dharchula.",
	    a: "The distance from Tanakpur to DHUGATOL on the Dharchula route is 229 km. Fare is ₹515."
	  },
	  {
	    q: "Bus details to reach YAMUNA BRIDGE from Tanakpur on way to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at YAMUNA BRIDGE which is 438 km away and costs ₹720."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Haridwar.",
	    a: "To reach Haridwar, you can stop at KHATIMA, 25 km from Tanakpur. The fare is ₹40."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to TOTANOLA on the Dharchula route?",
	    a: "To reach Dharchula, you can stop at TOTANOLA, 168 km from Tanakpur. The fare is ₹380."
	  },  {
	    q: "Can you tell me the distance and fare from Tanakpur to HISSAR CANTT on the Hisar route?",
	    a: "The bus from Tanakpur to Hisar stops at HISSAR CANTT which is 514 km away and costs ₹770."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to MAYAD on the Hisar route?",
	    a: "The bus from Tanakpur to Hisar stops at MAYAD which is 507 km away and costs ₹760."
	  },
	  {
	    q: "Is there a stop at BARRA on the way from Tanakpur to Chanigarh sector 17?",
	    a: "Yes, there is a stop at BARRA on the way to Chanigarh sector 17. It is 69 km from Tanakpur and the fare is ₹115."
	  },
	  {
	    q: "Distance from Tanakpur to BHIJGHAT while going to Gurugaon?",
	    a: "The bus from Tanakpur to Gurugaon stops at BHIJGHAT which is 248 km away and costs ₹405."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Haridwar.",
	    a: "The bus from Tanakpur to Haridwar stops at NANAK MATTA which is 44 km away and costs ₹80."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Hisar.",
	    a: "The bus from Tanakpur to Hisar stops at MORADABAD which is 177 km away and costs ₹305."
	  },
	  {
	    q: "How can I travel from Tanakpur to Dharchula?",
	    a: "The distance from Tanakpur to OGLA on the Dharchula route is 198 km. Fare is ₹445."
	  },
	  {
	    q: "How far is SANSKRIT UNIVERSITY from Tanakpur on the way to Chanigarh sector 17?",
	    a: "To reach Chanigarh sector 17, you can stop at SANSKRIT UNIVERSITY, 342 km from Tanakpur. The fare is ₹550."
	  },
	  {
	    q: "Distance from Tanakpur to BIDORA while going to Haridwar?",
	    a: "The distance from Tanakpur to BIDORA on the Haridwar route is 47 km. Fare is ₹85."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to KAMAL PATH on the Gurugaon route?",
	    a: "You can travel to KAMAL PATH on the way to Gurugaon. It's 8 km from Tanakpur and costs ₹15."
	  },
	  {
	    q: "Distance from Tanakpur to JHANSI while going to Jaipur?",
	    a: "The bus from Tanakpur to Jaipur stops at JHANSI which is 30 km away and costs ₹40."
	  },
	  {
	    q: "How far is NANAK MATTA from Tanakpur on the way to Haridwar?",
	    a: "The bus from Tanakpur to Haridwar stops at NANAK MATTA which is 44 km away and costs ₹80."
	  },
	
	  {
	    q: "What's the cost to travel to SHYAMPUR HRD from Tanakpur on Chanigarh sector 17 route?",
	    a: "You can travel to SHYAMPUR HRD on the way to Chanigarh sector 17. It's 314 km from Tanakpur and costs ₹510."
	  },
	  {
	    q: "How can I travel from Tanakpur to Chanigarh sector 17?",
	    a: "To reach Chanigarh sector 17, you can stop at SHYAMPUR HRD, 314 km from Tanakpur. The fare is ₹510."
	  },
	  {
	    q: "Bus details to reach GHAZIABAD from Tanakpur on way to Gurugaon?",
	    a: "Yes, there is a stop at GHAZIABAD on the way to Gurugaon. It is 324 km from Tanakpur and the fare is ₹530."
	  },
	  {
	    q: "What's the cost to travel to IZZER from Tanakpur on Dharchula route?",
	    a: "To reach Dharchula, you can stop at IZZER, 160 km from Tanakpur. The fare is ₹360."
	  },
	  {
	    q: "Is there a stop at CHAKRAPUR on the way from Tanakpur to Gurugaon?",
	    a: "Yes, there is a stop at CHAKRAPUR on the way to Gurugaon. It is 18 km from Tanakpur and the fare is ₹30."
	  },
	  {
	    q: "What's the cost to travel to DHARCHULA from Tanakpur on Dharchula route?",
	    a: "To reach Dharchula, you can stop at DHARCHULA, 247 km from Tanakpur. The fare is ₹560."
	  },
	  {
	    q: "Distance from Tanakpur to KASHIPUR while going to Haridwar?",
	    a: "Yes, there is a stop at KASHIPUR on the way to Haridwar. It is 156 km from Tanakpur and the fare is ₹270."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Haridwar.",
	    a: "You can travel to REHAR on the way to Haridwar. It's 185 km from Tanakpur and costs ₹315."
	  },
	  {
	    q: "How far is GADARPUR from Tanakpur on the way to Chanigarh sector 17?",
	    a: "You can travel to GADARPUR on the way to Chanigarh sector 17. It's 118 km from Tanakpur and costs ₹210."
	  },
	  {
	    q: "What is the fare from Tanakpur to PURENT on the Haridwar route?",
	    a: "The distance from Tanakpur to PURENT on the Haridwar route is 236 km. Fare is ₹385."
	  },
	  {
	    q: "hi",
	    a: "Hello! How can I assist you today?"
	  },
	  {
	    q: "Just wanted to chat. How's your day going?",
	    a: "I'm here and ready to help! What's on your mind?"
	  },
	  {
	    q: "Can you tell me a fun fact?",
	    a: "Sure! Did you know that honey never spoils? Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old and still perfectly edible."
	  },
	  {
	    q: "That's fascinating! What's the weather like today?",
	    a: "I don't have real-time data, but you can check a reliable weather website or app for the most accurate information."
	  },
	  
	  {
	    q: "Haha, that's a good one. Thanks! By the way, do you know any fun facts?",
	    a: "Absolutely! Did you know that honey never spoils? Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old and still perfectly edible."
	  },
	  {
	    q: "I'm feeling a bit down. Can you tell me a joke to cheer me up?",
	    a: "Of course! Here's one: Why don't scientists trust atoms? Because they make up everything!"
	  },
	  {
	    q: "Hi there! How's your day going?",
	    a: "Hello! I'm just a computer program, so I don't experience days, but I'm here and ready to assist you. How can I help you today?"
	  },
	  {
	    q: "What is the fare from Tanakpur to AKBARABAD on the Haridwar route?",
	    a: "To reach Haridwar, you can stop at AKBARABAD, 257 km from Tanakpur. The fare is ₹425."
	  },
	  {
	    q: "Distance from Tanakpur to HAFIZGANJ while going to Lucknow?",
	    a: "The distance from Tanakpur to HAFIZGANJ on the Lucknow route is 95 km. Fare is ₹140."
	  },
	  {
	    q: "What's the cost to travel to J B GANJ from Tanakpur on Lucknow route?",
	    a: "You can travel to J B GANJ on the way to Lucknow. It's 247 km from Tanakpur and costs ₹345."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Lucknow.",
	    a: "The distance from Tanakpur to KAMALPATH on the Lucknow route is 8 km. Fare is ₹15."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to GURUNA on the Dharchula route?",
	    a: "The distance from Tanakpur to GURUNA on the Dharchula route is 138 km. Fare is ₹310."
	  },
	  {
	    q: "Bus details to reach MASEET from Tanakpur on way to Chanigarh sector 17?",
	    a: "The distance from Tanakpur to MASEET on the Chanigarh sector 17 route is 123 km. Fare is ₹215."
	  },
	  {
	    q: "What's the cost to travel to BAHRA from Tanakpur on Dharchula route?",
	    a: "Yes, there is a stop at BAHRA on the way to Dharchula. It is 215 km from Tanakpur and the fare is ₹485."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to SANTOLA on the Dharchula route?",
	    a: "You can travel to SANTOLA on the way to Dharchula. It's 108 km from Tanakpur and costs ₹245."
	  },
	  {
	    q: "Is there a stop at TILHAR on the way from Tanakpur to Lucknow?",
	    a: "The distance from Tanakpur to TILHAR on the Lucknow route is 180 km. Fare is ₹255."
	  },
	  {
	    q: "Give me route details from Tanakpur to Hisar.",
	    a: "Yes, there is a stop at PULBATTA on the way to Hisar. It is 80 km from Tanakpur and the fare is ₹135."
	  },
	  {
	    q: "Is there a stop at MANDAWALI on the way from Tanakpur to Haridwar?",
	    a: "You can travel to MANDAWALI on the way to Haridwar. It's 284 km from Tanakpur and costs ₹465."
	  },
	  {
	    q: "What's the cost to travel to MATELA from Tanakpur on Dharchula route?",
	    a: "Yes, there is a stop at MATELA on the way to Dharchula. It is 130 km from Tanakpur and the fare is ₹295."
	  },
	  {
	    q: "How can I travel from Tanakpur to Chanigarh sector 17?",
	    a: "The distance from Tanakpur to REHAR on the Chanigarh sector 17 route is 185 km. Fare is ₹315."
	  },
	  {
	    q: "Distance from Tanakpur to NAGINA while going to Chanigarh sector 17?",
	    a: "To reach Chanigarh sector 17, you can stop at NAGINA, 243 km from Tanakpur. The fare is ₹405."
	  },
	  {
	    q: "Give me route details from Tanakpur to Haridwar.",
	    a: "You can travel to SHERKOT on the way to Haridwar. It's 218 km from Tanakpur and costs ₹360."
	  },
	  {
	    q: "Distance from Tanakpur to PULBATTA while going to Gurugaon?",
	    a: "Yes, there is a stop at PULBATTA on the way to Gurugaon. It is 80 km from Tanakpur and the fare is ₹135."
	  },
	  {
	    q: "Distance from Tanakpur to TOTANOLA while going to Dharchula?",
	    a: "You can travel to TOTANOLA on the way to Dharchula. It's 168 km from Tanakpur and costs ₹380."
	  },
	  {
	    q: "Is there a stop at KHATIMA on the way from Tanakpur to Hisar?",
	    a: "Yes, there is a stop at KHATIMA on the way to Hisar. It is 26 km from Tanakpur and the fare is ₹40."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Chanigarh sector 17.",
	    a: "The distance from Tanakpur to DO SADKA HR on the Chanigarh sector 17 route is 480 km. Fare is ₹795."
	  },
	  {
	    q: "What's the cost to travel to BILKHET from Tanakpur on Dharchula route?",
	    a: "You can travel to BILKHET on the way to Dharchula. It's 41 km from Tanakpur and costs ₹95."
	  },
	  {
	    q: "How can I travel from Tanakpur to Haridwar?",
	    a: "The bus from Tanakpur to Haridwar stops at NANAK SAGAR which is 38 km away and costs ₹65."
	  },
	  {
	    q: "Distance from Tanakpur to AAGORIGA while going to Dharchula?",
	    a: "Yes, there is a stop at AAGORIGA on the way to Dharchula. It is 185 km from Tanakpur and the fare is ₹415."
	  },
	  {
	    q: "How far is BADHEDI from Tanakpur on the way to Chanigarh sector 17?",
	    a: "The distance from Tanakpur to BADHEDI on the Chanigarh sector 17 route is 351 km. Fare is ₹580."
	  },
	  {
	    q: "What's the cost to travel to JHANKAT from Tanakpur on Gurugaon route?",
	    a: "To reach Gurugaon, you can stop at JHANKAT, 33 km from Tanakpur. The fare is ₹60."
	  },
	  {
	    q: "Is there a stop at SULTANPUR PATTI on the way from Tanakpur to Chanigarh sector 17?",
	    a: "You can travel to SULTANPUR PATTI on the way to Chanigarh sector 17. It's 142 km from Tanakpur and costs ₹245."
	  },
	  {
	    q: "How far is KICHHA from Tanakpur on the way to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at KICHHA which is 85 km away and costs ₹140."
	  },
	  {
	    q: "How far is BRIJGHAT from Tanakpur on the way to Hisar?",
	    a: "The bus from Tanakpur to Hisar stops at BRIJGHAT which is 248 km away and costs ₹405."
	  },
	  {
	    q: "What's the cost to travel to KHAIRABAD from Tanakpur on Lucknow route?",
	    a: "You can travel to KHAIRABAD on the way to Lucknow. It's 304 km from Tanakpur and costs ₹420."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Haridwar.",
	    a: "The distance from Tanakpur to SISAI KHERA on the Haridwar route is 49 km. Fare is ₹85."
	  },
	  {
	    q: "Bus details to reach KHATIMA from Tanakpur on way to Haridwar?",
	    a: "Yes, there is a stop at KHATIMA on the way to Haridwar. It is 25 km from Tanakpur and the fare is ₹40."
	  },
	  {
	    q: "Distance from Tanakpur to PUNJAB BORDER while going to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at PUNJAB BORDER which is 520 km away and costs ₹840."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Gurugaon.",
	    a: "The distance from Tanakpur to LALPUR KICHHA on the Gurugaon route is 93 km. Fare is ₹165."
	  },
	  {
	    q: "How can I travel from Tanakpur to Chanigarh sector 17?",
	    a: "To reach Chanigarh sector 17, you can stop at CHAMARIKHEDA, 394 km from Tanakpur. The fare is ₹655."
	  },
	  {
	    q: "Is there a stop at MARODAKHAN on the way from Tanakpur to Dharchula?",
	    a: "Yes, there is a stop at MARODAKHAN on the way to Dharchula. It is 95 km from Tanakpur and the fare is ₹215."
	  },
	  {
	    q: "Bus details to reach GALATI from Tanakpur on way to Dharchula?",
	    a: "You can travel to GALATI on the way to Dharchula. It's 246 km from Tanakpur and costs ₹550."
	  },
	  {
	    q: "How far is SITARGANJ from Tanakpur on the way to Gurugaon?",
	    a: "You can travel to SITARGANJ on the way to Gurugaon. It's 54 km from Tanakpur and costs ₹95."
	  },
	  {
	    q: "Give me route details from Tanakpur to Lucknow.",
	    a: "The bus from Tanakpur to Lucknow stops at MAAHOLJ which is 273 km away and costs ₹380."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Chanigarh sector 17.",
	    a: "Yes, there is a stop at NANAK SAGAR on the way to Chanigarh sector 17. It is 38 km from Tanakpur and the fare is ₹65."
	  },
	    {
	    q: "What's the cost to travel to JHANKAT from Tanakpur on Gurugaon route?",
	    a: "To reach Gurugaon, you can stop at JHANKAT, 33 km from Tanakpur. The fare is ₹60."
	  },
	  {
	    q: "Is there a stop at SULTANPUR PATTI on the way from Tanakpur to Chanigarh sector 17?",
	    a: "You can travel to SULTANPUR PATTI on the way to Chanigarh sector 17. It's 142 km from Tanakpur and costs ₹245."
	  },
	  {
	    q: "How far is KICHHA from Tanakpur on the way to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at KICHHA which is 85 km away and costs ₹140."
	  },
	  {
	    q: "How far is BRIJGHAT from Tanakpur on the way to Hisar?",
	    a: "The bus from Tanakpur to Hisar stops at BRIJGHAT which is 248 km away and costs ₹405."
	  },
	  {
	    q: "What is the fare from Tanakpur to SANTOLA on the Dharchula route?",
	    a: "The bus from Tanakpur to Dharchula stops at SANTOLA which is 108 km away and costs ₹245."
	  },
	  {
	    q: "Is there a stop at KICHHA on the way from Tanakpur to Chanigarh sector 17?",
	    a: "Yes, there is a stop at KICHHA on the way to Chanigarh sector 17. It is 85 km from Tanakpur and the fare is ₹140."
	  },
	  {
	    q: "Is there a stop at SITARGANJ on the way from Tanakpur to Gurugaon?",
	    a: "To reach Gurugaon, you can stop at SITARGANJ, 54 km from Tanakpur. The fare is ₹95."
	  },
	  {
	    q: "How can I travel from Tanakpur to Lucknow?",
	    a: "Yes, there is a stop at LALORIKHERA on the way to Lucknow. It is 72 km from Tanakpur and the fare is ₹110."
	  },
	  {
	    q: "Give me route details from Tanakpur to Lucknow.",
	    a: "Yes, there is a stop at LUCKNOW on the way to Lucknow. It is 387 km from Tanakpur and the fare is ₹540."
	  },
	  {
	    q: "Distance from Tanakpur to BILASPUR while going to Hisar?",
	    a: "The bus from Tanakpur to Hisar stops at BILASPUR which is 118 km away and costs ₹210."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to SHERKOT on the Chanigarh sector 17 route?",
	    a: "Yes, there is a stop at SHERKOT on the way to Chanigarh sector 17. It is 218 km from Tanakpur and the fare is ₹360."
	  },
	  {
	    q: "What's the cost to travel to JOYA from Tanakpur on Hisar route?",
	    a: "You can travel to JOYA on the way to Hisar. It's 208 km from Tanakpur and costs ₹345."
	  },
	  {
	    q: "how can i travel from tanakpur to jaipur?",
	    a: "Yes, there is a stop at BHILASPUR on the way to Jaipur. It is 90 km from Tanakpur and the fare is ₹110."
	  },
	  {
	    q: "Bus details to reach JOYA from Tanakpur on way to Gurugaon?",
	    a: "The distance from Tanakpur to JOYA on the Gurugaon route is 208 km. Fare is ₹345."
	  },
	  {
	    q: "Distance from Tanakpur to SISAI KHERA while going to Gurugaon?",
	    a: "To reach Gurugaon, you can stop at SISAI KHERA, 49 km from Tanakpur. The fare is ₹85."
	  },
	  {
	    q: "Is there a stop at MANIYAWALA on the way from Tanakpur to Chanigarh sector 17?",
	    a: "Yes, there is a stop at MANIYAWALA on the way to Chanigarh sector 17. It is 192 km from Tanakpur and the fare is ₹325."
	  },
	  {
	    q: "Bus details to reach J B GANJ from Tanakpur on way to Lucknow?",
	    a: "Yes, there is a stop at J B GANJ on the way to Lucknow. It is 247 km from Tanakpur and the fare is ₹345."
	  },
	  {
	    q: "What's the cost to travel to BILASPUR from Tanakpur on Jaipur route?",
	    a: "To reach Jaipur, you can stop at BILASPUR, 161 km from Tanakpur. The fare is ₹190."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Chanigarh sector 17.",
	    a: "The distance from Tanakpur to JASPUR on the Chanigarh sector 17 route is 175 km. Fare is ₹300."
	  },
	  {
	    q: "Distance from Tanakpur to SHAHAJANPUR while going to Jaipur?",
	    a: "You can travel to SHAHAJANPUR on the way to Jaipur. It's 445 km from Tanakpur and costs ₹520."
	  },
	  {
	    q: "What is the fare from Tanakpur to MAGALGANJ on the Lucknow route?",
	    a: "You can travel to MAGALGANJ on the way to Lucknow. It's 258 km from Tanakpur and costs ₹360."
	  },
	  {
	    q: "Distance from Tanakpur to SITARGANJ while going to Hisar?",
	    a: "You can travel to SITARGANJ on the way to Hisar. It's 54 km from Tanakpur and costs ₹95."
	  },
	  {
	    q: "Distance from Tanakpur to BARRA while going to Gurugaon?",
	    a: "Yes, there is a stop at BARRA on the way to Gurugaon. It is 69 km from Tanakpur and the fare is ₹115."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Jaipur.",
	    a: "The distance from Tanakpur to HALDWANI CT CHOKA on the Jaipur route is 118 km. Fare is ₹140."
	  },
	  {
	    q: "Bus details to reach BHOOTPURI from Tanakpur on way to Haridwar?",
	    a: "To reach Haridwar, you can stop at BHOOTPURI, 211 km from Tanakpur. The fare is ₹350."
	  },
	  {
	    q: "Bus details to reach BALUWAKO from Tanakpur on way to Dharchula?",
	    a: "The bus from Tanakpur to Dharchula stops at BALUWAKO which is 234 km away and costs ₹525."
	  },
	  {
	    q: "How can I travel from Tanakpur to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at HARIDA which is 399 km away and costs ₹670."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to SAHARANPUR on the Chanigarh sector 17 route?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at SAHARANPUR which is 494 km away and costs ₹810."
	  },
	  {
	    q: "How far is BHOOTPURI from Tanakpur on the way to Chanigarh sector 17?",
	    a: "Yes, there is a stop at BHOOTPURI on the way to Chanigarh sector 17. It is 211 km from Tanakpur and the fare is ₹350."
	  },
	  {
	    q: "Distance from Tanakpur to BHAGUWALI while going to Chanigarh sector 17?",
	    a: "The bus from Tanakpur to Chanigarh sector 17 stops at BHAGUWALI which is 293 km away and costs ₹475."
	  },
	  {
	    q: "Is there a stop at NAZIBABAD on the way from Tanakpur to Haridwar?",
	    a: "To reach Haridwar, you can stop at NAZIBABAD, 270 km from Tanakpur. The fare is ₹445."
	  },
	  {
	    q: "Tell me about buses from Tanakpur to Chanigarh sector 17.",
	    a: "Yes, there is a stop at SHERKOT on the way to Chanigarh sector 17. It is 218 km from Tanakpur and the fare is ₹360."
	  },
	  {
	    q: "Can you tell me the distance and fare from Tanakpur to BIDORA on the Gurugaon route?",
	    a: "You can travel to BIDORA on the way to Gurugaon. It's 47 km from Tanakpur and costs ₹85."
	  },
	  {
	    q: "how can i travel from tanakpur to gurugaon?",
	    a: "The bus from Tanakpur to Gurugaon stops at CHAKRAPUR which is 18 km away and costs ₹30."
	  },
	  {
	    q: "bus details to reach kASHIPUR from tanakpur on way to haridwar?",
	    a: "Yes, there is a stop at KASHIPUR on the way to Haridwar. It is 156 km from Tanakpur and the fare is ₹270."
	  },
	  {
	    q: "Bus details to reach CHARCHAM from Tanakpur on way to Dharchula?",
	    a: "The distance from Tanakpur to CHARCHAM on the Dharchula route is 239 km. Fare is ₹535."
	  },
	  {
	    q: "distance to bastiya?",
	    a: "Bastiya is 8 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at bastiya?",
	    a: "yes, there is a stop at Bastiya."
	  },
	  {
	    q: "fare to shukhi dhang?",
	    a: "the fare to Shukhi Dhang is ₹55."
	  },
	  {
	    q: "distance to shukhi dhang?",
	    a: "Shukhi Dhang is 23 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at shukhi dhang?",
	    a: "yes, there is a stop at Shukhi Dhang."
	  },
	  {
	    q: "fare to sinnyari?",
	    a: "the fare to Sinnyari is ₹70."
	  },
	  {
	    q: "distance to sinnyari?",
	    a: "Sinnyari is 30 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at sinnyari?",
	    a: "yes, there is a stop at Sinnyari."
	  },
	  {
	    q: "fare to chalti?",
	    a: "the fare to Chalti is ₹80."
	  },
	  {
	    q: "distance to chalti?",
	    a: "Chalti is 36 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at chalti?",
	    a: "yes, there is a stop at Chalti."
	  },
	  {
	    q: "fare to bilkhet?",
	    a: "the fare to Bilkhet is ₹95."
	  },
	  {
	    q: "distance to bilkhet?",
	    a: "Bilkhet is 41 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at bilkhet?",
	    a: "yes, there is a stop at Bilkhet."
	  },
	  {
	    q: "fare to amouri?",
	    a: "the fare to Amouri is ₹105."
	  },
	  {
	    q: "distance to amouri?",
	    a: "Amouri is 46 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at amouri?",
	    a: "yes, there is a stop at Amouri."
	  },
	  {
	    q: "fare to shawala?",
	    a: "the fare to Shawala is ₹125."
	  },
	  {
	    q: "distance to shawala?",
	    a: "Shawala is 55 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at shawala?",
	    a: "yes, there is a stop at Shawala."
	  },
	  {
	    q: "fare to dhon?",
	    a: "the fare to Dhon is ₹140."
	  },
	  {
	    q: "distance to dhon?",
	    a: "Dhon is 63 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at dhon?",
	    a: "yes, there is a stop at Dhon."
	  },
	  {
	    q: "fare to banlake?",
	    a: "the fare to Banlake is ₹150."
	  },
	  {
	    q: "distance to banlake?",
	    a: "Banlake is 67 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at banlake?",
	    a: "yes, there is a stop at Banlake."
	  },
	  {
	    q: "fare to fulargaun?",
	    a: "the fare to Fulargaun is ₹160."
	  },
	  {
	    q: "distance to fulargaun?",
	    a: "Fulargaun is 71 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at fulargaun?",
	    a: "yes, there is a stop at Fulargaun."
	  },
	  {
	    q: "fare to champawat?",
	    a: "the fare to Champawat is ₹170."
	  },
	  {
	    q: "distance to champawat?",
	    a: "Champawat is 75 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at champawat?",
	    a: "yes, there is a stop at Champawat."
	  },
	  {
	    q: "fare to lohaghat?",
	    a: "the fare to Lohaghat is ₹200."
	  },
	  {
	    q: "distance to lohaghat?",
	    a: "Lohaghat is 89 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at lohaghat?",
	    a: "yes, there is a stop at Lohaghat."
	  },
	  {
	    q: "fare to pithoragarh?",
	    a: "the fare to Pithoragarh is ₹340."
	  },
	  {
	    q: "distance to pithoragarh",
	    a: "Pithoragarh is 151 km from Tanakpur."
	  },
	  {
	    q: "is there a stop at pithoragarh?",
	    a: "yes, there is a stop at Pithoragarh."
	  },
	  {
	      q: "hi",
	      a: "hello! how can i help you today?"
	    },
	    {
	      q: "hello",
	      a: "hi there! looking for a bus or route info?"
	    },
	    {
	      q: "good morning",
	      a: "good morning! how can i assist you?"
	    },
	    {
	      q: "good evening",
	      a: "good evening! need help with a booking?"
	    },
	    {
	      q: "how to book a seat?",
	      a: "you can book through our app or website by selecting your route and paying online."
	    },
	    {
	      q: "can i cancel my ticket?",
	      a: "yes, you can cancel your ticket through our platform before departure time."
	    },
	    {
	      q: "how to check seat availability?",
	      a: "check seat availability on our website/app under your selected route."
	    },
	    {
	      q: "is this bus ac?",
	      a: "some buses are ac. please check the route details while booking."
	    },
	    {
	      q: "what is the luggage limit?",
	      a: "you can carry up to 20kg. for more, extra charges may apply."
	    },
	    {
	      q: "are pets allowed?",
	      a: "no, pets are not allowed in the bus."
	    },
	    {
	      q: "can i pay by upi?",
	      a: "yes, we accept UPI, cards, and net banking."
	    },
	    {
	      q: "do i get a receipt?",
	      a: "yes, a receipt is sent to your phone and email after payment."
	    },
	    {
	      q: "how to get support?",
	      a: "contact our helpline or use the chat support on our app."
	    },
	    {
	      q: "do you run buses on holidays?",
	      a: "yes, our services operate daily, including holidays."
	    },
	    {
	      q: "what if bus is late?",
	      a: "you’ll be notified via sms/app if there’s a delay."
	    },
	    {
	      q: "can i board from mid-point?",
	      a: "yes, select your boarding stop during booking."
	    },
	    {
	      q: "are student discounts available?",
	      a: "not yet, but we’re working on introducing student passes soon."
	    },
	    {
	      q: "can i travel without id?",
	      a: "you must carry a valid id to board the bus."
	    },
	    {
	      q: "can i pay cash?",
	      a: "yes, cash is accepted for offline bookings."
	    },
	    {
	      q: "how many seats in the bus?",
	      a: "our buses have 40 to 52 seats depending on the model."
	    },
	    {
	      q: "is there a break during the trip?",
	      a: "yes, long-distance buses take scheduled rest stops."
	    },
	  {
	      q: "what is the price of ticket from tanakpur to kamal path?",
	      a: "the price of ticket to KAMAL PATH is ₹15."
	    },
	    {
	      q: "what is the price of ticket from tanakpur to banbasa?",
	      a: "the price of ticket to BANBASA is ₹20."
	    },
	    {
	      q: "what is the price of ticket from tanakpur to chakrapur?",
	      a: "the price of ticket to CHAKRAPUR is ₹30."
	    },
	    {
	      q: "what is the price of ticket from tanakpur to khatima?",
	      a: "the price of ticket to KHATIMA is ₹40."
	    },
		
	    {
	      q: "what is the price of ticket from tanakpur to jhankat?",
	      a: "the price of ticket to JHANKAT is ₹60."
	    },
	    {
	      q: "what is the price of ticket from tanakpur to nanak sagar?",
	      a: "the price of ticket to NANAK SAGAR is ₹65."
	    },
	    {
	      q: "what is the price of ticket from tanakpur to nanak matta?",
	      a: "the price of ticket to NANAK MATTA is ₹80."
	    },
	    {
	      q: "what is the price of ticket from tanakpur to bidora?",
	      a: "the price of ticket to BIDORA is ₹85."
	    },
	    {
	      q: "what is the price of ticket from tanakpur to sisai khera?",
	      a: "the price of ticket to SISAI KHERA is ₹85."
	    },
	    {
	      q: "what is the price of ticket from tanakpur to sitarganj?",
	      a: "the price of ticket to SITARGANJ is ₹95."
	    },
	    {
	        q: "what is the price of ticket from tanakpur to kamal path?",
	        a: "the price of ticket to KAMAL PATH is ₹15."
	      },
	      {
	        q: "what is the price of ticket from tanakpur to banbasa?",
	        a: "the price of ticket to BANBASA is ₹20."
	      },
	      {
	        q: "what is the price of ticket from tanakpur to chakrapur?",
	        a: "the price of ticket to CHAKRAPUR is ₹30."
	      },
	      {
	        q: "what is the price of ticket from tanakpur to khatima?",
	        a: "the price of ticket to KHATIMA is ₹40."
	      },
	      {
	        q: "what is the price of ticket from tanakpur to jhankat?",
	        a: "the price of ticket to JHANKAT is ₹60."
	      },
	      {
	        q: "how far is chakrapur from tanakpur by bus?",
	        a: "the distance from Tanakpur to CHAKRAPUR is approximately 20 kilometers."
	      },
	      {
	        q: "what is the bus route from tanakpur to khatima?",
	        a: "the bus goes from Tanakpur to KHATIMA with stops in between."
	      },
	  	{
	  	    q: "ticket from tanakpur to kamal path",
	  	    a: "the price of ticket to KAMAL PATH is ₹15."
	  	  },
	  	  {
	  	    q: "distance from tanakpur to kamal path",
	  	    a: "the distance from Tanakpur to KAMAL PATH is approximately 8 kilometers."
	  	  },
	  	  {
	  	    q: "price from tanakpur to kamal path",
	  	    a: "the price of ticket to KAMAL PATH is ₹15."
	  	  },
	  	  {
	  	    q: "ticket from tanakpur to banbasa",
	  	    a: "the price of ticket to BANBASA is ₹20."
	  	  },
	  	  {
	  	    q: "distance from tanakpur to banbasa",
	  	    a: "the distance from Tanakpur to BANBASA is approximately 11 kilometers."
	  	  },
	  	  {
	  	    q: "price from tanakpur to banbasa",
	  	    a: "the price of ticket to BANBASA is ₹20."
	  	  },
	  	  {
	  	    q: "ticket from tanakpur to chakrapur",
	  	    a: "the price of ticket to CHAKRAPUR is ₹30."
	  	  },
	  	  {
	  	    q: "distance from tanakpur to chakrapur",
	  	    a: "the distance from Tanakpur to CHAKRAPUR is approximately 18 kilometers."
	  	  },
	  	  {
	  	    q: "price from tanakpur to chakrapur",
	  	    a: "the price of ticket to CHAKRAPUR is ₹30."
	  	  },
	  	  {
	  	    q: "ticket from tanakpur to khatima",
	  	    a: "the price of ticket to KHATIMA is ₹40."
	  	  }		,
	  	  {
	  	    q: "distance from tanakpur to kamal path",
	  	    a: "the distance from Tanakpur to KAMAL PATH is approximately 8 kilometers."
	  	  },
	  	  {
	  	    q: "price from tanakpur to kamal path",
	  	    a: "the price of ticket to KAMAL PATH is ₹15."
	  	  },
	  	  {
	  	    q: "what is the price of ticket from tanakpur to banbasa?",
	  	    a: "the price of ticket to BANBASA is ₹20."
	  	  },
	  	  {
	  	    q: "how far is banbasa from tanakpur by bus?",
	  	    a: "the distance from Tanakpur to BANBASA is approximately 11 kilometers."
	  	  },
	  	  {
	  	    q: "what is the bus route from tanakpur to banbasa?",
	  	    a: "the bus goes from Tanakpur to BANBASA with stops in between."
	  	  },
	  	  {
	  	    q: "ticket from tanakpur to banbasa",
	  	    a: "the price of ticket to BANBASA is ₹20."
	  	  },
	  	  {
	  	    q: "distance from tanakpur to banbasa",
	  	    a: "the distance from Tanakpur to BANBASA is approximately 11 kilometers."
	  	  },
	  	  {
	  	    q: "price from tanakpur to banbasa",
	  	    a: "the price of ticket to BANBASA is ₹20."
	  	  },
	  	  
  ];







function getBotResponse(message) {
  for (const pair of qaPairs) {
    const pattern = new RegExp(pair.q, 'i');
    if (pattern.test(message)) {
      return pair.a;
    }
  }
  return "that's a great question — i'm still learning and will try to cover it soon.";
}



function sendMessage() {
  const input = document.getElementById("userInput");
  const message = input.value.trim();
  if (!message) return;

  const chatBody = document.getElementById("chatBody");

  const userDiv = document.createElement("div");
  userDiv.className = "user-message";
  userDiv.textContent = message;
  chatBody.appendChild(userDiv);

  input.value = "";
  chatBody.scrollTop = chatBody.scrollHeight;

  setTimeout(() => {
    const botDiv = document.createElement("div");
    botDiv.className = "bot-message";
    botDiv.textContent = getBotResponse(message);
    chatBody.appendChild(botDiv);
    chatBody.scrollTop = chatBody.scrollHeight;
  }, 600);
  
}




