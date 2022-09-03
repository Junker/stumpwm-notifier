# StumpWM Notifier

StumpWM module for sending desktop notifications.

## Requirements

- [DBUS](https://github.com/death/dbus) library

## Installation

```bash
cd ~/.stumpwm.d/modules/
git clone https://github.com/Junker/stumpwm-notifier notifier
```

```lisp
(stumpwm:add-to-load-path "~/.stumpwm.d/modules/notifier)
(load-module "notifier")
```

## Usage

```lisp

;; init module
(notifier:init)

(notifier:send "Test" "This is a test; I repeat, this is a test.")
;; or
(notifier:send "Test" "This is a test; I repeat, this is a test."
               :app-name "MyApp" ;; optional
               :icon "system")   ;; optional
;; or
(let ((notif-id (notifier:send "Test" "This is a test; I repeat, this is a test.")))
   (notifier:send "Test" "This is a test again with replace!" :replace-id notif-id))
```
