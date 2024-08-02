
const Root = document.querySelector(":root");

let cart = {}
let restrictedItems = {
    "sim": true,
}

let cartCost = 0
let isOpened = false

function changeCartAmount(name, amount, price) {
    document.getElementById("cart-item-" + name).getElementsByClassName('cart-items-item-infos')[0].getElementsByClassName('cart-items-item-description')[0].innerHTML = amount;
    document.getElementById("cart-item-" + name).getElementsByClassName('cart-items-item-infos')[0].getElementsByClassName('cart-items-item-price')[0].innerHTML = price;
}

function changeAmount(name, action) {
    if (restrictedItems[name]) return;
    amount = document.getElementById("item-" + name).getElementsByClassName('products-items-item-buttons')[0].getElementsByClassName('products-items-item-buttons-amount')[0].innerHTML;
    if(action == "remove") {
        if(amount > 1) {
            document.getElementById("item-" + name).getElementsByClassName('products-items-item-buttons')[0].getElementsByClassName('products-items-item-buttons-amount')[0].innerHTML--;
        }
    }
    else {
        document.getElementById("item-" + name).getElementsByClassName('products-items-item-buttons')[0].getElementsByClassName('products-items-item-buttons-amount')[0].innerHTML++;
    }

    addToCart = document.getElementById("item-" + name).getElementsByClassName('products-items-item-buttons')[0].getElementsByClassName('products-items-item-buttons-add-to-cart')[0]
    addToCart.innerHTML = '$' + document.getElementById("item-" + name).getAttribute('price')*document.getElementById("item-" + name).getElementsByClassName('products-items-item-buttons')[0].getElementsByClassName('products-items-item-buttons-amount')[0].innerHTML + ' <i class="fa fa-cart-plus"></i>';
}

function renameShop(shopName) {
    document.getElementById('shop-title').innerHTML = shopName;
}

function addItemToCart(name) {
    imgOfItem = document.getElementById(`item-${name}`).getElementsByClassName('products-items-item-img')[0].src;
    nameOfItem = document.getElementById(`item-${name}`).getElementsByClassName('products-items-item-name')[0].innerHTML;
    descriptionOfOneItem = document.getElementById(`item-${name}`).getElementsByClassName('products-items-item-description')[0].innerHTML;
    amount = document.getElementById(`item-${name}`).getElementsByClassName('products-items-item-buttons-amount')[0].innerHTML;
    priceOfOneItem = document.getElementById(`item-${name}`).getElementsByClassName('products-items-item-price')[0].innerHTML;
    realName = document.getElementById(`item-${name}`).getAttribute(`itemName`)

    if(!cart[realName]){
        cart[realName] = {}
        cart[realName].amount = Number(amount)
        priceOfAllItems = amount * priceOfOneItem;
        cart[realName].price = priceOfAllItems
        cartCost = cartCost + cart[realName].price

        cartItem = document.createElement('div');

        cartItem.classList.add('cart-items-item');
        cartItem.id = "cart-item-" + realName;
        document.getElementById('cart-items').appendChild(cartItem);

        cartItemImg = document.createElement('img');
        cartItemImg.classList.add('cart-items-item-img');
        cartItemImg.src = imgOfItem;
        cartItem.appendChild(cartItemImg);

        cartItemInfos = document.createElement('div');
        cartItemInfos.classList.add('cart-items-item-infos');
        cartItem.appendChild(cartItemInfos);

        cartItemInfosName = document.createElement('div');
        cartItemInfosName.classList.add('cart-items-item-name');
        cartItemInfosName.innerHTML = nameOfItem;
        cartItemInfos.appendChild(cartItemInfosName);

        cartItemInfosDescription = document.createElement('div');
        cartItemInfosDescription.classList.add('cart-items-item-description');
        cartItemInfosDescription.innerHTML = amount;
        cartItemInfos.appendChild(cartItemInfosDescription);

        cartItemInfosPrice = document.createElement('div');
        cartItemInfosPrice.classList.add('cart-items-item-price');
        cartItemInfosPrice.innerHTML = priceOfAllItems;
        cartItemInfos.appendChild(cartItemInfosPrice);

        cartItemButtons = document.createElement('div');
        cartItemButtons.classList.add('cart-items-item-buttons');
        cartItem.appendChild(cartItemButtons);

        cartItemButtonRemoveFromCart = document.createElement('div');
        cartItemButtonRemoveFromCart.id = "cart-items-item-buttons-remove-from-cart-" + realName
        cartItemButtonRemoveFromCart.setAttribute('onClick', `removeItemFromCart('${realName}')`);

        cartItemButtonRemoveFromCart.innerHTML = `Usuń <i class="fa fa-trash">`;
        cartItemButtons.appendChild(cartItemButtonRemoveFromCart);
    } else {
        if (restrictedItems[realName]) return;
        cart[realName].amount = Number(cart[realName].amount) + Number(amount)
        priceOfAllItems = cart[realName].amount * priceOfOneItem;
        cart[realName].price = priceOfAllItems
        cartCost = cartCost + (Number(amount) * priceOfOneItem)
        changeCartAmount(realName, cart[realName].amount, priceOfAllItems);
    }

    updateCartCost(cartCost)
}

