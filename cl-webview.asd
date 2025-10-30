
(asdf:defsystem :cl-webview
  :author "Sungmin Park. byulparan@gmail.com"
  :description "webview binding for Common Lisp"
  :licence "Public Domain / 0-clause MIT"
  :version "2025.10.30"
  :depends-on (:cffi)
  :serial t
  :components ((:file "package")
	       (:file "library")
	       (:file "webview")))



