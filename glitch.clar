(define-data-var btcPrice (buff 32))

(define-read-only (getBtcPrice)
  (ok (buff-get btcPrice 0 32))
)

(define-public (buyBtc)
  (let ((currentPrice (getBtcPrice)))
    (if (isCrash currentPrice)
      (begin
        (transfer-btc-to-exchange)
        (exchange-btc-for-usd)
        (transfer-usd-back-to-contract)
      )
      (err "No crash detected")
    )
  )
)

(define-private (isCrash currentPrice)
  (let ((previousPrice (getPreviousPrice)))
    (if (lt-u (div-u previousPrice currentPrice) (u128-from-int 0.25))
      (true)
      (false)
    )
  )
)

(define-private (getPreviousPrice)
  (ok (buff-get btcPrice 32 32))
)

(define-public (setBtcPrice newPrice)
  (buff-set btcPrice 0 (u128-to-le newPrice))
  (buff-set btcPrice 32 (getBtcPrice))
)
