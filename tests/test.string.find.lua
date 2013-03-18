require "lunit"

module("test.string.find", package.seeall, lunit.testcase)

function test_001()
  function a()
    local s, e = string.find("abcde", "a")
    assert_equal(1, s)
    assert_equal(1, e)
  end
  function u()
    local s, e = string.find("ａｂｃｄｅ", "ａ")
    assert_equal(1, s)
    assert_equal(1, e)
  end
  a()
  u()
end

function test_002()
  function a()
    local s, e = string.find("abcde", "ab")
    assert_equal(1, s)
    assert_equal(2, e)
  end
  function u()
    local s, e = string.find("ａｂｃｄｅ", "ａｂ")
    assert_equal(1, s)
    assert_equal(2, e)
  end
  a()
  u()
end

function test_003()
  function a()
    local s, e = string.find("abcde", "c")
    assert_equal(3, s)
    assert_equal(3, e)
  end
  function u()
    local s, e = string.find("ａｂｃｄｅ", "ｃ")
    assert_equal(3, s)
    assert_equal(3, e)
  end
  a()
  u()
end

function test_004()
  function a()
    local s, e = string.find("abcde", "abcde")
    assert_equal(1, s)
    assert_equal(5, e)
  end
  function u()
    local s, e = string.find("ａｂｃｄｅ", "ａｂｃｄｅ")
    assert_equal(1, s)
    assert_equal(5, e)
  end
  a()
  u()
end

function test_005()
  function a()
    local s, e = string.find("abcde", "de")
    assert_equal(4, s)
    assert_equal(5, e)
  end
  function u()
    local s, e = string.find("ａｂｃｄｅ", "ｄｅ")
    assert_equal(4, s)
    assert_equal(5, e)
  end
  a()
  u()
end

function test_006()
  function a()
    local s, e = string.find("abcde", "e")
    assert_equal(5, s)
    assert_equal(5, e)
  end
  function u()
    local s, e = string.find("ａｂｃｄｅ", "ｅ")
    assert_equal(5, s)
    assert_equal(5, e)
  end
  a()
  u()
end

function test_007()
  function a()
    for i = -6, 6, 1 do
      local s, e = string.find("abcde", "e", i)
      if i <= 5 then
        assert_equal(5, s)
        assert_equal(5, e)
      else
        assert_nil(s)
        assert_nil(e)
      end
    end
  end
  function u()
    for i = -6, 6, 1 do
      local s, e = string.find("ａｂｃｄｅ", "ｅ", i)
      if i <= 5 then
        assert_equal(5, s)
        assert_equal(5, e)
      else
        assert_nil(s)
        assert_nil(e)
      end
    end
  end
  a()
  u()
end

