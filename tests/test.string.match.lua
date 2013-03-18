require "lunit"

module("test.string.match", package.seeall, lunit.testcase)

function test_001()
  local rc1 = string.match("", "")
  assert_equal("", rc1)
end

function test_002()
  function a()
    local rc1 = string.match("abcde", "")
    assert_equal("", rc1)
  end
  function u()
    local rc1 = string.match("ａｂｃｄｅ", "")
    assert_equal("", rc1)
  end
  a()
  u()
end

function test_003()
  function a()
    local rc1 = string.match("abcde", "a")
    assert_equal("a", rc1)
  end
  function u()
    local rc1 = string.match("ａｂｃｄｅ", "ａ")
    assert_equal("ａ", rc1)
  end
  a()
  u()
end

function test_004()
  function a()
    local rc1 = string.match("abcde", "c")
    assert_equal("c", rc1)
  end
  function u()
    local rc1 = string.match("ａｂｃｄｅ", "ｃ")
    assert_equal("ｃ", rc1)
  end
  a()
  u()
end

function test_005()
  function a()
    local rc1, rc2 = string.match("abcde", "(c)")
    assert_equal("c", rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.match("ａｂｃｄｅ", "(ｃ)")
    assert_equal("ｃ", rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_006()
  function a()
    local rc1, rc2, rc3, rc4, rc5, rc6 = string.match("abcde", "(.)(.)(.)(.)(.)")
    assert_equal("a", rc1)
    assert_equal("b", rc2)
    assert_equal("c", rc3)
    assert_equal("d", rc4)
    assert_equal("e", rc5)
    assert_nil(rc6)
  end
  function u()
    local rc1, rc2, rc3, rc4, rc5, rc6 = string.match("ａｂｃｄｅ", "(.)(.)(.)(.)(.)")
    assert_equal("ａ", rc1)
    assert_equal("ｂ", rc2)
    assert_equal("ｃ", rc3)
    assert_equal("ｄ", rc4)
    assert_equal("ｅ", rc5)
    assert_nil(rc6)
  end
  a()
  u()
end

function test_007()
  function a()
    local rc1, rc2 = string.match("abcde", "(bcd)")
    assert_equal("bcd", rc1)
    assert_nil(rc2)
  end
  function u()
    local rc1, rc2 = string.match("ａｂｃｄｅ", "(ｂｃｄ)")
    assert_equal("ｂｃｄ", rc1)
    assert_nil(rc2)
  end
  a()
  u()
end

function test_008()
  function a()
    local rc1 = string.match("abcde", "z")
    assert_nil(rc1)
  end
  function u()
    local rc1 = string.match("ａｂｃｄｅ", "ｚ")
    assert_nil(rc1)
  end
  a()
  u()
end

function test_009()
  function a()
    local rc1 = string.match("abcde", "z")
    assert_nil(rc1)
  end
  function u()
    local rc1 = string.match("ａｂｃｄｅ", "ｚ")
    assert_nil(rc1)
  end
  a()
  u()
end

function test_010()
  function a()
    for i = -6, 6, 1 do
      local rc1 = string.match("abcde", "c", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal("c", rc1)
      else
        assert_nil(rc1)
      end
    end
  end
  function u()
    for i = -6, 6, 1 do
      local rc1 = string.match("ａｂｃｄｅ", "ｃ", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal("ｃ", rc1)
      else
        assert_nil(rc1)
      end
    end
  end
  a()
  u()
end

function test_101()
  function a()
    local rc1 = string.match("abcde", ".+")
    assert_equal("abcde", rc1)
  end
  function u()
    local rc1 = string.match("ａｂｃｄｅ", ".+")
    assert_equal("ａｂｃｄｅ", rc1)
  end
  a()
  u()
end

function test_102()
  function a()
    local rc1 = string.match("  abcde", "%a+")
    assert_equal("abcde", rc1)
  end
  function u()
    local rc1 = string.match("  ａｂｃｄｅ", "%a+")
    assert_nil(rc1)
  end
  a()
  u()
end

function test_103()
  local rc1 = string.match("\0\v\b", "%c+")
  assert_equal("\0\v\b", rc1)
end

function test_104()
  function a()
    local rc1 = string.match(" !@#$%", "%g+")
    assert_equal("!@#$%", rc1)
  end
  function u()
    local rc1 = string.match("　！＠＃＄％", "%g+")
    assert_equal("！＠＃＄％", rc1)
  end
  a()
  u()
end

function test_105()
  function a()
    local rc1 = string.match("ABCabc", "%l+")
    assert_equal("abc", rc1)
  end
  function u()
    local rc1 = string.match("ＡＢＣａｂｃ", "%l+")
    assert_nil(rc1)
  end
  a()
  u()
end

function test_106()
  function a()
    local rc1 = string.match(".,", "%p+")
    assert_equal(".,", rc1)
  end
  function u()
    local rc1 = string.match("、。", "%p+")
    assert_equal("、。", rc1)
  end
  a()
  u()
end

function test_107()
  function a()
    local rc1 = string.match(" \r\n\t", "%s+")
    assert_equal(" \r\n\t", rc1)
  end
  function u()
    local rc1 = string.match("　\r\n\t", "%s+")
    assert_equal("　\r\n\t", rc1)
  end
  a()
  u()
end

function test_108()
  function a()
    local rc1 = string.match("abcABC", "%u+")
    assert_equal("ABC", rc1)
  end
  function u()
    local rc1 = string.match("ａｂｃＡＢＣ", "%u+")
    assert_nil(rc1)
  end
  a()
  u()
end

function test_109()
  function a()
    local rc1 = string.match("abc ABC", "%w+")
    assert_equal("abc", rc1)
  end
  function u()
    local rc1 = string.match("ａｂｃ　ＡＢＣ", "%w+")
    assert_nil(rc1)
  end
  a()
  u()
end

function test_110()
  function a()
    local rc1 = string.match("feff cafebabe", "%x+")
    assert_equal("feff", rc1)
  end
  function u()
    local rc1 = string.match("ｆｅｆｆ　ｃａｆｅｂａｂｅ", "%x+")
    assert_nil(rc1)
  end
  a()
  u()
end

function test_111()
  function a()
    local rc1 = string.match("!@#$%^", "%@%#%$")
    assert_equal("@#$", rc1)
  end
  function u()
    local rc1 = string.match("！＠＃＄％", "%＠%＃%＄")
    assert_equal("＠＃＄", rc1)
  end
  a()
  u()
end

function test_201()
  function a()
    local rc1 = string.match("(abc)", "%b()")
    assert_equal("(abc)", rc1)
  end
  function u()
    local rc1 = string.match("（ａｂｃ）", "%b（）")
    assert_equal("（ａｂｃ）", rc1)
  end
  a()
  u()
end

function test_202()
  function a()
    local rc1 = string.match("(a(b)c)", "%b()")
    assert_equal("(a(b)c)", rc1)
  end
  function u()
    local rc1 = string.match("（ａ（ｂ）ｃ）", "%b（）")
    assert_equal("（ａ（ｂ）ｃ）", rc1)
  end
  a()
  u()
end

function test_203()
  function a()
    local rc1 = string.match("a(b)c", "%b()")
    assert_equal("(b)", rc1)
  end
  function u()
    local rc1 = string.match("ａ（ｂ）ｃ", "%b（）")
    assert_equal("（ｂ）", rc1)
  end
  a()
  u()
end
