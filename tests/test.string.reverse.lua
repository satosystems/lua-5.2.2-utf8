require "lunit"

module("test.string.reverse", package.seeall, lunit.testcase)

function test_001()
  local rc1 = string.reverse("")
  assert_equal("", rc1)
end

function test_002()
  local rc1 = string.reverse("\0")
  assert_equal("\0", rc1)
end

function test_003()
  function a()
    local rc1 = string.reverse("a")
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.reverse("ａ")
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_004()
  function a()
    local rc1 = string.reverse("abcde")
    assert_equal("edcba", rc1)
  end
  function u()
    local rc1 = string.reverse("ａｂｃｄｅ")
    assert_equal("ｅｄｃｂａ", rc1)
  end
  a()
  u()
end

function test_005()
  function a()
    local rc1 = string.reverse("a\0b\0c")
    assert_equal("c\0b\0a", rc1)
  end
  function u()
    local rc1 = string.reverse("ａ\0ｂ\0ｃ")
    assert_equal("ｃ\0ｂ\0ａ", rc1)
  end
  a()
  u()
end
