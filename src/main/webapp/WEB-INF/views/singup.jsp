<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Sign Up | Smart Bus Tracking System</title>
  <link rel="stylesheet" href="style.css" />
  <style>
    .signup-wrapper {
      width: 100%;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #fff5e6;
      padding: 20px;
    }

    .signup-box {
      background: white;
      padding: 40px 30px;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      width: 100%;
      max-width: 450px;
    }

    .signup-box h2 {
      margin-bottom: 25px;
      color: #f57c00;
      font-size: 24px;
      text-align: center;
      font-weight: 700;
    }

    .signup-box input {
      width: 100%;
      padding: 12px 15px;
      margin: 10px 0;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 15px;
    }

    .signup-box button {
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

    .signup-box button:hover {
      background-color: #e65100;
      transform: translateY(-1px);
    }

    .signup-box .link {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
    }

    .signup-box .link a {
      color: #f57c00;
      font-weight: 600;
    }
  </style>
</head>
<body>

  <div class="signup-wrapper">
    <div class="signup-box">
      <h2>Create Account</h2>
      <form>
        <input type="text" placeholder="Full Name" required />
        <input type="email" placeholder="Email Address" required />
        <input type="text" placeholder="Username" required />
        <input type="password" placeholder="Password" required />
        <input type="password" placeholder="Confirm Password" required />
        <button type="submit">Sign Up</button>
        <div class="link">
          Already have an account? <a href="login.html">Login</a>
        </div>
      </form>
    </div>
  </div>

</body>
</html>
