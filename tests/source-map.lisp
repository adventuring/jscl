;; Unit tests for source-map internal functions

(test (equal (jscl/source-map::make-char-seq #\A #\E) "ABCDE"))
(test (equal "A" (jscl/source-map::base-64 0)))
(test (equal "B" (jscl/source-map::base-64 1)))
(test (equal "A" (jscl/source-map::base-64-vlq 0)))
(test (equal "B" (jscl/source-map::base-64-vlq 1)))
(test (equal "gB" (jscl/source-map::base-64-vlq 16)))
(test (= 0 (jscl/source-map::zig-zag-signed 0)))
(test (= #b100 (jscl/source-map::zig-zag-signed 2)))
(test (= #b101 (jscl/source-map::zig-zag-signed -2)))
(let ((last 0))
  (test (= 0 (jscl/source-map::relative-number 0 last)))
  (test (= 10 (jscl/source-map::relative-number 10 last)))
  (test (= 20 (jscl/source-map::relative-number 30 last)))
  (test (= -30 (jscl/source-map::relative-number 0 last))))
(test (string= (jscl/source-map::doubly-quoted "blah")
               "\"blah\""))
(test (string= (jscl/source-map::doubly-quoted "\"blah\\")
               "\\\"blah\\"))
(test (string= (jscl/source-map::backslash-escaped "|blah\\" #\|)
               "\\|blah\\\\"))

(test (string= (jscl/source-map::symbol-name-string #:foo)
               "#:FOO"))
(test (string= (jscl/source-map::symbol-name-string #:|foo\|bar|)
               "#:|foo\\|bar|"))
(test (string= (jscl/source-map::symbol-name-string :monkey)
               ":MONKEY"))
(test (string= (jscl/source-map::symbol-name-string 'jscl::monkey)
               "JSCL::MONKEY"))


