(define-data-var btc-price (uint))
(define-data-var user-balance (uint))

(define-read-only (get-btc-price) btc-price)
(define-read-only (get-user-balance) user-balance)

(define-public (buy-btc-on-flash-crash)
  (let ((current-price (get-btc-price)))
    (if (>= (div (mul current-price 25) 100) btc-price)  ; If the current price is 75% or less of the stored price
      (begin
        (transfer-to-contract (get-caller) user-balance)  ; Transfer user's balance to the contract
        (set! user-balance 0)  ; Reset user's balance
        (set! btc-price current-price)  ; Update the stored price
      )
      (err "Flash crash condition not met")
    )
  )
)
