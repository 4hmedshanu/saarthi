from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import SlotSet

# Import the database connector functions
from db_connector import DatabaseConnector, get_bus_routes, get_bus_info


# Action to greet the user
class ActionGreet(Action):
    def name(self) -> Text:
        return "action_greet"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        dispatcher.utter_message(
            text="Hello! I am Uttarakhand Transport Corporation's robot assistant. How can I help you?")
        return []


# Action to say goodbye
class ActionGoodbye(Action):
    def name(self) -> Text:
        return "action_goodbye"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        dispatcher.utter_message(text="Thank you! Have a nice day!")
        return []


# Action to confirm user input
class ActionAffirm(Action):
    def name(self) -> Text:
        return "action_affirm"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        dispatcher.utter_message(text="Alright! I understand.")
        return []


# Action to deny user input
class ActionDeny(Action):
    def name(self) -> Text:
        return "action_deny"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        dispatcher.utter_message(text="Okay, let me know if you need any other information.")
        return []


# Action to list districts
class ActionListDistricts(Action):
    def name(self) -> Text:
        return "action_list_districts"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        # Connect to database and fetch districts
        db = DatabaseConnector()
        if not db.connect():
            dispatcher.utter_message(
                text="Sorry, district information is not available at the moment. Please try again later.")
            return []

        query = "SELECT district_id, district_name, region_type FROM Districts ORDER BY district_name"
        districts = db.execute_query(query)
        db.disconnect()

        if not districts:
            dispatcher.utter_message(text="Sorry, there was a problem retrieving district information.")
            return []

        hilly_districts = []
        plain_districts = []

        for district in districts:
            if district['region_type'].lower() == 'hilly':
                hilly_districts.append(district['district_name'])
            else:
                plain_districts.append(district['district_name'])

        response = "Districts in Uttarakhand:\n\n"
        response += "Hilly Region Districts: " + ", ".join(hilly_districts) + "\n\n"
        response += "Plain Region Districts: " + ", ".join(plain_districts)

        dispatcher.utter_message(text=response)
        return []


# Action to provide district info
class ActionDistrictInfo(Action):
    def name(self) -> Text:
        return "action_district_info"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        district = tracker.get_slot("district")
        if not district:
            dispatcher.utter_message(text="Please provide a district name.")
            return []

        # Connect to database and fetch district info
        db = DatabaseConnector()
        if not db.connect():
            dispatcher.utter_message(text=f"Sorry, information for {district} is not available at the moment.")
            return []

        # Get district info
        query = """
        SELECT d.district_name, d.region_type, d.district_code, d.headquarters, 
               COUNT(dep.depot_id) as depot_count
        FROM Districts d
        LEFT JOIN Depots dep ON d.district_id = dep.district_id
        WHERE d.district_name LIKE %s
        GROUP BY d.district_id
        """
        params = (f"%{district}%",)
        district_info = db.execute_query(query, params)

        # Get depots in district
        query_depots = """
        SELECT depot_name
        FROM Depots
        WHERE district_id = (SELECT district_id FROM Districts WHERE district_name LIKE %s)
        ORDER BY depot_name
        """
        depots = db.execute_query(query_depots, params)

        db.disconnect()

        if not district_info:
            dispatcher.utter_message(text=f"Sorry, no information found for district {district}.")
            return []

        district_data = district_info[0]

        response = f"*Information about {district_data['district_name']} District*\n\n"
        response += f"Region Type: {district_data['region_type']}\n"
        response += f"District Code: {district_data['district_code']}\n"
        response += f"Headquarters: {district_data['headquarters']}\n"
        response += f"Number of Depots: {district_data['depot_count']}\n\n"

        if depots and len(depots) > 0:
            response += "Depots:\n"
            for i, depot in enumerate(depots, 1):
                response += f"{i}. {depot['depot_name']}\n"

        dispatcher.utter_message(text=response)
        return [SlotSet("district", district_data['district_name'])]


