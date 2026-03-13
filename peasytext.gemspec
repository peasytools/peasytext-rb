# frozen_string_literal: true

require_relative "lib/peasytext/version"

Gem::Specification.new do |s|
  s.name        = "peasytext"
  s.version     = PeasyText::VERSION
  s.summary     = "Text analysis — case conversion, word count, slugs, encoding"
  s.description = "Text processing library for Ruby — case conversion (camelCase, snake_case, kebab-case, PascalCase), word/character counting, slug generation, Base64/URL encoding. Zero dependencies."
  s.authors     = ["PeasyTools"]
  s.email       = ["hello@peasytools.com"]
  s.homepage    = "https://peasytext.com"
  s.license     = "MIT"
  s.required_ruby_version = ">= 3.0"

  s.files = Dir["lib/**/*.rb"]

  s.metadata = {
    "homepage_uri"      => "https://peasytext.com",
    "source_code_uri"   => "https://github.com/peasytools/peasytext-rb",
    "changelog_uri"     => "https://github.com/peasytools/peasytext-rb/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://peasytext.com",
    "bug_tracker_uri"   => "https://github.com/peasytools/peasytext-rb/issues",
  }
end
