TsErrorTest::Application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.active_support.deprecation = :stderr
end
