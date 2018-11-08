ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: ENV['app105794500@heroku.com'],
  password: ENV['piszkim23805'],
  domain: 'heroku.com',
  enable_starttls_auto: true
}