# Action to list hilly districts
class ActionHillyDistricts(Action):
    def name(self) -> Text:
        return "action_hilly_districts"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        # Connect to database and fetch hilly districts
        db = DatabaseConnector()
        if not db.connect():
            dispatcher.utter_message(text="Sorry, district information is not available at the moment.")
            return []

        query = "SELECT district_name FROM Districts WHERE region_type = 'Hilly' ORDER BY district_name"
        districts = db.execute_query(query)
        db.disconnect()

        if not districts:
            dispatcher.utter_message(text="Sorry, there was a problem retrieving hilly district information.")
            return []

        district_names = [d['district_name'] for d in districts]
        response = "Hilly districts in Uttarakhand: " + ", ".join(district_names)

        dispatcher.utter_message(text=response)
        return []


# Action to list plain districts
class ActionPlainDistricts(Action):
    def name(self) -> Text:
        return "action_plain_districts"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        # Connect to database and fetch plain districts
        db = DatabaseConnector()
        if not db.connect():
            dispatcher.utter_message(text="Sorry, district information is not available at the moment.")
            return []

        query = "SELECT district_name FROM Districts WHERE region_type = 'Plain' ORDER BY district_name"
        districts = db.execute_query(query)
        db.disconnect()

        if not districts:
            dispatcher.utter_message(text="Sorry, there was a problem retrieving plain district information.")
            return []

        district_names = [d['district_name'] for d in districts]
        response = "Plain districts in Uttarakhand: " + ", ".join(district_names)

        dispatcher.utter_message(text=response)
        return []


# Action to list depots
class ActionListDepots(Action):
    def name(self) -> Text:
        return "action_list_depots"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        # Connect to database and fetch depots
        db = DatabaseConnector()
        if not db.connect():
            dispatcher.utter_message(text="Sorry, depot information is not available at the moment.")
            return []

        query = """
        SELECT d.depot_name, dist.district_name 
        FROM Depots d
        JOIN Districts dist ON d.district_id = dist.district_id
        ORDER BY dist.district_name, d.depot_name
        """

        depots = db.execute_query(query)
        db.disconnect()

        if not depots:
            dispatcher.utter_message(text="Sorry, there was a problem retrieving depot information.")
            return []

        # Group depots by district
        depots_by_district = {}
        for depot in depots:
            district = depot['district_name']
            if district not in depots_by_district:
                depots_by_district[district] = []
            depots_by_district[district].append(depot['depot_name'])

        response = "Uttarakhand Transport Corporation Depots:\n\n"

        for district, depot_list in depots_by_district.items():
            response += f"*{district} District*:\n"
            for i, depot in enumerate(depot_list, 1):
                response += f"{i}. {depot}\n"
            response += "\n"

        dispatcher.utter_message(text=response)
        return []


# Action to provide depot info
class ActionDepotInfo(Action):
    def name(self) -> Text:
        return "action_depot_info"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        depot = tracker.get_slot("depot")
        if not depot:
            dispatcher.utter_message(text="Please provide a depot name.")
            return []

        # Connect to database and fetch depot info
        db = DatabaseConnector()
        if not db.connect():
            dispatcher.utter_message(text=f"Sorry, information for {depot} is not available at the moment.")
            return []

        query = """
        SELECT d.depot_name, d.depot_code, d.address, d.contact_number, 
               d.manager_name, di.district_name
        FROM Depots d
        JOIN Districts di ON d.district_id = di.district_id
        WHERE d.depot_name LIKE %s
        """
        params = (f"%{depot}%",)
        depot_info = db.execute_query(query, params)

        # Get bus count for this depot
        query_buses = """
        SELECT COUNT(*) as bus_count
        FROM bus_info
        WHERE depot_id = (SELECT depot_id FROM Depots WHERE depot_name LIKE %s)
        """
        buses = db.execute_query(query_buses, params)

        # Get routes from this depot
        query_routes = """
        SELECT COUNT(*) as route_count
        FROM BusRoutes
        WHERE depot_id = (SELECT depot_id FROM Depots WHERE depot_name LIKE %s)
        """
        routes = db.execute_query(query_routes, params)

        db.disconnect()

        if not depot_info:
            dispatcher.utter_message(text=f"Sorry, no information found for depot {depot}.")
            return []

        depot_data = depot_info[0]
        bus_count = buses[0]['bus_count'] if buses else 0
        route_count = routes[0]['route_count'] if routes else 0

        response = f"*Information about {depot_data['depot_name']}*\n\n"
        response += f"Depot Code: {depot_data['depot_code']}\n"
        response += f"District: {depot_data['district_name']}\n"
        response += f"Address: {depot_data['address']}\n"
        response += f"Contact Number: {depot_data['contact_number']}\n"
        response += f"Manager: {depot_data['manager_name']}\n"
        response += f"Total Buses: {bus_count}\n"
        response += f"Total Routes: {route_count}\n"

        dispatcher.utter_message(text=response)
        return [SlotSet("depot", depot_data['depot_name'])]


