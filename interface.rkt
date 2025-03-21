#lang scheme                        ;Spécifie le langage utilisé
                       
(require racket)                    
(require racket/gui)
(require racket/gui/base)
(require mzlib/string)           ;nous utilisons le langage Racket avec la bibliothèque GUI et d'autres bibliotèques necessaaire pour créer une interface graphique.
(provide liste_en_chaine)        ;importation du fichier "Simplifier" qui servira pour la simplification de l'expression
(provide chaine_en_liste)
(require "application.rkt")         

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
(define police1(make-object font% 11 'script 'normal 'bold #f 'smoothed))
(define police4(make-object font% 12 'script 'normal 'bold #f))
(define police2(make-object font% 12 'modern 'normal 'bold #f))           ;definition des polices
(define police5(make-object font% 15 'script 'italic 'bold #f))

(define font_title(make-object font% 15 'decorative 'normal 'bold #f 'smoothed))
(define font_fenetre_accueil(make-object font% 13 'decorative 'normal 'bold #f 'smoothed))
(define font_btn(make-object font% 12 'decorative 'normal 'bold #f 'smoothed))           ;définition des styles de police
(define font_msg(make-object font% 10 'decorative 'normal 'bold #f 'smoothed))



(define liste_en_chaine( lambda (L) 
                          (with-output-to-string (lambda () (write L)))     ;fonction qui traduit une liste en une chaine
                          ))
(define chaine_en_liste (lambda (str) 
                          (read-from-string-all
                           (string-replace      (string-replace str "*" " * ") "+" " + ")
                           (lambda (event)      '(Veuillez vérifier vos parenthèses SVP !!!))   ;fonction qui traduit une chaine en liste
                           )))


(define frame (new frame% (label "Simplificateur d'expressions")
                   (width 620)
                   (height 500)                      ;Creation de la fenetre principale
                   (border 5)
                   (style '(no-caption no-system-menu no-resize-border))
                   ))


(send frame center 'both)                ;centrer la fenetre principale


(define fenetre_accueil(new frame% (label "Simplificateur arithmétique")    ;creation de la fenetre d'accueil
                   (width 450)
                   (height 150)
                   (style '(no-caption no-system-menu no-resize-border))     ;enlever les bordures , agrandir , fermer et autres
                   ))


(define text-accueil(new message% (parent fenetre_accueil) 
                       (label "  ")
                       (vert-margin 10)
                       (horiz-margin 20)       ;contenu de la fenetre accueil
                       (min-width 410)
                       (font police5)
                       ))

(define text-accueil1(new message% (parent fenetre_accueil) 
                       (label "  ")
                       (font police5)
                       (vert-margin 10)
                       (horiz-margin 20)
                       (min-width 410)
                       ))


(define img (make-object bitmap% "tele.png"))
(new canvas% [parent frame]
     (paint-callback(lambda(canvas dc)                  ;Espace dédié à la photo
                      (send dc draw-bitmap img 0 0)
                      )
                    )
     (min-width 450)
     (min-height 85)
     )

(define panel_title (new vertical-panel% (parent frame)
                         (style (list 'border))
                         (vert-margin 2)
                         (alignment '(center center))
                         ))


(define mssg (new message% [parent panel_title]
                  (label "SIMPLIFICATION DES EXPRESSIONS ARITHMETIQUES")   ;affichage dans la première fenetre de la phrase simplification des expressions arithmetique
                  (font police5)
                  ))


(define input-field (new text-field% (parent frame) (label "Expression :") ))    ;Creation de la zone de text pour la saisie de l'expression


(define simplifier-button (new button% (parent frame) (label "Simplifier")
                          (callback (lambda (button event)
                                     (send result-field set-value (liste_en_chaine (simplifier (chaine_en_liste (send input-field get-value))))))  
                                       )))          ;creation du button permettant de lancer la simplification



(define result-field (new text-field% (parent frame) (label "Forme simplifiée :")(enabled #f)))
(define (update-result-field result)
  (send result-field set-value result))      ;creation de la zone qui affichera le resultat de la simplification


(define delete_all-button (new button% (parent frame) (label "Recommencer")
                       (callback (lambda (button event)                  ;creation du boutton permettant de tout effacer pour recommencer
                                   (send input-field set-value "")))))

(define close-button (new button% (parent frame) (label "Quitter")
                     (callback (lambda (button event)
                                 (let
                                     ((rep (message-box/custom "Quitter" "Voulez-vous vraiment quitter ce programme ?"  "Oui" "Non" "Annuler")))
                                 (send frame show #f))))))                                          ;bouton permettant de quitter





(send frame center 'both)
(send fenetre_accueil center 'both)          ;Affichage et centrage des fenetres
(send fenetre_accueil show #t)
(sleep/yield 0.50)
(send fenetre_accueil show #t)
(sleep/yield 0.50)                                                             
(send text-accueil  set-label "          TP")
(sleep/yield 0.10)
(send text-accueil set-label "           TP en")                   ;Affichage de la phrase Tp en programmation fonctionnelle
(sleep/yield 0.10)
(send text-accueil set-label "           TP en programmation")
(sleep/yield 0.10)
(send text-accueil set-label "           TP en programmation fonctionnelle")

(send text-accueil1  set-label "                          Chargement")
(sleep/yield 0.5)
(send text-accueil1 set-label "                                Chargement .")
(sleep/yield 0.5)
(send text-accueil1 set-label "                                   Chargement . .")
(sleep/yield 0.5)
(send text-accueil1 set-label "                                   Chargement . . .") ;Affichage du mot Chargement

(send text-accueil1  set-label "                            Chargement")
(sleep/yield 0.5)
(send text-accueil1 set-label "                               Chargement .")
(sleep/yield 0.5)
(send text-accueil1 set-label "                                Chargement . .")
(sleep/yield 0.5)
(send text-accueil1 set-label "                             Chargement . . .")

(send text-accueil1  set-label "                            Chargement")
(sleep/yield 0.5)
(send text-accueil1 set-label "                               Chargement .")
(sleep/yield 0.5)
(send text-accueil1 set-label "                                Chargement . .")
(sleep/yield 0.5)
(send text-accueil1 set-label "                             Chargement . . .")


(sleep/yield 0.10)
(send fenetre_accueil show #f)      ;Fermeture de la fenetre
(send frame show #t)





