function add_to_cart(pid, pname, price)
{

    let cart = localStorage.getItem("cart");
    if (cart == null)
    {
        //no cart yet  
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
//        console.log("Product is added for the first time")
        showToast("Ürün sepete eklendi")
    } else
    {
        //cart is already present
        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pid)
        console.log(oldProduct)
        if (oldProduct)
        {
            //we have to increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1
            pcart.map((item) => {

                if (item.productId === oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }

            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product quantity is increased")
            showToast(oldProduct.productName + " ürün sayısı artırıldı , Adet = " + oldProduct.productQuantity)

        } else
        {
            //we have add the product
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
            pcart.push(product)
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added")
            showToast("Ürün sepete eklendi")
        }


    }


    updateCart();

}

//update cart:

function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0)
    {
        console.log("Cart is empty !!")
        $(".cart-items").html(" 0 ");
        $(".cart-body").html("<h3>Sepette Ürün Yok </h3>");
        $(".checkout-btn").attr('disabled', true)
    } else
    {


        //there is some in cart to show
        console.log(cart)
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `
            <table class='table'>
            <thead class='thread-light'>
                <tr>
                <th>Ürün Adı </th>
                <th>Fiyatı </th>
                <th>Adet </th>
                <th>Toplam Fiyat </th>
                <th>İşlem</th>
                
        
                </tr>
        
            </thead>

        


            `;

        let totalPrice = 0;
        cart.map((item) => {


            table += `
                    <tr>
                        <td> ${item.productName} </td>
                        <td> ${item.productPrice} </td>
                        <td> ${item.productQuantity} </td>
                        <td> ${item.productQuantity * item.productPrice} </td>
                        <td> <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Kaldır</button> </td>    
                     </tr>
                 `

            totalPrice += item.productPrice * item.productQuantity;

        })




        table = table + `
            <tr><td colspan='5' class='text-right font-weight-bold m-5'> Toplam Fiyat : ${totalPrice} </td></tr>
         </table>`
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false)
        console.log("removed")

    }

}


//delete item 
function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));

    let newcart = cart.filter((item) => item.productId != pid)

    localStorage.setItem('cart', JSON.stringify(newcart))

    updateCart();

    showToast("Ürün sepetten kaldırıldı")

}
function deleteAllCart(){
	// tüm sipraişleri 
	//let cart = JSON.parse(localStorage.getItem('cart'));
    localStorage.removeItem('cart');

    updateCart();

	
}

$(document).ready(function () {

    updateCart()
})


function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}


function goToCheckout() {

    window.location = "checkout.jsp"

}
function kategoriSil( id, element){
	
}