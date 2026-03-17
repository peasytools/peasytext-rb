# peasytext

[![Gem Version](https://badge.fury.io/rb/peasytext.svg)](https://rubygems.org/gems/peasytext)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Ruby client for the [PeasyText](https://peasytext.com) API -- text case conversion, slug generation, word counting, and encoding utilities with tools for camelCase, snake_case, kebab-case, PascalCase, and more. Zero dependencies beyond Ruby stdlib (Net::HTTP, JSON, URI).

Built from [PeasyText](https://peasytext.com), a comprehensive text processing toolkit offering free online tools for case conversion, slug generation, word counting, and text analysis. The glossary covers text concepts from character encodings to Unicode normalization, while guides explain text processing strategies and encoding best practices.

> **Try the interactive tools at [peasytext.com](https://peasytext.com)** -- [Text Counter](https://peasytext.com/text/text-counter/), [Case Converter](https://peasytext.com/text/text-case-converter/), [Slug Generator](https://peasytext.com/text/slug-generator/), and more.

<p align="center">
  <img src="demo.gif" alt="peasytext demo -- text case conversion, slug generation, and word count tools in Ruby terminal" width="800">
</p>

## Table of Contents

- [Install](#install)
- [Quick Start](#quick-start)
- [What You Can Do](#what-you-can-do)
  - [Text Processing Tools](#text-processing-tools)
  - [Browse Text Reference Content](#browse-text-reference-content)
  - [Search and Discovery](#search-and-discovery)
- [API Client](#api-client)
  - [Available Methods](#available-methods)
- [Learn More About Text Processing](#learn-more-about-text-processing)
- [Also Available](#also-available)
- [Peasy Developer Tools](#peasy-developer-tools)
- [License](#license)

## Install

```bash
gem install peasytext
```

Or add to your Gemfile:

```ruby
gem "peasytext"
```

## Quick Start

```ruby
require "peasytext"

client = PeasyText::Client.new

# List available text tools
tools = client.list_tools
tools["results"].each do |tool|
  puts "#{tool["name"]}: #{tool["description"]}"
end
```

## What You Can Do

### Text Processing Tools

Text transformation is fundamental to software development -- from generating URL-safe slugs for blog posts to converting variable names between camelCase and snake_case during code generation. Case conversion tools handle the mechanical work of transforming text between naming conventions used across programming languages (camelCase in JavaScript, snake_case in Python, kebab-case in CSS). Word counting and character analysis help content authors meet length requirements for SEO titles, meta descriptions, and social media posts.

| Tool | Description | Use Case |
|------|-------------|----------|
| Text Counter | Count words, characters, sentences, and paragraphs | Content length validation, SEO metadata |
| Case Converter | Convert between camelCase, snake_case, kebab-case, PascalCase | Code generation, API field mapping |
| Slug Generator | Create URL-safe slugs from any text input | Blog posts, CMS content, URL routing |

```ruby
require "peasytext"

client = PeasyText::Client.new

# Fetch the case converter tool details
tool = client.get_tool("text-case-converter")
puts "Tool: #{tool["name"]}"           # Case converter tool
puts "Category: #{tool["category"]}"   # Text processing category

# List supported text formats
formats = client.list_formats
formats["results"].each do |fmt|
  puts "#{fmt["name"]} (#{fmt["extension"]}): #{fmt["mime_type"]}"
end
```

Learn more: [Text Counter](https://peasytext.com/text/text-counter/) · [Case Converter](https://peasytext.com/text/text-case-converter/) · [Text Encoding Guide](https://peasytext.com/guides/text-encoding-utf8-ascii/)

### Browse Text Reference Content

The text processing glossary explains key concepts from basic character encodings to advanced Unicode normalization forms. Understanding the difference between ASCII and UTF-8, how byte order marks (BOM) affect file parsing, and when to use URL encoding versus Base64 helps developers handle text data correctly across platforms and programming languages.

| Glossary Term | Description |
|---------------|-------------|
| Slug | URL-safe string derived from a title or phrase, using hyphens and lowercase |
| Case Conversion | Transforming text between naming conventions like camelCase and snake_case |
| UTF-8 | Variable-width character encoding capable of representing all Unicode code points |
| Whitespace | Characters representing horizontal or vertical space in text rendering |

```ruby
# Browse text processing glossary terms programmatically
glossary = client.list_glossary(search: "slugify")
glossary["results"].each do |term|
  puts "#{term["term"]}: #{term["definition"]}" # Text processing concept definition
end

# Read in-depth guides on text encoding and conversion
guides = client.list_guides(category: "text")
guides["results"].each do |guide|
  puts "#{guide["title"]} (#{guide["audience_level"]})" # Guide title and difficulty
end
```

Learn more: [Slug Glossary](https://peasytext.com/glossary/slug/) · [ASCII Glossary](https://peasytext.com/glossary/ascii/) · [Regex Cheat Sheet](https://peasytext.com/guides/regex-cheat-sheet-essential-patterns/)

### Search and Discovery

The unified search endpoint queries across all text tools, glossary terms, guides, and supported formats simultaneously. This is useful for building scripts, documentation search, or automation that needs to discover text processing capabilities.

```ruby
# Search across all text tools, glossary, and guides
results = client.search("slugify")
puts "Found #{results["results"]["tools"].length} tools"
puts "Found #{results["results"]["glossary"].length} glossary terms"
```

Learn more: [BOM Glossary](https://peasytext.com/glossary/bom/) · [Slug Generator](https://peasytext.com/text/slug-generator/) · [All Text Guides](https://peasytext.com/guides/)

## API Client

The client wraps the [PeasyText REST API](https://peasytext.com/developers/) using only Ruby standard library -- no external dependencies.

```ruby
require "peasytext"

client = PeasyText::Client.new
# Or with a custom base URL:
# client = PeasyText::Client.new(base_url: "https://custom.example.com")

# List tools with pagination and filters
tools = client.list_tools(page: 1, limit: 10, search: "case")

# Get a specific tool by slug
tool = client.get_tool("text-case")
puts "#{tool["name"]}: #{tool["description"]}"

# Search across all content
results = client.search("case")
puts "Found #{results["results"]["tools"].length} tools"

# Browse the glossary
glossary = client.list_glossary(search: "slugify")
glossary["results"].each do |term|
  puts "#{term["term"]}: #{term["definition"]}"
end

# Discover guides
guides = client.list_guides(category: "text")
guides["results"].each do |guide|
  puts "#{guide["title"]} (#{guide["audience_level"]})"
end

# List file format conversions
conversions = client.list_conversions(source: "txt")

# Get format details
format = client.get_format("txt")
puts "#{format["name"]} (#{format["extension"]}): #{format["mime_type"]}"
```

### Available Methods

| Method | Description |
|--------|-------------|
| `list_tools` | List tools (paginated, filterable) |
| `get_tool(slug)` | Get tool by slug |
| `list_categories` | List tool categories |
| `list_formats` | List file formats |
| `get_format(slug)` | Get format by slug |
| `list_conversions` | List format conversions |
| `list_glossary` | List glossary terms |
| `get_glossary_term(slug)` | Get glossary term |
| `list_guides` | List guides |
| `get_guide(slug)` | Get guide by slug |
| `list_use_cases` | List use cases |
| `search(query)` | Search across all content |
| `list_sites` | List Peasy sites |
| `openapi_spec` | Get OpenAPI specification |

All list methods accept keyword arguments: `page:`, `limit:`, `category:`, `search:`.

Full API documentation at [peasytext.com/developers/](https://peasytext.com/developers/).
OpenAPI 3.1.0 spec: [peasytext.com/api/openapi.json](https://peasytext.com/api/openapi.json).

## Learn More About Text Processing

- **Tools**: [Text Counter](https://peasytext.com/text/text-counter/) · [Case Converter](https://peasytext.com/text/text-case-converter/) · [Slug Generator](https://peasytext.com/text/slug-generator/) · [All Tools](https://peasytext.com/)
- **Guides**: [Text Encoding Guide](https://peasytext.com/guides/text-encoding-utf8-ascii/) · [Regex Cheat Sheet](https://peasytext.com/guides/regex-cheat-sheet-essential-patterns/) · [All Guides](https://peasytext.com/guides/)
- **Glossary**: [Slug](https://peasytext.com/glossary/slug/) · [ASCII](https://peasytext.com/glossary/ascii/) · [BOM](https://peasytext.com/glossary/bom/) · [All Terms](https://peasytext.com/glossary/)
- **Formats**: [TXT](https://peasytext.com/formats/txt/) · [CSV](https://peasytext.com/formats/csv/) · [All Formats](https://peasytext.com/formats/)
- **API**: [REST API Docs](https://peasytext.com/developers/) · [OpenAPI Spec](https://peasytext.com/api/openapi.json)

## Also Available

| Language | Package | Install |
|----------|---------|---------|
| **Python** | [peasytext](https://pypi.org/project/peasytext/) | `pip install "peasytext[all]"` |
| **TypeScript** | [peasytext](https://www.npmjs.com/package/peasytext) | `npm install peasytext` |
| **Go** | [peasytext-go](https://pkg.go.dev/github.com/peasytools/peasytext-go) | `go get github.com/peasytools/peasytext-go` |
| **Rust** | [peasytext](https://crates.io/crates/peasytext) | `cargo add peasytext` |

## Peasy Developer Tools

Part of the [Peasy Tools](https://peasytools.com) open-source developer ecosystem.

| Package | PyPI | npm | RubyGems | Description |
|---------|------|-----|----------|-------------|
| peasy-pdf | [PyPI](https://pypi.org/project/peasy-pdf/) | [npm](https://www.npmjs.com/package/peasy-pdf) | [Gem](https://rubygems.org/gems/peasy-pdf) | PDF merge, split, rotate, compress -- [peasypdf.com](https://peasypdf.com) |
| peasy-image | [PyPI](https://pypi.org/project/peasy-image/) | [npm](https://www.npmjs.com/package/peasy-image) | [Gem](https://rubygems.org/gems/peasy-image) | Image resize, crop, convert, compress -- [peasyimage.com](https://peasyimage.com) |
| peasy-audio | [PyPI](https://pypi.org/project/peasy-audio/) | [npm](https://www.npmjs.com/package/peasy-audio) | [Gem](https://rubygems.org/gems/peasy-audio) | Audio trim, merge, convert, normalize -- [peasyaudio.com](https://peasyaudio.com) |
| peasy-video | [PyPI](https://pypi.org/project/peasy-video/) | [npm](https://www.npmjs.com/package/peasy-video) | [Gem](https://rubygems.org/gems/peasy-video) | Video trim, resize, thumbnails, GIF -- [peasyvideo.com](https://peasyvideo.com) |
| peasy-css | [PyPI](https://pypi.org/project/peasy-css/) | [npm](https://www.npmjs.com/package/peasy-css) | [Gem](https://rubygems.org/gems/peasy-css) | CSS minify, format, analyze -- [peasycss.com](https://peasycss.com) |
| peasy-compress | [PyPI](https://pypi.org/project/peasy-compress/) | [npm](https://www.npmjs.com/package/peasy-compress) | [Gem](https://rubygems.org/gems/peasy-compress) | ZIP, TAR, gzip compression -- [peasytools.com](https://peasytools.com) |
| peasy-document | [PyPI](https://pypi.org/project/peasy-document/) | [npm](https://www.npmjs.com/package/peasy-document) | [Gem](https://rubygems.org/gems/peasy-document) | Markdown, HTML, CSV, JSON conversion -- [peasyformats.com](https://peasyformats.com) |
| **peasytext** | [PyPI](https://pypi.org/project/peasytext/) | [npm](https://www.npmjs.com/package/peasytext) | [Gem](https://rubygems.org/gems/peasytext) | **Text case conversion, slugify, word count -- [peasytext.com](https://peasytext.com)** |

## License

MIT
