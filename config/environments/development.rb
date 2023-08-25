require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Configure 'rails notes' to inspect Cucumber files
  config.annotations.register_directories('features')
  config.annotations.register_extensions('feature') { |tag| /#\s*(#{tag}):?\s*(.*)$/ }

  # Settings specified here will take precedence over those in config/application.rb.
  config.hosts << "smartservice.onrender.com"
  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false
  config.action_mailer.show_previews = true



  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  # these options are only needed if you choose smtp delivery
  # config.action_mailer.smtp_settings = {
  #   :address        => 'smtp.gmail.com',
  #   :port           => 587,
  #   :domain         => 'example.com',
  #   :authentication => 'plain',
  #   :user_name      => 'testerails4@gmail.com',
  #   :password       => 'SenhaRails123',
  #   :enable_starttls_auto => true
  # }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "65.55.96.11",
    :port                 => 587,
    :enable_starttls_auto => true,
    :user_name            => "testerails42@outlook.com",
    :password             => "senha123",
    :domain               => 'outlook.com', # Ajuste o domínio para outlook.com
    :authentication       => 'plain',
    :read_timeout         => 30
  }


  # config.action_mailer.smtp_settings = {
  #   address: "smtp.office365.com",
  #   port: 587,
  #   domain: "outlook.com", # Substitua pelo seu domínio
  #   authentication: :login,
  #   user_name: "testerails42@outlook.com", # Substitua pelo seu endereço de email
  #   password: "senha123", # Substitua pela sua senha
  #   enable_starttls_auto: true
  # }


  # config.action_mailer.delivery_method = :mailgun
  # config.action_mailer.mailgun_settings = {
  #   api_key: 'c3943f32eaee171e506348de3e2fbab5-f0e50a42-32540aaa',
  #   domain: 'sandbox2e45dd7a3b7d42af95817057080429bc.mailgun.org'
  # }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
end
