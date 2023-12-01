#lang racket/base

(module+ test
  (require rackunit))

(module+ main
  (require racket/gui)

  (define f/width 300)
  (define f/height 300)
  (define s/mindots 0)
  (define s/maxdots 100)
  (define black (make-object color% 0 0 0 1.0))

  (define frame 
    (new frame%
	 [label "Dots with a slider"]
	 [width f/width]
	 [height f/height ]))

  (define (paint canvas dc)
    (let ([dotNb (send slider get-value)])
      (send dc draw-text (number->string dotNb) 0 0)
      (send dc set-pen black 10 'solid)
      (for ([i (in-range dotNb)])
	(let ([x (random 1 f/width)]
	      [y (random 1 f/height)])
	  (send dc draw-point x y)))))

  (define canvas 
    (new canvas% 
	 [parent frame]
	 [paint-callback paint]))

  (define slider 
    (new slider%
	 [label "Dot slider"]
	 [min-value s/mindots]
	 [max-value s/maxdots]
	 [parent frame]
	 [callback (lambda (slider event) (send canvas refresh-now))]))


  (send frame show #t)

  )

