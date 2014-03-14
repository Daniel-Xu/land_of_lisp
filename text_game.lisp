;set alist to all the location and desc
(defparameter *node* '((living-room (you are in the living room. a wizard is snoring loudly on the couch.)) 
                       (garden (you are in the beatiful garden. there's a well in front of you)) 
                       (attic (you are in the attic. there's a giant weilding torch in the corner.))))

;find location thr key
(defun describe-loc (location node)
  (cadr (assoc location node)))


