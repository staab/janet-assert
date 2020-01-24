(defn assert [condition message]
  (when (not condition) (error message)))

(defn assert= [a b]
  (assert (= a b) (string/format "(not= %q %q)" a b)))

(defn assert-deep= [a b]
  (assert (deep= a b) (string/format "(deep-not= %q %q)" a b)))

(defmacro assert-err [& body]
  ~(do
    (var threw? false)
    (try
     (do ,;body)
     ([err] (set threw? true)))
    (when (not threw?)
      (error (string/format "%q did not raise an error" ',body)))))