function removeItemFromCart(name) {
    document.getElementById("cart-item-" + name).remove();
    cartCost = cartCost - cart[name].price
    updateCartCost(cartCost)
    delete(cart[name])
}

function createProductsItem(itemName, fullName, price, description, weight) {
    productsItem = document.createElement('div');
    productsItem.classList.add('products-items-item');
    productsItem.id = "item-" + itemName;
    productsItem.setAttribute('itemName', itemName);
    productsItem.setAttribute('fullName', fullName);
    productsItem.setAttribute('price', price);
    document.getElementById('products-items').appendChild(productsItem);

    productsItemImg = document.createElement('img');
    productsItemImg.classList.add('products-items-item-img');
    productsItemImg.src = `https://cfx-nui-ox_inventory/web/images/${itemName}.png`;
    productsItemImg.id = itemName + "-" + itemName + "-img";
    productsItem.appendChild(productsItemImg);

    if (weight) {
        productsItemWeight = document.createElement('div');
        productsItemWeight.classList.add('products-items-item-weight');
        productsItemWeight.innerHTML = weight;
        productsItemWeight.id = itemName + "-" + itemName + "-weight";
        productsItem.appendChild(productsItemWeight);
    }

    productsItemInfos = document.createElement('div');
    productsItemInfos.classList.add('products-items-item-infos');
    productsItemInfos.id = itemName + "-" + itemName + "-infos";
    productsItem.appendChild(productsItemInfos);

    productsItemfullName = document.createElement('div');
    productsItemfullName.classList.add('products-items-item-name');
    productsItemfullName.innerHTML = fullName;
    productsItemfullName.id = itemName + "-" + itemName + "-name";
    productsItemInfos.appendChild(productsItemfullName);

    productsItemDescription = document.createElement('div');
    productsItemDescription.classList.add('products-items-item-description');
    productsItemDescription.innerHTML = description;
    productsItemDescription.id = itemName + "-" + itemName + "-description";
    productsItemInfos.appendChild(productsItemDescription);

    productsItemPrice = document.createElement('div');
    productsItemPrice.classList.add('products-items-item-price');
    productsItemPrice.innerHTML = price;
    productsItemPrice.id = itemName + "-" + itemName + "-description";
    productsItemInfos.appendChild(productsItemPrice);

    productsItemButtons = document.createElement('div');
    productsItemButtons.classList.add('products-items-item-buttons');
    productsItemButtons.id = itemName + "-" + itemName + "-buttons";
    productsItem.appendChild(productsItemButtons);

    productsItemButtonRemove = document.createElement('div');
    productsItemButtonRemove.classList.add('products-items-item-buttons-remove');
    productsItemButtonRemove.innerHTML = '<i class="fa fa-minus"></i></div>';
    productsItemButtonRemove.setAttribute('onClick', `changeAmount('${itemName}', "remove")`);
    productsItemButtonRemove.id = itemName + "-" + itemName + "-buttons-remove";
    productsItemButtons.appendChild(productsItemButtonRemove);

    productsItemButtonAmount = document.createElement('div');
    productsItemButtonAmount.classList.add('products-items-item-buttons-amount');
    productsItemButtonAmount.innerHTML = '1';
    productsItemButtonAmount.id = itemName + "-" + itemName + "-buttons-amount";
    productsItemButtons.appendChild(productsItemButtonAmount);

    productsItemButtonAdd = document.createElement('div');
    productsItemButtonAdd.classList.add('products-items-item-buttons-add');
    productsItemButtonAdd.innerHTML = '<i class="fa fa-plus"></i></div>';
    productsItemButtonAdd.setAttribute('onClick', `changeAmount('${itemName}', "add")`);
    productsItemButtonAdd.id = itemName + "-" + itemName + "-buttons-remove";
    productsItemButtons.appendChild(productsItemButtonAdd);

    productsItemButtonAddToCart = document.createElement('div');
    productsItemButtonAddToCart.classList.add('products-items-item-buttons-add-to-cart');
    productsItemButtonAddToCart.innerHTML = `$${price} <i class="fa fa-cart-plus"></i>`;
    productsItemButtonAddToCart.setAttribute('onClick', `addItemToCart('${itemName}')`);
    productsItemButtonAddToCart.id = itemName + "-" + itemName + "-add-to-cart";
    productsItemButtons.appendChild(productsItemButtonAddToCart);
}

