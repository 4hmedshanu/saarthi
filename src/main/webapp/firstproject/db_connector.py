import mysql.connector
from mysql.connector import Error
import logging
import os
from dotenv import load_dotenv

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Load environment variables (if available)
try:
    load_dotenv()
except ImportError:
    logger.warning("dotenv package not installed. Using hard-coded credentials.")


class DatabaseConnector:
    def __init__(self, host=None, user=None, password=None, database=None, port=3306):
        """Initialize database connector with connection parameters.

        If not provided, credentials will be loaded from environment variables.

        Args:
            host (str, optional): Database host address
            user (str, optional): Database username
            password (str, optional): Database password
            database (str, optional): Database name
            port (int, optional): Database port number
        """
        # Use provided values or fall back to environment variables or default values
        self.host = host or os.getenv("DB_HOST", "localhost")
        self.user = user or os.getenv("DB_USER", "root")
        self.password = password or os.getenv("DB_PASSWORD", "Ajity279@")
        self.database = database or os.getenv("DB_NAME", "uttarakhand")
        self.port = port or int(os.getenv("DB_PORT", "3306"))
        self.connection = None

    def connect(self):
        """Establish connection to the database.

        Returns:
            bool: True if connection successful, False otherwise
        """
        try:
            # Try to connect to the database
            self.connection = mysql.connector.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database,
                port=self.port
            )

            if self.connection.is_connected():
                db_info = self.connection.get_server_info()
                logger.info(f"Connected to MySQL Server version {db_info}")
                logger.info(f"Connected to MySQL database '{self.database}'")
                return True

        except Error as e:
            logger.error(f"Error connecting to MySQL: {e}")
            return False

        return False

    def disconnect(self):
        """Close the database connection."""
        if self.connection and self.connection.is_connected():
            self.connection.close()
            logger.info("Database connection closed")

    def execute_query(self, query, params=None):
        """Execute a query and return results.

        Args:
            query (str): SQL query to execute
            params (tuple, optional): Parameters for the query

        Returns:
            list: Query results or None if failed
        """
        try:
            if not self.connection or not self.connection.is_connected():
                if not self.connect():
                    return None

            cursor = self.connection.cursor(dictionary=True)
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)

            results = cursor.fetchall()
            cursor.close()
            return results

        except Error as e:
            logger.error(f"Error executing query: {e}")
            return None

    def execute_update(self, query, params=None):
        """Execute an update query (INSERT, UPDATE, DELETE).

        Args:
            query (str): SQL query to execute
            params (tuple, optional): Parameters for the query

        Returns:
            bool: True if successful, False otherwise
        """
        try:
            if not self.connection or not self.connection.is_connected():
                if not self.connect():
                    return False

            cursor = self.connection.cursor()
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)

            self.connection.commit()
            affected_rows = cursor.rowcount
            cursor.close()
            logger.info(f"Query executed successfully, {affected_rows} rows affected")
            return True

        except Error as e:
            logger.error(f"Error executing update: {e}")
            return False


# Helper function to get route information
def get_bus_routes(from_location=None, to_location=None):
    """Get bus routes from database with optional filtering.

    Args:
        from_location (str, optional): Filter by source location
        to_location (str, optional): Filter by destination location

    Returns:
        list: List of route dictionaries or None if failed
    """
    db = DatabaseConnector()

    if not db.connect():
        logger.error("Failed to connect to database")
        return None

    try:
        query = """
        SELECT 
            br.route_id, 
            br.from_location, 
            br.to_location, 
            br.distance_km, 
            br.route_code, 
            br.route_name, 
            TIME_FORMAT(br.starting_time, '%H:%i') as departure_time,
            TIME_FORMAT(br.arrival_time, '%H:%i') as arrival_time,
            d.depot_name,
            di.district_name
        FROM 
            BusRoutes br
        JOIN 
            Depots d ON br.depot_id = d.depot_id
        JOIN 
            Districts di ON d.district_id = di.district_id
        """

        params = []
        where_clauses = []

        if from_location:
            where_clauses.append("br.from_location = %s")
            params.append(from_location)

        if to_location:
            where_clauses.append("br.to_location = %s")
            params.append(to_location)

        if where_clauses:
            query += " WHERE " + " AND ".join(where_clauses)

        results = db.execute_query(query, tuple(params) if params else None)
        db.disconnect()
        return results

    except Exception as e:
        logger.error(f"Error fetching bus routes: {e}")
        db.disconnect()
        return None


# Helper function to get bus information
def get_bus_info(route_id=None):
    """Get bus information for a specific route.

    Args:
        route_id (int, optional): Filter by route ID

    Returns:
        list: List of bus dictionaries or None if failed
    """
    db = DatabaseConnector()

    if not db.connect():
        logger.error("Failed to connect to database")
        return None

    try:
        query = """
        SELECT 
            bi.bus_id, 
            bi.bus_number, 
            bi.bus_type, 
            bi.total_seats,
            bi.driver_name,
            bi.conductor_name,
            bi.registration_date,
            bi.last_serviced,
            br.from_location,
            br.to_location,
            br.route_name,
            d.depot_name
        FROM 
            bus_info bi
        JOIN 
            BusRoutes br ON bi.route_id = br.route_id
        JOIN 
            Depots d ON bi.depot_id = d.depot_id
        """

        params = None
        if route_id:
            query += " WHERE bi.route_id = %s"
            params = (route_id,)

        results = db.execute_query(query, params)
        db.disconnect()
        return results

    except Exception as e:
        logger.error(f"Error fetching bus information: {e}")
        db.disconnect()
        return None


# Example function for testing the connection
def test_connection():
    """Test the database connection and fetch some sample data."""
    db = DatabaseConnector()

    if db.connect():
        print("Database connection successful!")

        # Get some routes
        routes = db.execute_query("SELECT * FROM BusRoutes LIMIT 5")
        if routes:
            print(f"Found {len(routes)} routes:")
            for route in routes:
                print(f"Route: {route['from_location']} to {route['to_location']}")

        db.disconnect()
        return True
    else:
        print("Failed to connect to the database.")
        return False


if __name__ == "__main__":
    # Test the connection
    test_connection()