

(defn collection-type
  "return :list / :map / :vector by col's type"
  [col]
  (condp = (class col)
    clojure.lang.PersistentVector  :vector
    clojure.lang.PersistentList  :list
    clojure.lang.PersistentArrayMap  :map))
