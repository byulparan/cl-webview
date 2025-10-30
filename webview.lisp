;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2025.10.30 byulparan@gmail.com
;; 
;; 

(in-package :webview)

;;;;;;;;;;;;;;;
;;  binding  ;;
;;;;;;;;;;;;;;;

(cffi:defcfun ("webview_create" create) :pointer
  "Creates a new webview instance."
  (debug :int)
  (window :pointer))


(cffi:defcfun ("webview_destroy" destroy) :int
  "Destroys a webview instance and closes the native window."
  (webview :pointer))


(cffi:defcfun ("webview_run" run) :int
  "Runs the main loop until it's terminated."
  (webview :pointer))


(cffi:defcfun ("webview_terminate" terminate) :int
  "Stops the main loop. It is safe to call this function from another other background thread."
  (webview :pointer))


(cffi:defcfun ("webview_dispatch" dispatch) :int
  "Schedules a function to be invoked on the thread with the run/event loop. Use this function e.g. to interact with the library or native handles."
  (webview :pointer)
  (fn :pointer)
  (arg :pointer))


(cffi:defcfun ("webview_get_window" get-window) :pointer
  "Returns the native handle of the window associated with the webview instance."
  (webview :pointer))


(cffi:defcfun ("webview_get_native_handle" get-native-handle) :pointer
  "Get a native handle of choice."
  (webview :pointer)
  (kind :int))


(cffi:defcfun ("webview_set_title" set-title) :int
  "Updates the title of the native window."
  (webview :pointer)
  (title :string))


(cffi:defcfun ("webview_set_size" set-size) :int
  "Updates the size of the native window."
  (webview :pointer)
  (width :int)
  (height :int)
  (hints :int))


(cffi:defcfun ("webview_navigate" navigate) :int
  "Navigates webview to the given URL. URL may be a properly encoded data URI."
  (webview :pointer)
  (url :string))


(cffi:defcfun ("webview_set_html" set-html) :int
  "Load HTML content into the webview."
  (webview :pointer)
  (html :string))


(cffi:defcfun ("webview_init" init) :int
  "Injects JavaScript code to be executed immediately upon loading a page. The code will be executed before @c window.onload."
  (webview :pointer)
  (js :string))


(cffi:defcfun ("webview_eval" eval) :int
  "Evaluates arbitrary JavaScript code. Use bindings if you need to communicate the result of the evaluation."
  (webview :pointer)
  (js :string))


(cffi:defcfun ("webview_bind" bind) :int
  "Binds a function pointer to a new global JavaScript function. Internally, JS glue code is injected to create the JS function by the given name. The callback function is passed a request identifier, a request string and a user-provided argument. The request string is a JSON array of the arguments passed to the JS function."
  (webview :pointer)
  (name :string)
  (fn :pointer)
  (arg :pointer))


(cffi:defcfun ("webview_unbind" unbind) :int
  "Removes a binding created with webview_bind()."
  (webview :pointer)
  (name :string))


(cffi:defcfun ("webview_return" return) :int
  "Responds to a binding call from the JS side."
  (webview :pointer)
  (id :string)
  (status :int)
  (result :string))


(cffi:defcstruct webview-version
  (major :unsigned-int)
  (minor :unsigned-int)
  (patch :unsigned-int))


(defun version ()
  (let* ((version (cffi:foreign-funcall "webview_version" (:pointer (:struct webview-version)))))
    (cffi:with-foreign-slots ((major minor patch) version (:struct webview-version))
      (format nil "~d.~d.~d" major minor patch))))



