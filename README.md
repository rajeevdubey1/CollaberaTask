# collabera_task

Collabera Task is a mobile application where you can view the products and add to your cart. 

## Getting Started

Features :

we have three screens in the application, product list, product details and cart. those are well explained below,

1. Product list screen : 
                       (a) Here, initialy we have one product and once you apply 'pull to refresh' it will give you one more product in the product list eack time. 
                       (b) we have product name, price and thumbnail of the product in the screen.
                       (c) we have cart button on navitionbar in the right side where you can click to see all added products in the cart.
                       (d) you can see the total number of added products in badge of cart button.

2. Product details screen : 
                       (a) Here, you can see the poduct details with product name, price, description and 'Add To Cart' button to add that product in the cart. 
                       (b) if you add the currect product in the cart using 'Add To Cart' button, it will show you the successful message.
                       (c) if you try to add duplicate product in the cart, it will show you error message.

2. Cart list screen : 
                       (a) Here, you will see a list of products that you added. 
                       (b) you can view the product details from cart screen.
                       (c) you can remove the product from the cart.
                       (d) you can see the total price of the added products in the cart.

## Notes 

(a) I am using bloc state management technique to manage the state after adding or removing products in the cart. Also using bloc for fetching the new products from the server.

(b) For APIs call I will use http package to fetch the product list and handle the http request using try-catch block to handle the server side error better to avoid any crashes in the app.


                       

