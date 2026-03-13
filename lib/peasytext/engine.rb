# frozen_string_literal: true

require "uri"
require "base64"

module PeasyText
  module_function

  def uppercase(text) = text.upcase
  def lowercase(text) = text.downcase
  def title_case(text) = text.split.map(&:capitalize).join(" ")
  def camel_case(text) = split_words(text).map.with_index { |w, i| i.zero? ? w.downcase : w.capitalize }.join
  def snake_case(text) = split_words(text).map(&:downcase).join("_")
  def kebab_case(text) = split_words(text).map(&:downcase).join("-")
  def pascal_case(text) = split_words(text).map(&:capitalize).join
  def constant_case(text) = split_words(text).map(&:upcase).join("_")
  def dot_case(text) = split_words(text).map(&:downcase).join(".")

  def word_count(text) = text.split.size
  def char_count(text) = text.length
  def char_count_no_spaces(text) = text.gsub(/\s/, "").length
  def line_count(text) = text.lines.size
  def sentence_count(text) = text.scan(/[.!?]+/).size

  def reverse(text) = text.reverse
  def reverse_words(text) = text.split.reverse.join(" ")

  def truncate(text, length: 100, suffix: "...")
    text.length > length ? text[0, length - suffix.length] + suffix : text
  end

  def slugify(text)
    text.unicode_normalize(:nfkd)
        .encode("ASCII", replace: "")
        .downcase
        .gsub(/[^a-z0-9]+/, "-")
        .gsub(/\A-|-\z/, "")
  end

  def base64_encode(text) = Base64.strict_encode64(text)
  def base64_decode(text) = Base64.strict_decode64(text)
  def url_encode(text) = URI.encode_www_form_component(text)
  def url_decode(text) = URI.decode_www_form_component(text)

  def split_words(text)
    text.gsub(/([a-z])([A-Z])/, "\\1 \\2")
        .gsub(/([A-Z]+)([A-Z][a-z])/, "\\1 \\2")
        .gsub(/[-_.\s]+/, " ")
        .split
  end
end
