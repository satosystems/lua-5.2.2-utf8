require "lunit"

module("test.string.gsub", package.seeall, lunit.testcase)

function test_001()
  function a()
    local x, n = string.gsub("hello world", "(%w+)", "%1 %1")
    assert_equal("hello hello world world", x)
    assert_equal(2, n)

    x = string.gsub("hello world", "%w+", "%0 %0", 1)
    assert_equal("hello hello world", x)

    x = string.gsub("hello world from Lua", "(%g+)%s*(%g+)", "%2 %1")
    assert_equal("world hello Lua from", x)

    x = string.gsub("home = $HOME, user = $USER", "%$(%w+)", os.getenv)
    assert_nil(string.match(x, "%$"))

    x = string.gsub("4+5 = $return 4+5$", "%$(.-)%$",
        function (s)
          return load(s)()
        end)
    assert_equal("4+5 = 9", x)

    local t = { name="lua", version="5.2" }
    x = string.gsub("$name-$version.tar.gz", "%$(%w+)", t)
    assert_equal("lua-5.2.tar.gz", x)
  end
  function u()
    local x, n = string.gsub("ｈｅｌｌｏ　ｗｏｒｌｄ", "([Ａ-Ｚａ-ｚ]+)", "%1　%1")
    assert_equal("ｈｅｌｌｏ　ｈｅｌｌｏ　ｗｏｒｌｄ　ｗｏｒｌｄ", x)
    assert_equal(2, n)

    x = string.gsub("ｈｅｌｌｏ　ｗｏｒｌｄ", "%g+", "%0　%0", 1)
    assert_equal("ｈｅｌｌｏ　ｈｅｌｌｏ　ｗｏｒｌｄ", x)

    x = string.gsub("ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕａ", "(%g+)%s*(%g+)", "%2　%1")
    assert_equal("ｗｏｒｌｄ　ｈｅｌｌｏ　Ｌｕａ　ｆｒｏｍ", x)

    x = string.gsub("ｈｏｍｅ　＝　$HOME，　ｕｓｅｒ　＝　$USER", "%$(%w+)", os.getenv)
    assert_nil(string.match(x, "%$"))

    x = string.gsub("４＋５　＝　$return 4+5$", "%$(.-)%$",
        function (s)
          return load(s)()
        end)
    assert_equal("４＋５　＝　9", x)

    local t = { name="Ｌｕａ", version="５．２" }
    x = string.gsub("$name－$version．ｔａｒ．ｇｚ", "%$(%w+)", t)
    assert_equal("Ｌｕａ－５．２．ｔａｒ．ｇｚ", x)
  end
  a()
  u()
end

function test_002()
  function a()
    local x, n = string.gsub("", "(%s*)", "abc")
    assert_equal("abc", x)
    assert_equal(1, n)
  end
  function u()
    local x, n = string.gsub("", "(%s*)", "ａｂｃ")
    assert_equal("ａｂｃ", x)
    assert_equal(1, n)
  end
  a()
  u()
end

function test_003()
  function a()
    local x, n = string.gsub("hello world from Lua", "(.*)", "[%1]")
    assert_equal("[hello world from Lua][]", x)
    assert_equal(2, n)
  end
  function u()
    local x, n = string.gsub("ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕａ", "(.*)", "［%1］")
    assert_equal("［ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕａ］［］", x)
    assert_equal(2, n)
  end
  a()
  u()
end

function test_004()
  function a()
    local x, n = string.gsub("hello world from Lua", "(.+)", "[%1]")
    assert_equal("[hello world from Lua]", x)
    assert_equal(1, n)
  end
  function u()
    local x, n = string.gsub("ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕａ", "(.+)", "［%1］")
    assert_equal("［ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕａ］", x)
    assert_equal(1, n)
  end
  a()
  u()
end

function test_005()
  function a()
    local x, n = string.gsub("hello world from Lua", "(.+)(.+)", "[%1][%2]")
    assert_equal("[hello world from Lu][a]", x)
    assert_equal(1, n)
    x, n = string.gsub("hello world from Lua", "(.+)(.+)(.+)", "[%1][%2][%3]")
    assert_equal("[hello world from L][u][a]", x)
    assert_equal(1, n)
    x, n = string.gsub("hello world from Lua", "(.+)(.+)(.+)(.+)", "[%1][%2][%3][%4]")
    assert_equal("[hello world from ][L][u][a]", x)
    assert_equal(1, n)
    x, n = string.gsub("hello world from Lua", "(.+)(.+)(.+)(%s+)", "[%1][%2][%3][%4]")
    assert_equal("[hello world fr][o][m][ ]Lua", x)
    assert_equal(1, n)
  end
  function u()
    local x, n = string.gsub("ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕａ", "(.+)(.+)", "［%1］［%2］")
    assert_equal("［ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕ］［ａ］", x)
    assert_equal(1, n)
    x, n = string.gsub("ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕａ", "(.+)(.+)(.+)", "［%1］［%2］［%3］")
    assert_equal("［ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌ］［ｕ］［ａ］", x)
    assert_equal(1, n)
    x, n = string.gsub("ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕａ", "(.+)(.+)(.+)(.+)", "［%1］［%2］［%3］［%4］")
    assert_equal("［ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　］［Ｌ］［ｕ］［ａ］", x)
    assert_equal(1, n)
    x, n = string.gsub("ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒｏｍ　Ｌｕａ", "(.+)(.+)(.+)(%s+)", "［%1］［%2］［%3］［%4］")
    assert_equal("［ｈｅｌｌｏ　ｗｏｒｌｄ　ｆｒ］［ｏ］［ｍ］［　］Ｌｕａ", x)
    assert_equal(1, n)
  end
  a()
  u()
end
