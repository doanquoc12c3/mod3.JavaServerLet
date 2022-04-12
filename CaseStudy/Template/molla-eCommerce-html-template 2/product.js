// function getAllProduct(page) {
//     $.ajax({
//         type: 'GET',
//         url: `http://localhost:8080/products?page=${page}`,
//         success: function (data) {
//             let content='';
//             let pagination='';
//             let products=data.content;
//             for (let i = 0; i < products.length; i++) {
//                 content += `<tr>
//
//         <td>${products[i].name}</td>
//         <td>${products[i].price}</td>
//         <td>${products[i].description}</td>
//         <td><img src="http://localhost:8080/image/${products[i].image}"></td>
//         <td>${products[i].category.name}</td>
//         <td><button class="btn btn-primary" data-target="#edit-product" data-toggle="modal"
//                                     onclick="showEditProduct(${products[i].id})"><i class="fa fa-edit"></i></button></td>
//         <td><button class="btn btn-danger" data-target="#delete-product" data-toggle="modal"
//                                     onclick="showDeleteProduct(${products[i].id})"><i class="fa fa-trash"></i></button></td>
//     </tr>`
//
//
//             };
//             pagination += ` <ul class="pagination">
//                 <li class="page-item"><button class="page-link"  onclick="getAllProduct(${data.number-1})">Previous</button></li>
//                 <li class="page-item"><button class="page-link" >${data.number+1}</button></li>
//                 <li class="page-item"><button class="page-link"  onclick="getAllProduct(${data.number+1})">Next</button></li>
//             </ul>`;
//             $('#product-list-content').html(content);
//             $('#pagination').html(pagination);
//         }
//     })
// }
function getAllProduct(page) {
    $.ajax({
        type: 'GET',
        url: `http://localhost:8080/products?page=${page}`,
        success: function (data) {
            let content='';
            let pagination='';
            let products=data.content;
            for (let i = 0; i < products.length; i++) {
                content += `<div class="col-6 col-md-4 col-lg-4 col-xl-3" >
                                <div class="product">
                                    <figure class="product-media">
                                        <span class="product-label label-new">New</span>
                                        <a href="product.html">
                                            <img src="http://localhost:8080/image/${products[i].image}" alt="Product image" class="product-image">
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
                                        <h3 class="product-title"><a href="product.html">${products[i].name}</a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            ${products[i].price}
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


            };
            // pagination += ` <ul class="pagination">
            //     <li class="page-item"><button class="page-link"  onclick="getAllProduct(${data.number-1})">Previous</button></li>
            //     <li class="page-item"><button class="page-link" >${data.number+1}</button></li>
            //     <li class="page-item"><button class="page-link"  onclick="getAllProduct(${data.number+1})">Next</button></li>
            // </ul>`;
            $('#showProduct').html(content);
            // $('#pagination').html(pagination);
        }
    })
}
function showEditProduct(id) {
    let title = 'Chỉnh sửa thông tin sản phẩm';
    let footer = `<button class="btn btn-secondary" data-dismiss="modal" type="button">Đóng</button>
                    <button class="btn btn-primary" onclick="editProduct(${id})" type="button">Cập nhật</button>`;
    $('#create-product-title').html(title);
    $('#create-product-footer').html(footer);
    drawCategory();
    $.ajax({
        type: 'GET',
        url: `http://localhost:8080/products/${id}`,
        headers: {
            'Authorization': 'Bearer ' + currentUser.token
        },
        success: function (product) {
            $('#name').val(product.name);
            $('#price').val(product.price);
            $('#description').val(product.description);
            $('#image').val(product.image);
        }
    })
}

$(document).ready(function () {
    getAllProduct(0);

})