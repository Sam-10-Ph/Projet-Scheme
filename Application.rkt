#lang scheme
(require "Metier.rkt")   ;importation des fonctions du fichier Metier_TP_simplification.rkt
(provide simplifier)

;simp* : exp ----> exp
(define simp* (lambda (exp)        ;renvoie une simplification d'une expression dans laquelle l'opérateur est *                                                                
            (cond
              ((and (const? (simplifier (operande1 exp)))                                       
                    (const? (simplifier (operande2 exp))))   (* (simplifier (operande1 exp))    ;si op1 et op2 sont des constantes, retourne leur produit
                                                                (simplifier (operande2 exp))))        

              
              ( (or (eq? (simplifier (operande1 exp)) 0)         ;Si operande1 est égal à 0 ou operande2 est égal a 0, retourne 0
                    (eq? (simplifier (operande2 exp)) 0))  0)                                           

              
              ((eq? (simplifier (operande1 exp)) 1)   (simplifier (operande2 exp)))    ;l'une des operande est égal a 1, operateur 1 est egale a 1 et vice versa   
              ((eq? (simplifier (operande2 exp)) 1)   (simplifier (operande1 exp)))                          

              
              (#t                                (list (simplifier (operande1 exp))    ;Au moins un des operandes est une liste
                                                       (operateur exp)
                                                       (simplifier (operande2 exp))))            
            )))


;simp+: exp ----> exp
(define simp+ (lambda (exp)     ;Elle renvoie une simplification d'une expression dans laquelle l'operateur est +                                       
            (cond
                ((and (const? (simplifier (operande1 exp)))                                                   
                      (const? (simplifier (operande2 exp))))   (+ (simplifier (operande1 exp))     ;Si op1 et op2 sont des constantes, retourne leur somme
                                                                  (simplifier (operande2 exp))))
                
                ((eq? (simplifier (operande1 exp)) 0)  (simplifier (operande2 exp)))   ;Si op1 est égal à 0, retourne op2 et vice versa
                ((eq? (simplifier (operande2 exp)) 0)  (simplifier (operande1 exp)))

                (#t       (list (simplifier (operande1 exp))
                                (operateur exp)                 ;sinon simplifie les opérandes et retourne leur somme simplifiée
                                (simplifier (operande2 exp))))                                                
             )))


;simplifier: exp -----> exp
(define simplifier (lambda (exp)
                     (cond
                          ((or (id? exp)
                               (const? exp))                       exp)
                          ((and (id? (operande1 exp))
                                (id? (operande2 exp)))              exp)
                          ((surpar? exp)                  (simplifier (car exp)))      ;Renvoie l'expression simplifié de exp
                          ((eq? '+ (operateur exp))                  (simp+ exp))
                          ((eq? '* (operateur exp))                  (simp* exp))
                      )))





(simplifier '((y + (1 + (0 * (y + (3 + (2 + (8 + (0 * (z + (2 + (1 + (0 * y)))))))))))) + (7 + (x + (1 * (0 * (0 * (z + (1 + (0 + t))))))))))