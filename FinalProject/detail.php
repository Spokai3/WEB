<!DOCTYPE html>
<html>
    <head>
    <title>Điện máy vàng</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/detail.css" >
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"></script>
	    <script src='main.js'></script>
    </head>
    <body>
        <?php
        include './connect_db.php';
        
        $result = mysqli_query($con, "SELECT * FROM `product` WHERE `id` = ".$_GET['id']);
        $product = mysqli_fetch_assoc($result);
        $imgLibrary = mysqli_query($con, "SELECT * FROM `image_library` WHERE `product_id` = ".$_GET['id']);
        $product['images'] = mysqli_fetch_all($imgLibrary, MYSQLI_ASSOC);
        ?>
        <header class="sticky-top">
		<div >
			<div class="row">
				<div class="col-2 menu">
					<img src="uploads/alogo.png">
				</div>
				<div class="col-2">
				
				</div>

				<div class="col-8 menu">
				<div id="wrapper-product" >
					<ul>
						
						<li><a href="trangchu1.php">Trang chủ</a></li>
						<li>
							<a href="cart.php"><i class="fas fa-cart-arrow-down"></i>Giỏ hàng</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
			</div>
		</div>
	</header>
    <div class="container slider-margin">
		<div class="row">
			<div class="col-12">
					<div class="slideshow-container">
						<div class="image">														
							<img  id="img" onclick="changeImage()" style="width: 100%;" src="uploads/quangcaoa.webp" alt="">
						</div>
						<script>
							var index=0;
							changeImage=function() {
								var imgs=["uploads/quangcaoa.webp","uploads/quangcaob.webp","uploads/quangcaoc.webp"];
								document.getElementById('img').src=imgs[index];
								index++;
								if(index==3){
									index=0;
								}
							}
							setInterval(changeImage,2500);
						</script>		
					</div>	
			</div>
		</div>
        <div class="container">
            <h2>Chi tiết sản phẩm</h2>
            <div id="product-detail">
                <div id="product-img">
                    <img src="./<?=$product['image']?>" />
                </div>
                <div id="product-info">
                    <h1><?=$product['name']?></h1>
                    <label>Giá: </label><span class="product-price"><?= number_format($product['price'], 0, ",", ".") ?> VND</span><br/>
                    <form id="add-to-cart-form" action="cart.php?action=add" method="POST">
                        <input type="number" min="1" max="20" step="1" value="1" name="quantity[<?=$product['id']?>]" size="2" /><br/>
                        <input type="submit" value="Mua sản phẩm" />
                    </form>
                    <?php if(!empty($product['images'])){ ?>
                    <div id="gallery">
                        <ul>
                            <?php foreach($product['images'] as $img) { ?>
                                <li><img src="./<?=$img['path']?>" /></li>
                            <?php } ?>
                        </ul>
                    </div>
                    <?php } ?>
                </div>
                <div class="clear-both"></div>
                <?=$product['content']?>
            </div>
        </div>
    </body>
</html>