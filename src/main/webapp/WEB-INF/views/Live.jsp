
<%@page import="entity.live"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <title>Map Page</title>
  
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #fff5e6;
    }

    .login-wrapper {
      width: 100%;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #fff5e6;
      padding: 20px;
      flex-direction: column;
    }

    .login-box {
      background: white;
      padding: 40px 30px;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      width: 100%;
      max-width: 400px;
      margin-bottom: 30px;
    }

    .login-box h2 {
      margin-bottom: 25px;
      color: #f57c00;
      font-size: 24px;
      text-align: center;
      font-weight: 700;
    }

    .login-box input {
      width: 100%;
      padding: 12px 15px;
      margin: 10px 0;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 15px;
    }

    .login-box button {
      width: 100%;
      padding: 12px;
      background-color: #f57c00;
      color: white;
      border: none;
      border-radius: 25px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s;
      margin-top: 15px;
    }

    .login-box button:hover {
      background-color: #e65100;
      transform: translateY(-1px);
    }

    .login-box .link {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
    }

    .login-box .link a {
      color: #f57c00;
      font-weight: 600;
    }

    .map-container {
      width: 100%;
      max-width: 800px;
      height: 400px;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      padding: 0 20px;
      margin-bottom: 20px;
    }

    .map-section {
      background-color: #fff;
      border-radius: 15px;
      padding: 10px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    }

    .map-frame {
      width: 100%;
      height: 200px;
      border-radius: 15px;
      overflow: hidden;
    }

    .map-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    a {
      text-decoration: none;
      color: #555;
    }

    /* New CSS for Bus Info Section */
    .bus-info-box {
      width: 100%;
      max-width: 600px;
      background-color: #ffffff;
      border-radius: 15px;
      padding: 20px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      margin-bottom: 30px;
    }

    .bus-info-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 12px;
      font-size: 16px;
      color: #333;
    }

    .bus-info-item h4 {
      margin: 0;
      font-weight: 600;
      color: #f57c00;
    }

    .bus-info-item span {
      color: #444;
      font-weight: 500;
    }
  </style>
</head>
<body>
  <div class="login-wrapper">
    
    <% int id=(int)request.getAttribute("id"); 
    %>
    
    <div class="login-box">
      <h2>Enter a pnr number</h2>
      <form action="Detail"  method="get">
      <input type="number" placeholder="Bus PNR Number" name="PNR">
      <button type="submit">Details</button>
      </form>

      <div class="link">
        <a href="#">Need help?</a>
      </div>
    </div>
    
    <% if(id>0){
    	
    	List<live>	li=( List<live>)request.getAttribute("listdata");
    	for( live ele:li){
    	%>
    <div class="bus-info-box">
      <div class="bus-info-item">
        <h4>ID</h4><span>
        <%=ele.getId() %>
        </span>
      </div>
      <div class="bus-info-item">
        <h4>Bus Number</h4><span>
        <%=ele.getBusnumber() %>
         </span>
      </div>
      <div class="bus-info-item">
        <h4>Bus Type</h4><span>
        <%=ele.getBustype() %>
        </span>
      </div>
      <div class="bus-info-item">
        <h4>Total Seats</h4><span>
        <%=ele.getTotal_seats() %>
        </span>
      </div>
      <div class="bus-info-item">
        <h4>Driver Name</h4><span>
        <%=ele.getDriver_name() %>
        </span>
      </div>
      <div class="bus-info-item">
        <h4>Conductor Name</h4><span>
        <%=ele.getConductor_name() %>
        </span>
      </div>
      
    </div>
    
    <%} }%>
    
    
    
  </div>
</body>
</html>

