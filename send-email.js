const nodemailer = require('nodemailer');

// SMTP Configuration for Zoho
const transporter = nodemailer.createTransport({
  host: 'smtp.zoho.com', // Use smtp.zoho.eu if you're in the EU
  port: 465, // Use 587 if you want to use STARTTLS
  secure: true, // Set to false if using STARTTLS
  auth: {
    user: 'contact@ittisafur.com', // Your Zoho email
    pass: 'pFG4w8V3DS7J', // Use an app password if 2FA is enabled
  },
});

// Email details
const mailOptions = {
  from: 'contact@ittisafur.com',
  to: 'recipient@example.com', // Replace with your recipient
  subject: 'Test Email from Terminal',
  text: 'Hello, this is a test email sent from the terminal using Zoho SMTP!',
};

// Send the email
transporter.sendMail(mailOptions, (error, info) => {
  if (error) {
    console.log('Error:', error);
  } else {
    console.log('Email sent:', info.response);
  }
});
