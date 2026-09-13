require("base")
require("keymap")
require("plugins")
require("colorscheme")

-- Luaモジュールを簡単にリロードする関数
function _G.reload_lua(module_name)
    package.loaded[module_name] = nil
    require(module_name)
    print(module_name .. " reloaded")
end

-- コマンド登録
vim.cmd('command! -nargs=1 ReloadLua lua reload_lua(<f-args>)')
-- 使い方: :ReloadLua plugin_name
