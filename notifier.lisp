;;;; notifier.lisp
(in-package :notifier)

(defvar *destination* "org.freedesktop.Notifications")
(defvar *path* "/org/freedesktop/Notifications")
(defvar *interface* "org.freedesktop.Notifications")
(defvar *app-name* "StumpWM")

(defvar *dbus-conn* nil)
(defvar *dbus-bus* nil)
(defvar *dbus-obj* nil)

(defun init ()
  (setf *dbus-conn*
        (dbus:open-connection
         (make-instance 'iolib.multiplex:event-base) (dbus:session-server-addresses)))

  (dbus:authenticate (dbus:supported-authentication-mechanisms *dbus-conn*)
                     *dbus-conn*)

  (setf *dbus-bus* (make-instance 'dbus::bus
                                  :name (dbus:hello *dbus-conn*)
                                  :connection *dbus-conn*))

  (setf *dbus-obj* (dbus:make-object-from-introspection *dbus-conn*
                                                        *path*
                                                        *destination*)))

(defun send (summary body &key (app-name *app-name*) (icon "") (actions '()) (hints '()) (timeout -1) (replace-id 0))
  (dbus:object-invoke *dbus-obj* *interface* "Notify"
                      app-name replace-id icon summary body actions hints timeout))

(defun close (id)
  (dbus:object-invoke *dbus-obj* *interface* "CloseNotification" id))
