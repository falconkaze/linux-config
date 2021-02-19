# -*- encoding: utf-8 -*-
# stub: moneta 1.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "moneta".freeze
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/moneta-rb/moneta/issues", "changelog_uri" => "https://github.com/moneta-rb/moneta/blob/v1.4.1/CHANGES", "documentation_uri" => "https://www.rubydoc.info/gems/moneta/1.4.1", "source_code_uri" => "https://github.com/moneta-rb/moneta/tree/v1.4.1" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Mendler".freeze, "Yehuda Katz".freeze, "Hannes Georg".freeze, "Alastair Pharo".freeze]
  s.date = "2020-10-27"
  s.description = "A unified interface to key/value stores".freeze
  s.email = ["mail@daniel-mendler.de".freeze, "wycats@gmail.com".freeze, "hannes.georg@googlemail.com".freeze, "me@asph.dev".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "SPEC.md".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "SPEC.md".freeze]
  s.homepage = "https://github.com/moneta-rb/moneta".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A unified interface to key/value stores, including Redis, Memcached, TokyoCabinet, ActiveRecord and many more".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<parallel_tests>.freeze, ["~> 2.29.2"])
      s.add_development_dependency(%q<rantly>.freeze, ["~> 1.2.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-retry>.freeze, ["~> 0.6.1"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.81.0"])
      s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9.1"])
    else
      s.add_dependency(%q<parallel_tests>.freeze, ["~> 2.29.2"])
      s.add_dependency(%q<rantly>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-retry>.freeze, ["~> 0.6.1"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.81.0"])
      s.add_dependency(%q<timecop>.freeze, ["~> 0.9.1"])
    end
  else
    s.add_dependency(%q<parallel_tests>.freeze, ["~> 2.29.2"])
    s.add_dependency(%q<rantly>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-retry>.freeze, ["~> 0.6.1"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.81.0"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.9.1"])
  end
end
