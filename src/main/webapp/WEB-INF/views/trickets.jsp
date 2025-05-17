<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Buy My Tickets / Passes</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #fff5e6;
    }

    .ticket-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }

    .ticket-box {
      background: white;
      padding: 40px 30px;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      width: 100%;
      max-width: 500px;
    }

    .ticket-box h2 {
      margin-bottom: 25px;
      color: #f57c00;
      font-size: 24px;
      text-align: center;
      font-weight: 700;
    }

    .ticket-box label {
      font-weight: 600;
      display: block;
      margin-top: 15px;
      margin-bottom: 5px;
    }

    .ticket-box input,
    .ticket-box select {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 15px;
    }

    .ticket-box button {
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
      margin-top: 25px;
    }

    .ticket-box button:hover {
      background-color: #e65100;
      transform: translateY(-1px);
    }

    @media (max-width: 600px) {
      .ticket-box {
        padding: 30px 20px;
      }
    }
  </style>
</head>
<body>

  <div class="ticket-wrapper">
    <div class="ticket-box">
      <h2>Buy My Tickets / Passes</h2>
      <form action="ticket_pay" method="get">
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter your full name" required />

        <label for="route">Select Route:</label>
        <select id="route" name="route" required>
          <option value="">--Choose a Route--</option>
          <option value="Tanakpur-Chandigarh">Tanakpur → Chandigarh</option>
          <option value="Tanakpur-Dharchula">Tanakpur → Dharchula</option>
        </select>

        <label for="date">Travel Date:</label>
        <input type="date" id="date" name="date" required />

        <label for="type">Ticket Type:</label>
        <select id="type" name="type" required>
          <option value="">--Select Type--</option>
          <option value="single">Single Journey</option>
          <option value="return">Return</option>
          <option value="monthly-pass">Monthly Pass</option>
        </select>

        <label for="seats">Number of Seats:</label>
        <input type="number" id="seats" name="seats" min="1" max="10" required />

        <label for="payment">Payment Method:</label>
        <select id="payment" name="payment" required>
          <option value="upi">UPI</option>
          <option value="card">Credit/Debit Card</option>
          <option value="cash">Cash at Counter</option>
        </select>

        <button type="submit">Buy Now</button>
      </form>
    </div>
  </div>

</body>
</html>
