#lang scheme
(provide operateur operande1 operande2 const? id? surpar?)


;operateur: exp -----> exp
(define operateur (lambda (exp)
                  (car (cdr exp))  ;renvoie l'operation principale d'une expression arithmétique. EX: (x + (x*y)) ----> +
        ))                                        

;operande1 : exp ----> exp
                                        
(define operande1 (lambda (exp)
                 (car exp)        ;renvoie la premère opérande d'une expression arithmétique. EX: (x + (x + y)) ----> x
        ))                           
 

;opereande2 : exp ----> exp
(define operande2 (lambda (exp)
                 (car (cdr (cdr exp)))  ;renvoie la deuxième opérande d'une expression arithmétique. EX: (x + (x + y))----> (x+y)

        ))                           

;const?: exp ----> bool
(define const? (lambda (exp)
                  (number? exp)     ;elle renvoie vrai si l'expression est une constante et faux sinon.
             ))

;id?: exp -----> bool
(define id? (lambda (exp)
              (symbol? exp)     ;renvoie vrai si l'expression est un identificateur et faux sinon
              ))

;surp? : exp -----> bool
(define surpar? (lambda (exp)
             (= (length exp) 1)  ;renvoie vrai si l'expression à un surplus de parenthèse et faux sinon
             ))                         