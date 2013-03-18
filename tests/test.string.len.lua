require "lunit"

module("test.string.len", package.seeall, lunit.testcase)

function test_001()
  local rc1 = string.len("")
  assert_equal(0, rc1)
end

function test_002()
  function a()
    local rc1 = string.len("a")
    assert_equal(1, rc1)
  end
  function u()
    local rc1 = string.len("ａ")
    assert_equal(1, rc1)
  end
  a()
  u()
end

function test_003()
  function a()
    local rc1 = string.len("abcde")
    assert_equal(5, rc1)
  end
  function u()
    local rc1 = string.len("ａｂｃｄｅ")
    assert_equal(5, rc1)
  end
  a()
  u()
end

function test_004()
  local rc1 = string.len("\0")
  assert_equal(1, rc1)
end

function test_005()
  local rc1 = string.len("\x00")
  assert_equal(1, rc1)
end

function test_006()
  local rc1 = string.len("\0\0\0")
  assert_equal(3, rc1)
end

function test_007()
  function a()
    local rc1 = string.len("a\0b\0c")
    assert_equal(5, rc1)
  end
  function u()
    local rc1 = string.len("ａ\0ｂ\0ｃ")
    assert_equal(5, rc1)
  end
  a()
  u()
end
