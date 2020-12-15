alert("hello");



function add_to_cart(pId,pName,pPrice) {
     let cart = localStroage.getItem("cart");
     if(cart==null)
    	 {
    	      //no cart yet
    	 let products=[];
    	 let product = {productId:pId,productName:pName,productQuentity:1,productPrice: pPrice}
    	 products.push(proudct);
    	 localStroage.setItem("cart",JSON.stringify(products));
    	 
    	 }
     else
    	 {
    	      //cart is already present
    	 }
}