on run argv
  log "running workflow"
  set appToCall to ""

  if count of argv = 1 then
    set appToCall to item 1 of argv
  end if 

  if appToCall = "" then
    set appToCall to "Preview"
  end if

  set retryCount to 0
  set maxRetries to 5

  repeat until application appToCall is frontmost or retryCount >= maxRetries
      delay 0.5
      set retryCount to retryCount + 1
      tell application appToCall to activate
  end repeat

  tell application "System Events"
    log "sending to app"
    tell process appToCall
      if appToCall = "Preview" then
        log "app is Preview"
        click menu item "New from Clipboard" of menu "File" of menu bar 1
      end if
    end tell
  end tell
end run