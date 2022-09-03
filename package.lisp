;;;; package.lisp

(defpackage :notifier
  (:use #:cl #:stumpwm)
  (:export #:send
           #:close
           #:init))
