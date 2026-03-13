# frozen_string_literal: true

require "minitest/autorun"
require "peasytext"

class TestPeasyText < Minitest::Test
  def test_version
    refute_nil PeasyText::VERSION
    assert_equal "0.1.1", PeasyText::VERSION
  end
end
