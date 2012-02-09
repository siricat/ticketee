# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{email_spec}
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Ben Mabey}, %q{Aaron Gibralter}, %q{Mischa Fierer}]
  s.date = %q{2011-06-19}
  s.description = %q{Easily test email in rspec and cucumber}
  s.email = %q{ben@benmabey.com}
  s.extra_rdoc_files = [%q{MIT-LICENSE.txt}, %q{README.rdoc}]
  s.files = [%q{MIT-LICENSE.txt}, %q{README.rdoc}]
  s.homepage = %q{http://github.com/bmabey/email-spec/}
  s.rdoc_options = [%q{--charset=UTF-8}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{email-spec}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Easily test email in rspec and cucumber}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mail>, ["~> 2.2"])
      s.add_runtime_dependency(%q<rspec>, ["~> 2.0"])
    else
      s.add_dependency(%q<mail>, ["~> 2.2"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<mail>, ["~> 2.2"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
  end
end
