Rake::Guardian.configure do |config|
  config.env = %w(development)
  config.tasks = %w(db:purge db:fixtures:load)
end
