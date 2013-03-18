require "lunit"

module("test.string.char", package.seeall, lunit.testcase)

function test_001()
  local rc1 = string.char()
  assert_equal("", rc1)
end

function test_002()
  local rc1 = string.char(0x00)
  assert_equal("\0", rc1)
end

function test_003()
  function a()
    local rc1 = string.char(0x61)
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.char(0xFF41)
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_004()
  function a()
    local rc1 = string.char(0x61, 0x62, 0x63, 0x64, 0x65)
    assert_equal("abcde", rc1)
  end
  function u()
    local rc1 = string.char(0xFF41, 0xFF42, 0xFF43, 0xFF44, 0xFF45)
    assert_equal("ａｂｃｄｅ", rc1)
  end
end
