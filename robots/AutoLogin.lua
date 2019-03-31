-- Автологин терминала QUIK
-- (c) http://quik2dde.ru/
-- Версия: 1.0

local w32 = require("w32")

-- логин и пароль для терминала
QUIK_LOGIN = "MyLogin"
QUIK_PASSW = "MyPassword"


function FindLoginWindow()
   hLoginWnd = w32.FindWindow("", "Идентификация пользователя")
   if hLoginWnd == 0 then
      hLoginWnd = w32.FindWindow("", "User identification")
   end
   return hLoginWnd
end

timeout = 1000  -- таймаут между попытками поиска окна логина
is_run = true

function OnStop()
   timeout = 1
   is_run = false
end

function main()
   while is_run do
      sleep(timeout)

      if isConnected() == 0 then	  
         local hLoginWnd = FindLoginWindow()
         if hLoginWnd ~= 0 then
            local hServer = w32.FindWindowEx(hLoginWnd, 0, "", "")
            local hLogin = w32.FindWindowEx(hLoginWnd, hServer, "", "")
            local nPassw = w32.FindWindowEx(hLoginWnd, hLogin, "", "")
            local nBtnOk = w32.FindWindowEx(hLoginWnd, nPassw, "", "")
            w32.SetWindowText(hLogin, QUIK_LOGIN)
            w32.SetWindowText(nPassw, QUIK_PASSW)

            w32.SetFocus(nBtnOk)
            w32.PostMessage(nBtnOk, w32.BM_CLICK, 0, 0)
				
            while not isConnected() do sleep(10); end;
         end
      end
   end
end