function showHideShop(state) {
    if(state == 0) {
        document.getElementById('shop').classList.remove('show');
        document.getElementById('shop').classList.add('hide');
        setTimeout(() => {
            document.getElementById('shop').style.display = 'none';
        }, 500);
    } else {
        document.getElementById('shop').style.display = 'block';
        document.getElementById('shop').classList.remove('hide');
        document.getElementById('shop').classList.add('show');
    }
}

function clearCart() {
    cart = {}
    cartCost = 0
    updateCartCost(cartCost)
    const myNode = document.getElementById("cart-items");
    while (myNode.firstChild) {
        myNode.removeChild(myNode.lastChild);
    }
}

function clearItems() {
    const myNode = document.getElementById("products-items");
    while (myNode.firstChild) {
        myNode.removeChild(myNode.lastChild);
    }
}

function showError(content) {
    document.getElementById('error').innerHTML = content;
    document.getElementById('error').classList.remove('hide');
    document.getElementById('error').classList.add('show');

    setTimeout(() => {
        document.getElementById('error').classList.remove('show');
        document.getElementById('error').classList.add('hide');
    }, 5000);
}

function updateCartCost(cost) {
    document.getElementById('cart-cost').innerHTML = cost;
}

function processPayment(account) {
    document.getElementById('payment-cash').style.pointerEvents = 'none';
    document.getElementById('payment-card').style.pointerEvents = 'none';

    $.post(`http://${GetParentResourceName()}/buyItems`, JSON.stringify({account: account, items: cart}),
        function(data, status, jqXHR) {
            if(status == "success"){
                if (data == "success") {
                    closeShop();
                } else if (data == "money") {
                    showError("Nie posiadasz wystarczająco pieniędzy.");
                } else if (data == "weight") {
                    showError("Nie jesteś w stanie unieść tych przedmiotów.");
                } else if (data == "amount") {
                    showError("Nieprawidłowa ilość przedmiotów!");
                } else if (data == "outStock") {
                    showError("Brak jednego z przedmiotów w sklepie!");
                } else if (data == "license"){
                    showError("Nie posiadasz licencji na broń!");
                } else if (data == "dailyLimit"){
                    showError("Sprzedawca nie może sprzedać Ci więcej tego przedmiotu");
                }
            } else {
                showError("Wystąpił nieoczekiwany błąd, skontaktuj się z właścicielem sklepu!");
            }

            setTimeout(() => {
                document.getElementById('payment-cash').style.pointerEvents = 'auto';
                document.getElementById('payment-card').style.pointerEvents = 'auto';
            }, 1000);
        }
    );
}

$(document).ready(function() {
    window.addEventListener('message', function(event) {
        let action = event.data.action

        if (action == "openShop"){
            openShop(event.data.shopName);
        } else if (action == "closeShop") {
            closeShop();
        }

        if (action == "updatecolor") {
            Root.style.setProperty(
                "--primaryColor",
                event.data.color.primaryColor
            );
        }
      
        if (action == "add") {
            let product = event.data;
            createProductsItem(product.item, product.label, product.price, product.desc, product.weight);
        }
    })
})

function openShop(shopName){
    renameShop(shopName);
    showHideShop(1);
    isOpened = true
}

function closeShop(){
    $.post(`http://${GetParentResourceName()}/closeShop`, JSON.stringify({}));
    showHideShop(0);
    clearCart();
    clearItems();
    isOpened = false
}

document.onkeyup = function (data) {
    if (data.which == 27 && isOpened == true) { // Escape key
        closeShop();
    }
};