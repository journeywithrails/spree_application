# Use this hook to configure devise mailer, warden hooks and so forth. The first
# four configuration values can also be set straight in your models.
Devise.setup do |config|
  config.omniauth :facebook, '120422158041947', '8310cbe81e4c3e7e2b54c770019fef2b', {:client_options => {:ssl => {:ca_path => '/etc/ssl/certs'}}}
end