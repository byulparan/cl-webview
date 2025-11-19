;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2025.10.30 byulparan@gmail.com
;; 
;; 


;; If the lib directory does not exist in cl-webview, then fetch webview from GitHub and build it.
(unless (probe-file (asdf:system-relative-pathname :cl-webview  "build"))
  (uiop:delete-directory-tree (asdf:system-relative-pathname :cl-webview  "build/") :validate t :if-does-not-exist :ignore)
  (let* ((command #+(or darwin unix) "cmake -B build"
		  #+windows "cmake -B build -Ax64"))
    (uiop:run-program (format nil "cd ~a && ~a && cmake --build build --config Release" (asdf:system-source-directory :cl-webview) command)
		      :output :interactive)))

#+(or darwin unix)
(pushnew '(asdf:system-relative-pathname :cl-webview "build/_deps/webview-build/core/") cffi:*foreign-library-directories*)

#+windows
(pushnew '(asdf:system-relative-pathname :cl-webview "build/_deps/webview-build/core/Release/") cffi:*foreign-library-directories*)

(cffi:define-foreign-library libwebview
  (:darwin "libwebview.dylib")
  (:unix "libwebview.so")
  (:windows "webview.dll"))

(cffi:use-foreign-library libwebview)