# Action to list routes
class ActionListRoutes(Action):
    def name(self) -> Text:
        return "action_list_routes"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        location = tracker.get_slot("location")

        # Connect to database and fetch routes
        routes = get_bus_routes(from_location=location)

        if not routes:
            if location:
                dispatcher.utter_message(text=f"Sorry, no routes found from {location}.")
            else:
                dispatcher.utter_message(text="Sorry, there was a problem retrieving route information.")
            return []

        # If location is specified, show routes from that location
        if location:
            response = f"*Available routes from {location}*:\n\n"

            # Group routes by destination
            destinations = {}
            for route in routes:
                dest = route['to_location']
                if dest not in destinations:
                    destinations[dest] = []
                destinations[dest].append(route)

            # Sort destinations
            sorted_dests = sorted(destinations.keys())

            for i, dest in enumerate(sorted_dests, 1):
                # Take the first route to each destination for display
                route = destinations[dest][0]
                response += f"{i}. {route['from_location']} to {route['to_location']} "
                response += f"({route['distance_km']} km) "
                response += f"- Departure at {route['departure_time']}\n"

            response += f"\nFor more details, please specify the destination you're interested in."
        else:
            # Show popular routes (limit to 15)
            response = "*Popular Routes*:\n\n"

            # Get unique routes
            unique_routes = {}
            for route in routes:
                key = f"{route['from_location']}_{route['to_location']}"
                if key not in unique_routes:
                    unique_routes[key] = route

            # Convert to list and sort by popularity (assumed by route_id for now)
            route_list = list(unique_routes.values())
            route_list.sort(key=lambda x: x['route_id'])

            # Display top 15 routes
            for i, route in enumerate(route_list[:15], 1):
                response += f"{i}. {route['from_location']} to {route['to_location']} "
                response += f"({route['distance_km']} km)\n"

            response += f"\nFor specific route information, please provide the source and destination locations."

        dispatcher.utter_message(text=response)
        return []


# Action to provide route info
class ActionRouteInfo(Action):
    def name(self) -> Text:
        return "action_route_info"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        from_location = tracker.get_slot("from_location")
        to_location = tracker.get_slot("to_location")

        if not from_location or not to_location:
            dispatcher.utter_message(text="Please provide both source and destination locations.")
            return []

        # Connect to database and fetch specific route info
        routes = get_bus_routes(from_location=from_location, to_location=to_location)

        if not routes or len(routes) == 0:
            dispatcher.utter_message(text=f"Sorry, no direct bus service found from {from_location} to {to_location}.")
            return []

        # Group routes by departure time
        route_times = {}
        for route in routes:
            time = route['departure_time']
            if time not in route_times:
                route_times[time] = []
            route_times[time].append(route)

        response = f"*Bus services from {from_location} to {to_location}*\n\n"
        response += f"Distance: {routes[0]['distance_km']} km\n"
        response += f"Route Code: {routes[0]['route_code']}\n"
        response += f"Route Name: {routes[0]['route_name']}\n\n"

        response += "Bus Schedule:\n"
        # Sort by departure time
        for time in sorted(route_times.keys()):
            route = route_times[time][0]  # Take first bus at this time
            response += f"- Departure: {route['departure_time']}, Arrival: {route['arrival_time']} (Depot: {route['depot_name']})\n"

        # Get bus information for this route
        route_id = routes[0]['route_id']
        buses = get_bus_info(route_id=route_id)

        if buses and len(buses) > 0:
            response += f"\nBuses operating on this route ({len(buses)}):\n"
            for i, bus in enumerate(buses[:5], 1):  # Show max 5 buses
                response += f"{i}. {bus['bus_number']} ({bus['bus_type']}, {bus['total_seats']} seats)\n"
                response += f"   Driver: {bus['driver_name']}, Conductor: {bus['conductor_name']}\n"

            if len(buses) > 5:
                response += f"And {len(buses) - 5} more buses...\n"

        dispatcher.utter_message(text=response)
        return [SlotSet("from_location", from_location), SlotSet("to_location", to_location)]


