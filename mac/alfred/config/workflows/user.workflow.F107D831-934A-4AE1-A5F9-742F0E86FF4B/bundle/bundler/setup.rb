require 'rbconfig'
# ruby 1.8.7 doesn't define RUBY_ENGINE
ruby_engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'
ruby_version = RbConfig::CONFIG["ruby_version"]
path = File.expand_path('..', __FILE__)
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/fuzzy_match-2.1.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/builder-3.2.4/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/gyoku-1.3.1/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/moneta-1.4.1/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/nori-2.6.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/plist-3.6.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/terminal-notifier-2.0.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/alfred-workflow-2.0.5/lib"
$:.unshift "#{path}/"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/chef-utils-16.9.32/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/mixlib-shellout-3.2.2/lib"
