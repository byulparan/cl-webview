;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2025.10.30 byulparan@gmail.com
;; 
;; 

(defpackage :webview
  (:use #:cl)
  (:shadow return eval)
  (:export #:create
	   #:destroy
	   #:run
	   #:terminate
	   #:dispatch
	   #:get-window
	   #:get-native-handle
	   #:set-title
	   #:set-size
	   #:navigate
	   #:set-html
	   #:init
	   #:eval
	   #:bind
	   #:unbind
	   #:return
	   #:version))