# Action to provide bus info
class ActionBusInfo(Action):
    def name(self) -> Text:
        return "action_bus_info"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        bus_number = tracker.get_slot("bus_number")
        if not bus_number:
            dispatcher.utter_message(text="Please provide a bus number.")
            return []

        # Connect to database and fetch bus info
        db = DatabaseConnector()
        if not db.connect():
            dispatcher.utter_message(text=f"Sorry, information for bus {bus_number} is not available at the moment.")
            return []

        query = """
        SELECT 
            bi.bus_number, bi.bus_type, bi.total_seats,
            bi.driver_name, bi.conductor_name, bi.registration_date,
            bi.last_serviced, br.from_location, br.to_location,
            br.route_name, d.depot_name, di.district_name
        FROM 
            bus_info bi
        JOIN 
            BusRoutes br ON bi.route_id = br.route_id
        JOIN 
            Depots d ON bi.depot_id = d.depot_id
        JOIN
            Districts di ON d.district_id = di.district_id
        WHERE 
            bi.bus_number = %s
        """
        params = (bus_number,)
        bus_info = db.execute_query(query, params)
        db.disconnect()

        if not bus_info or len(bus_info) == 0:
            dispatcher.utter_message(text=f"Sorry, no information found for bus number {bus_number}.")
            return []

        bus = bus_info[0]

        response = f"*Information about Bus Number {bus['bus_number']}*\n\n"
        response += f"Bus Type: {bus['bus_type']}\n"
        response += f"Total Seats: {bus['total_seats']}\n"
        response += f"Driver's Name: {bus['driver_name']}\n"
        response += f"Conductor's Name: {bus['conductor_name']}\n"
        response += f"Registration Date: {bus['registration_date']}\n"
        response += f"Last Serviced: {bus['last_serviced']}\n\n"

        response += f"Route: {bus['from_location']} to {bus['to_location']} ({bus['route_name']})\n"
        response += f"Depot: {bus['depot_name']}, {bus['district_name']} District"

        dispatcher.utter_message(text=response)
        return [SlotSet("bus_number", bus_number)]


# Action to provide bot capabilities
class ActionBotCapability(Action):
    def name(self) -> Text:
        return "action_bot_capability"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        response = """*I can help you in the following ways:*

1. *District Information:*
   - Show list of all districts
   - Provide information about a specific district
   - List hilly and plain districts

2. *Depot Information:*
   - Show list of all depots
   - Provide information about a specific depot

3. *Route Information:*
   - Show list of popular routes
   - Provide information about buses from a specific location
   - Provide details about bus service between two locations

4. *Bus Information:*
   - Provide details about a specific bus number

You can chat with me in English or Hindi. Please let me know how I can help you."""

        dispatcher.utter_message(text=response)
        return []


# Action to thank
class ActionThanks(Action):
    def name(self) -> Text:
        return "action_thanks"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        dispatcher.utter_message(text="You're welcome! Do you need any other information?")
        return []