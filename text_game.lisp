;set alist to all the location and desc
(defparameter *node* '((living-room (you are in the living room. a wizard is snoring loudly on the couch.)) 
                       (garden (you are in the beatiful garden. there's a well in front of you)) 
                       (attic (you are in the attic. there's a giant weilding torch in the corner.))))

;find location thr key
(defun describe-loc (location node)
  (cadr (assoc location node)))


;edges
(defparameter *edges* '( (living-room (attic upstairs ladder) (garden west door)) 
                         (gardent (living-room east door)) 
                         (attic (living-room downstairs ladder)) ))


;find edges
(defun describe-path (edge) `(there is a ,(caddr edge) going ,(cadr edge) from here.))


;desc multipul paths

(defun describe-paths (location edges) (apply #'append (mapcar #'describe-path (cdr (assoc location)))))

;object
(defparameter *objects* '(whiskey bucket frog chain))

;object in specified location
(defparameter *object-location* '((whiskey living-room)
                                  (bucket living-room)
                                  (chain garden)
                                  (frog garden)))

;define a local fun in the object-at
;giving a location, we can find the objects in it
(defun objects-at (loc objs obj-locs) 
  (
   labels ((at-loc-p (obj) (eq (cadr (assoc obj obj-locs)) loc)))
   (remove-if-not #'at-loc-p objs)
  )
)


;describe each of the object in one location

(defun describe-objects (loc objects obj-locs) 
  ( labels ((describe-obj (obj) `(you see a ,obj on the floor.)))
   (apply #'append (mapcar #'describe-obj (objects-at loc objects obj-locs)))))
  
