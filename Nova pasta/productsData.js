X = function (resposta){
    var recommendation = resposta.data.recommendation;
    var reference = resposta.data.reference;

    var inter = convertion(reference);
    var refProduct = inter.item;
    var products = convertion(recommendation);

    var vitrineReferencia = document.getElementsByClassName("ref-item")
    var vitrineProdutos = document.getElementsByClassName("vitrineProdutos");
    var addReferencia = montarhtmlreferencia(refProduct);
    var addProducts = montarhtmlrecomendacoes(products);
    vitrineReferencia[0].innerHTML = addReferencia;
    vitrineProdutos[0].innerHTML = addProducts;

    console.log(refProduct);
    return X;
}

var src = 'http://roberval.chaordicsystems.com/challenge/challenge.json?callback=X'; 
var script = document.createElement('script');
script.src = src;
document.body.appendChild(script);

function convertion (...recommendation) {

    for ( var number in recommendation) {
        var product = recommendation[number];
        var products = [];
        for (var prop in product){

            var nome = prop;
            var dado = number[prop];
        }
        products.push(product);
        products = products[0];
    }
    return products;
}

function montarhtmlreferencia (refProduct){

productRef = `
<div class="hproduct">
                <a class="link url" title="" rel="product" href="https://produto.pontofrio.com.br/14777688?recsource=whome&amp;rectype=w16">
                    <span class="productImage">
                    <img src="http:${refProduct.imageName}" class="" width="292" height="292" alt="Mesa Escrivaninha Para Estudo Delta Benetil Móveis">
                    </span>
                    <strong class="name fn">${refProduct.name}</strong>
                    
                    <span class="productDetails">
                    <span class="from price regular">De: R$ <strong>${refProduct.oldPrice}</strong></span> 
                        <span class="for price sale">Por: <strong>${refProduct.price}</strong></span>
                        <span class="installment">
                            ${refProduct.productInfo.paymentConditions}
                        </span>
                    </span>
                    
                </a>
            </div>`
            return productRef;
}

function montarhtmlrecomendacoes (...products){
    var conteudo = [];
    var page = [];
    for (let i=0; i<10; i++){
        if (products[0][i].oldPrice){
    produto =
    `
    <li class="moveis first" style="overflow: hidden; float: left; width: 5.27316%; display: inline-block;">                 
    <div class="hproduct">
        <a class="link url" title="${products[0][i].name}" rel="product" href="https:${products[0][i].detailUrl}">
            <span class="productImage">
                <img src="http:${products[0][i].imageName}" class="" width="292" height="292" alt="">
            </span>
            <strong class="name fn">${products[0][i].name}</strong>
            
            <span class="productDetails">
                    <span class="from price regular">De: R$ <strong>${products[0][i].oldPrice}</strong></span>         
                <span class="for price sale">Por: <strong>${products[0][i].price}</strong></span>
                <span class="installment">
                    ${products[0][i].productInfo.paymentConditions}
                </span>
            </span>
            
        </a>
    </div>
    </li>`}
            else { 
                produto =
                `<li class="moveis first" style="overflow: hidden; float: left; width: 5.27316%; display: inline-block;">                 
                <div class="hproduct">
                    <a class="link url" title="${products[0][i].name}" rel="product" href="https:${products[0][i].detailUrl}">
                        <span class="productImage">
                            <img src="http:${products[0][i].imageName}" class="" width="292" height="292" alt="">
                        </span>
                        <strong class="name fn">${products[0][i].name}</strong>
                        
                        <span class="productDetails">       
                            <span class="for price sale">Por: <strong>${products[0][i].price}</strong></span>
                            <span class="installment">
                                ${products[0][i].productInfo.paymentConditions}
                            </span>
                        </span>
                        
                    </a>
                </div>
                </li>`                         
            }  
            conteudo.push(produto);       
    };
    return conteudo;
}
