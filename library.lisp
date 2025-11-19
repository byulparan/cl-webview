;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2025.10.30 byulparan@gmail.com
;; 
;; 


;; If the lib directory does not exist in cl-webview, then fetch webview from GitHub and build it.
(unless (probe-file (asdf:system-relative-pathname :cl-webview  "lib"))
  (uiop:run-program (format nil "cd ~a && rm -rf build && cmake -B build && make -C build" (namestring (asdf:system-source-directory :cl-webview)))
		    :output :interactive))

(pushnew '(asdf:system-relative-pathname :cl-webview "lib/") cffi:*foreign-library-directories*)


(cffi:define-foreign-library libwebview
  (:darwin "libwebview.dylib")
  (:unix "libwebview.so")
  (:windows "webviewd.dll"))

(cffi:use-foreign-library libwebview)


