//
// function getAllCategory() {
//     $.ajax({
//         type: 'GET',
//         url: `http://localhost:8080/categories`,
//         success: function (categories) {
//             let content='';
//             for (let i = 0; i < categories.length; i++) {
//                 content += `<div class="filter-item">
//                                 <div class="custom-control">
//                                        <a href="" onclick=""><label class="custom-control">${categories[i].name}</label></a>
//                                 </div><!-- End .custom-checkbox -->
//                                     <span class="item-count" id="${categories[i].name}"></span>
//                             </div>`
//
//             };
//
//             $('#category_list').html(content);
//
//         }
//     })
// }
// function showProductList(id){
//     $.ajax({
//         type:'GET',
//         url:`http://localhost:8080/categories/${id}`,
//         success: function(products){
//
//         }
//     })
// }
// function showProductAmount(){
//     $.ajax({
//         type:'GET',
//         url: `http://localhost:8080/products`,
//         success: function(){
//         }
//     })
// }
// $(document).ready(function () {
//     getAllCategory();
// })