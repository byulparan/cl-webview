;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2025.10.30 byulparan@gmail.com
;; 
;; 


#+windows
(pushnew '(merge-pathnames "lib/" (asdf:system-source-directory :cl-webview)) cffi:*foreign-library-directories*)


(cffi:define-foreign-library libwebview
  (:darwin "libwebview.dylib")
  (:windows "webviewd.dll"))

(cffi:use-foreign-library libwebview)


