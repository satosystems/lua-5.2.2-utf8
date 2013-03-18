require "lunit"

module("test.string.byte", package.seeall, lunit.testcase)

function test_001()
  function a()
    local rc1, rc2 = string.byte("abcde")
    assert_equal(0x61, rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.byte("ａｂｃｄｅ")
    assert_equal(0xFF41, rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_002()
  function a()
    local rc1, rc2 = string.byte("abcde", 1)
    assert_equal(0x61, rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.byte("ａｂｃｄｅ", 1)
    assert_equal(0xFF41, rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_003()
  function a()
    local rc1, rc2 = string.byte("abcde", 2)
    assert_equal(0x62, rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.byte("ａｂｃｄｅ", 2)
    assert_equal(0xFF42, rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_004()
  function a()
    local rc1, rc2 = string.byte("abcde", 3)
    assert_equal(0x63, rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.byte("ａｂｃｄｅ", 3)
    assert_equal(0xFF43, rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_005()
  function a()
    local rc1, rc2 = string.byte("abcde", 0)
    assert_nil(rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.byte("ａｂｃｄｅ", 0)
    assert_nil(rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_006()
  function a()
    local rc1, rc2 = string.byte("abcde", -1)
    assert_equal(0x65, rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.byte("ａｂｃｄｅ", -1)
    assert_equal(0xFF45, rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_007()
  function a()
    local rc1, rc2 = string.byte("abcde", 1, 1)
    assert_equal(0x61, rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.byte("ａｂｃｄｅ", 1, 1)
    assert_equal(0xFF41, rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_008()
  function a()
    local rc1, rc2, rc3 = string.byte("abcde", 1, 2)
    assert_equal(0x61, rc1)
    assert_equal(0x62, rc2)
    assert_nil(rc3)
  end
  function u()
    local rc1, rc2, rc3 = string.byte("ａｂｃｄｅ", 1, 2)
    assert_equal(0xFF41, rc1)
    assert_equal(0xFF42, rc2)
    assert_nil(rc3)
  end
  a()
  u()
end

function test_009()
  function a()
    local rc1, rc2, rc3, rc4 = string.byte("abcde", 1, 3)
    assert_equal(0x61, rc1)
    assert_equal(0x62, rc2)
    assert_equal(0x63, rc3)
    assert_nil(rc4)
  end
  function u()
    local rc1, rc2, rc3, rc4 = string.byte("ａｂｃｄｅ", 1, 3)
    assert_equal(0xFF41, rc1)
    assert_equal(0xFF42, rc2)
    assert_equal(0xFF43, rc3)
    assert_nil(rc4)
  end
  a()
  u()
end

function test_010()
  function a()
    local rc1, rc2, rc3, rc4, rc5, rc6 = string.byte("abcde", 1, 5)
    assert_equal(0x61, rc1)
    assert_equal(0x62, rc2)
    assert_equal(0x63, rc3)
    assert_equal(0x64, rc4)
    assert_equal(0x65, rc5)
    assert_nil(rc6)
  end
  function u()
    local rc1, rc2, rc3, rc4, rc5, rc6 = string.byte("ａｂｃｄｅ", 1, 5)
    assert_equal(0xFF41, rc1)
    assert_equal(0xFF42, rc2)
    assert_equal(0xFF43, rc3)
    assert_equal(0xFF44, rc4)
    assert_equal(0xFF45, rc5)
    assert_nil(rc6)
  end
  a()
  u()
end

function test_011()
  function a()
    local rc1 = string.byte("abcde", 1, 0)
    assert_nil(rc1)
  end
  function u()
    local rc1 = string.byte("ａｂｃｄｅ", 1, 0)
    assert_nil(rc1)
  end
  a()
  u()
end

function test_012()
  function a()
   local rc1, rc2, rc3, rc4, rc5, rc6 = string.byte("abcde", 1, -1)
    assert_equal(0x61, rc1)
    assert_equal(0x62, rc2)
    assert_equal(0x63, rc3)
    assert_equal(0x64, rc4)
    assert_equal(0x65, rc5)
    assert_nil(rc6)
  end
  function u()
    local rc1, rc2, rc3, rc4, rc5, rc6 = string.byte("ａｂｃｄｅ", 1, -1)
    assert_equal(0xFF41, rc1)
    assert_equal(0xFF42, rc2)
    assert_equal(0xFF43, rc3)
    assert_equal(0xFF44, rc4)
    assert_equal(0xFF45, rc5)
    assert_nil(rc6)
  end
  a()
  u()
end

function test_013()
  function a()
    local rc1, rc2, rc3, rc4, rc5, rc6 = string.byte("abcde", 1, 6)
    assert_equal(0x61, rc1)
    assert_equal(0x62, rc2)
    assert_equal(0x63, rc3)
    assert_equal(0x64, rc4)
    assert_equal(0x65, rc5)
    assert_nil(rc6)
  end
  function u()
    local rc1, rc2, rc3, rc4, rc5, rc6 = string.byte("ａｂｃｄｅ", 1, 6)
    assert_equal(0xFF41, rc1)
    assert_equal(0xFF42, rc2)
    assert_equal(0xFF43, rc3)
    assert_equal(0xFF44, rc4)
    assert_equal(0xFF45, rc5)
    assert_nil(rc6)
  end
  a()
  u()
end

function test_014()
  function a()
    local rc1, rc2, rc3 = string.byte("abcde", -2, -1)
    assert_equal(0x64, rc1)
    assert_equal(0x65, rc2)
    assert_nil(rc3)
  end
  function u()
    local rc1, rc2, rc3 = string.byte("ａｂｃｄｅ", -2, -1)
    assert_equal(0xFF44, rc1)
    assert_equal(0xFF45, rc2)
    assert_nil(rc3)
  end
  a()
  u()
end

function test_015()
  function a()
    local rc1, rc2 = string.byte("abcde", 2, 2)
    assert_equal(0x62, rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.byte("ａｂｃｄｅ", 2, 2)
    assert_equal(0xFF42, rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_016()
  function a()
    local rc1 = string.byte("abcde", 2, 1)
    assert_nil(rc1)
  end
  function u()
    local rc1 = string.byte("ａｂｃｄｅ", 2, 1)
    assert_nil(rc1)
  end
  a()
  u()
end

function test_017()
  function a()
    local rc1 = string.byte("abcde", -1, -1)
    assert_equal(0x65, rc1)
  end
  function u()
    local rc1 = string.byte("ａｂｃｄｅ", -1, -1)
    assert_equal(0xFF45, rc1)
  end
  a()
  u()
end
