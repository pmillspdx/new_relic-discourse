# name: New Relic RPM
# about: Report performance data to http://www.newrelic.com/
# version: 6.13.0
# authors: Sam Saffron, David Celis, Phil Mills

ENV['NRCONFIG'] = File.expand_path('../newrelic.yml', __FILE__)
gem 'newrelic_rpm', ENV['NEW_RELIC_AGENT_VERSION'] || '6.14.0'

NewRelic::Control.instance.init_plugin config: Rails.configuration

after_initialize do
  ForumsController.newrelic_ignore only: [:status]
end
