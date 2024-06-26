# Glitch Capital On Stacks
## There Will Be Blood

![Description of Image](https://github.com/unicornlaunching/glitchcapitalonstacks/blob/main/glitchcapitalgif.gif)

# What's in these contracts?
#### In this contract, we have two data variables: btc-price to store the current price of BTC and user-balance to store the balance of the user. The get-btc-price and get-user-balance functions are read-only functions that allow external users to access the stored values.

#### The buy-btc-on-flash-crash function is a public function that users can call to buy BTC if a flash crash occurs. It checks if the current price is 75% or less of the stored price. If the condition is met, it transfers the user's balance to the contract, resets the user's balance to zero, and updates the stored price. Otherwise, it throws an error indicating that the flash crash condition was not met.
