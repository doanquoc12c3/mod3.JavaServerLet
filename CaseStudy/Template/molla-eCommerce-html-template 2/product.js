let currentUser = localStorage.getItem('currentUser');
currentUser = JSON.parse(currentUser);
let searchParams = null;
searchParams = new URLSearchParams(window.location.search)
function showProductCard(data) {
    let contentHtml='';
    for (let i = 0; i < data.length; i++) {
        contentHtml += `<div class="col-6 col-md-4 col-lg-4 col-xl-3" >
                                <div class="product">
                                    <figure class="product-media">
                                        <span class="product-label label-new">New</span>
                                        <a href="product.html">
                                            <img src="http://localhost:8080/image/${data[i].image}" alt="Product image" class="product-image">
                                        </a>

                                        <div class="product-action-vertical">
                                            <a href="#" class="btn-product-icon btn-wishlist btn-expandable"><span>add to wishlist</span></a>
                                        </div><!-- End .product-action -->

                                        <div class="product-action action-icon-top">
                                            <a href="#" class="btn-product btn-cart"><span>add to cart</span></a>
                                            <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                            <a href="#" class="btn-product btn-compare" title="Compare"><span>compare</span></a>
                                        </div><!-- End .product-action -->
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <div class="product-cat">
                                            <a href="#">Women</a>
                                        </div><!-- End .product-cat -->
                                        <h3 class="product-title"><a href="product.html">${data[i].name}</a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            ${data[i].price} VND
                                        </div><!-- End .product-price -->
                                        <div class="ratings-container">
                                            <div class="ratings">
                                                <div class="ratings-val" style="width: 0%;"></div><!-- End .ratings-val -->
                                            </div><!-- End .ratings -->
                                            <span class="ratings-text">( 0 Reviews )</span>
                                        </div><!-- End .rating-container -->

                                        <div class="product-nav product-nav-dots">
                                            <a href="#" style="background: #cc9966;"><span class="sr-only">Color name</span></a>
                                            <a href="#" class="active" style="background: #ebebeb;"><span class="sr-only">Color name</span></a>
                                        </div><!-- End .product-nav -->
                                    </div><!-- End .product-body -->
                                </div><!-- End .product -->
                            </div>`


    }
    ;
    return contentHtml;
}

function getAllProduct() {
    $.ajax({
        url: `http://localhost:8080/products`,
        type: 'GET',
        headers: {
            'Authorization': 'Bearer ' + currentUser.token
        },
        success: function (data) {
            let contentHtml='';
            let products = data.content;
            contentHtml = showProductCard(products);

            $('#showProduct').html(contentHtml);

        }
    })
}


function getAllCategory() {
    $.ajax({
        type: 'GET',
        url: `http://localhost:8080/categories`,
        headers: {
            'Authorization': 'Bearer ' + currentUser.token
        },
        success: function (categories) {
            let content='';
            for (let i = 0; i < categories.length; i++) {
                content += `<div class="filter-item">
                                <div class="custom-control">
                                       <a href="" onclick=""><label class="custom-control">${categories[i].name}</label></a>
                                </div><!-- End .custom-checkbox -->
                                    <span class="item-count" id="${categories[i].name}"></span>
                            </div>`

            };

            $('#category_list').html(content);

        }
    })
}
function showProductList(id){
    $.ajax({
        type:'GET',
        url:`http://localhost:8080/categories/${id}`,
        headers: {
            'Authorization': 'Bearer ' + currentUser.token
        },
        success: function(products){

        }
    })
}
function showProductAmount(){
    $.ajax({
        type:'GET',
        url: `http://localhost:8080/products`,
        headers: {
            'Authorization': 'Bearer ' + currentUser.token
        },
        success: function(){
        }
    })
}

function showCategoryIndex(){
    $.ajax({
        type:'GET',
        url: `http://localhost:8080/categories`,
        headers: {
            'Authorization': 'Bearer ' + currentUser.token
        },
        success: function(categories){
            let content='';
            for (let i = 0; i <categories.length ; i++) {
                content+=`<li><a href="category-boxed.html?categoryId=${categories[i].id}">${categories[i].name}</a></li>`
            };
            $('#category_index').html(content);
        }
    })
}

function showProductByCategoryId(id){

    $.ajax({
        type:'GET',
        url: `http://localhost:8080/categories/view/${id}`,
        headers: {
            'Authorization': 'Bearer ' + currentUser.token
        },
        success: function(data){
            let content='';
            let categories = data.content;
            content+=showProductCard(categories);
            $('#showProduct').html(content);
        }
    })
}

function showShopList(){
    $.ajax({
        type:'GET',
        url: `http://localhost:8080/shops`,
        headers: {
            'Authorization': 'Bearer ' + currentUser.token
        },
        success: function(shops){
            let content='';
            for (let i = 0; i < shops.length; i++) {
                content+=`<li><a href="category-boxed.html?shopId=${shops[i].id}&shopName=${shops[i].name}">${shops[i].name}</a></li>`
            }

            $('#shop_list_index').html(content);
        }
    })
}
function showCategoryByShopId(shopId,shopName){
    $.ajax({
        type:'GET',
        url: `http://localhost:8080/shops/view/${shopId}`,
        headers: {
            'Authorization': 'Bearer ' + currentUser.token
        },
        success: function(data){

            let content='';
            let categories = data.content;
            for (let i = 0; i < categories.length; i++) {
                content += `<div class="filter-item">
                                <div class="custom-control">
                                       <a><label class="custom-control">${categories[i].name}</label></a>
                                </div><!-- End .custom-checkbox -->
                                    <span class="item-count" id="${categories[i].name}"></span>
                            </div>`

            };
            $('#shop_name').html(shopName);
            $('#category_list').html(content);
    }
})
}

function getUrlParameter(sParam) {
    let sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};



$(document).ready(function () {

    showShopList();

    if(searchParams.has('categoryId')==true){
        let categoryId = searchParams.get('categoryId');
        showProductByCategoryId(categoryId);
        showCategoryIndex();
    } else if(getUrlParameter('shopId')!==true){
        let shopId= getUrlParameter('shopId');
        let shopName=getUrlParameter('shopName');
        showCategoryByShopId(shopId,shopName);
        showProductByCategoryId(1);
    }else{
        getAllCategory();
        getAllProduct();
        showCategoryIndex();
    }
})