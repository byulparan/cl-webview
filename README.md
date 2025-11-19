# cl-webview

a Binding library for Common Lisp to [webview](https://github.com/webview/webview)


## Installation
When you load the library using ASDF, it automatically fetches and builds the foreign WebView library from the repository.


## Examples

``` common-lisp
;; in macOS, GUI should be run in main thread
(trivial-main-thread:with-body-in-main-thread nil
  (float-features:with-float-traps-masked  (:invalid :overflow :divide-by-zero)
    (let* ((w (webview:create 0 (cffi:null-pointer))))
      (setf *webview* w)
      (webview:set-title w "Hello")
      (webview:set-size w 800 600 0)
      (webview:navigate w "https://www.google.com")
      (webview:run w)
      (webview:destroy w))))
```



