if %w(production development staging uat).include?(Rails.env)
  Rails.application.config.action_mailer.default_url_options = { host: ENV['EMAIL_HOST'] }
  Rails.application.config.action_mailer.delivery_method = :smtp
  Rails.application.config.action_mailer.smtp_settings = {
    port:                 ENV.fetch('SMTP_PORT', 25),
    authentication:       ENV.fetch('SMTP_AUTHENTICATION', :plain),
    address:              ENV['SMTP_ADDRESS'],
    user_name:            ENV['SMTP_USERNAME'],
    password:             ENV['SMTP_PASSWORD'],
    domain:               ENV['DOMAIN'],
    enable_starttls_auto: true
  }
end
