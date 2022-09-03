;;;; notifier.asd

(asdf:defsystem #:notifier
  :description "StumpWM module for sending desktop notifications"
  :author "Dmitrii Kosenkov"
  :license  "GPLv3"
  :version "0.1.0"
  :serial t
  :depends-on (#:stumpwm #:dbus)
  :components ((:file "package")
               (:file "notifier")))