function test_008()
  function a()
    for i = -6, 6, 1 do
      local s, e = string.find("abcde", "c", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(3, e)
      else
        assert_nil(s)
        assert_nil(e)
      end
    end
  end
  function u()
    for i = -6, 6, 1 do
      local s, e = string.find("ａｂｃｄｅ", "ｃ", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(3, e)
      else
        assert_nil(s)
        assert_nil(e)
      end
    end
  end
  a()
  u()
end

function test_009()
  function a()
    for i = -6, 6, 1 do
      local s, e = string.find("abcde", "cd", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(4, e)
      else
        assert_nil(s)
        assert_nil(e)
      end
    end
  end
  function u()
    for i = -6, 6, 1 do
      local s, e = string.find("ａｂｃｄｅ", "ｃｄ", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(4, e)
      else
        assert_nil(s)
        assert_nil(e)
      end
    end
  end
  a()
  u()
end

function test_010()
  function a()
    for i = -6, 6, 1 do
      local s, e, c1 = string.find("abcde", "(c)", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(3, e)
        assert_equal("c", c1)
      else
        assert_nil(s)
        assert_nil(e)
        assert_nil(c1)
      end
    end
  end
  function u()
    for i = -6, 6, 1 do
      local s, e, c1 = string.find("ａｂｃｄｅ", "(ｃ)", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(3, e)
        assert_equal("ｃ", c1)
      else
        assert_nil(s)
        assert_nil(e)
        assert_nil(c1)
      end
    end
  end
  a()
  u()
end

function test_011()
  function a()
    for i = -6, 6, 1 do
      local s, e, c1 = string.find("abcde", "(c.)", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(4, e)
        assert_equal("cd", c1)
      else
        assert_nil(s)
        assert_nil(e)
        assert_nil(c1)
      end
    end
  end
  function u()
    for i = -6, 6, 1 do
      local s, e, c1 = string.find("ａｂｃｄｅ", "(ｃ.)", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(4, e)
        assert_equal("ｃｄ", c1)
      else
        assert_nil(s)
        assert_nil(e)
        assert_nil(c1)
      end
    end
  end
  a()
  u()
end

function test_012()
  function a()
    for i = -6, 6, 1 do
      local s, e, c1, c2 = string.find("abcde", "(c)(.)", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(4, e)
        assert_equal("c", c1)
        assert_equal("d", c2)
      else
        assert_nil(s)
        assert_nil(e)
        assert_nil(c1)
        assert_nil(c2)
      end
    end
  end
  function u()
    for i = -6, 6, 1 do
      local s, e, c1, c2 = string.find("ａｂｃｄｅ", "(ｃ)(.)", i)
      if i <= -3 or i >= 0 and i <= 3 then
        assert_equal(3, s)
        assert_equal(4, e)
        assert_equal("ｃ", c1)
        assert_equal("ｄ", c2)
      else
        assert_nil(s)
        assert_nil(e)
        assert_nil(c1)
        assert_nil(c2)
      end
    end
  end
  a()
  u()
end

function test_013()
  function a()
    for i = -6, 6, 1 do
      local s, e = string.find("abcde", ".", i)
      if i >= 0 and i <= 5 then
        local j = i
        if j == 0  then
          j = 1
        end
        assert_equal(j, s)
        assert_equal(j, e)
      elseif i <= -1 then
        local j = i + 6
        if j == 0  then
          j = 1
        end
        assert_equal(j, s)
        assert_equal(j, e)
      else
        assert_nil(s)
        assert_nil(e)
      end
    end
  end
  function u()
    for i = -6, 6, 1 do
      local s, e = string.find("ａｂｃｄｅ", ".", i)
      if i >= 0 and i <= 5 then
        local j = i
        if j == 0  then
          j = 1
        end
        assert_equal(j, s)
        assert_equal(j, e)
      elseif i <= -1 then
        local j = i + 6
        if j == 0  then
          j = 1
        end
        assert_equal(j, s)
        assert_equal(j, e)
      else
        assert_nil(s)
        assert_nil(e)
      end
    end
  end
  a()
  u()
end

function test_014()
  function a()
    local s, e, c1 = string.find("abcde", "(c)", 1, true)
    assert_nil(s)
    assert_nil(e)
    assert_nil(c1)
  end
  function u()
    local s, e, c1 = string.find("ａｂｃｄｅ", "(ｃ)", 1, true)
    assert_nil(s)
    assert_nil(e)
    assert_nil(c1)
  end
  a()
  u()
end

function test_015()
  function a()
    local s, e = string.find("abcde", "z")
    assert_nil(s)
    assert_nil(e)
  end
  function u()
    local s, e = string.find("ａｂｃｄｅ", "ｚ")
    assert_nil(s)
    assert_nil(e)
  end
  a()
  u()
end

function test_101()
  function a()
    local s, e = string.find("abcde", "%f[c]")
    assert_equal(3, s)
    assert_equal(2, e)
    s, e = string.find("abcde", "%f[d]")
    assert_equal(4, s)
    assert_equal(3, e)
  end
  function u()
    local s, e = string.find("ａｂｃｄｅ", "%f[ｃ]")
    assert_equal(3, s)
    assert_equal(2, e)
    s, e = string.find("ａｂｃｄｅ", "%f[ｄ]")
    assert_equal(4, s)
    assert_equal(3, e)
  end
  a()
  u()
end
