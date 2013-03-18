require "lunit"

module("test.string.sub", package.seeall, lunit.testcase)

function test_001()
  local rc1 = string.sub("", 1)
  assert_equal("", rc1)
end

function test_002()
  function a()
    local rc1 = string.sub("a", 1)
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.sub("ａ", 1)
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_003()
  function a()
    local rc1 = string.sub("a", -1)
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.sub("ａ", -1)
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_004()
  function a()
    local rc1 = string.sub("a", 0)
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.sub("ａ", 0)
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_005()
  function a()
    local rc1 = string.sub("a", 1, 1)
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.sub("ａ", 1, 1)
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_006()
  function a()
    local rc1 = string.sub("a", -1, -1)
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.sub("ａ", -1, -1)
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_007()
  function a()
    local rc1 = string.sub("a", 0, 0)
    assert_equal("", rc1)
  end
  function u()
    local rc1 = string.sub("ａ", 0, 0)
    assert_equal("", rc1)
  end
  a()
  u()
end

function test_008()
  function a()
    local rc1 = string.sub("abc", 0, -4)
    assert_equal("", rc1)
  end
  function u()
    local rc1 = string.sub("ａｂｃ", 0, -4)
    assert_equal("", rc1)
  end
  a()
  u()
end

function test_009()
  function a()
    local rc1 = string.sub("abc", 0, -3)
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.sub("ａｂｃ", 0, -3)
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_010()
  function a()
    local rc1 = string.sub("abc", 0, -2)
    assert_equal("ab", rc1)
  end
  function u()
    local rc1 = string.sub("ａｂｃ", 0, -2)
    assert_equal("ａｂ", rc1)
  end
  a()
  u()
end

function test_011()
  function a()
    local rc1 = string.sub("abc", 0, -1)
    assert_equal("abc", rc1)
  end
  function u()
    local rc1 = string.sub("ａｂｃ", 0, -1)
    assert_equal("ａｂｃ", rc1)
  end
  a()
  u()
end

function test_012()
  function a()
    local rc1 = string.sub("abc", 0, 0)
    assert_equal("", rc1)
  end
  function u()
    local rc1 = string.sub("ａｂｃ", 0, 0)
    assert_equal("", rc1)
  end
  a()
  u()
end

function test_013()
  function a()
    local rc1 = string.sub("abc", 0, 1)
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.sub("ａｂｃ", 0, 1)
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_014()
  function a()
    local rc1 = string.sub("abc", 0, 2)
    assert_equal("ab", rc1)
  end
  function u()
    local rc1 = string.sub("ａｂｃ", 0, 2)
    assert_equal("ａｂ", rc1)
  end
  a()
  u()
end

function test_015()
  function a()
    local rc1 = string.sub("abc", 0, 3)
    assert_equal("abc", rc1)
  end
  function u()
    local rc1 = string.sub("ａｂｃ", 0, 3)
    assert_equal("ａｂｃ", rc1)
  end
  a()
  u()
end

function test_016()
  function a()
    local rc1 = string.sub("abc", 0, 4)
    assert_equal("abc", rc1)
  end
  function u()
    local rc1 = string.sub("ａｂｃ", 0, 4)
    assert_equal("ａｂｃ", rc1)
  end
  a()
  u()
end
