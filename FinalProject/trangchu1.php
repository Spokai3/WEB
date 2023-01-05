<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv='X-UA-Compatible' content='IE-edge'>
	<title>Điện máy vàng</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"></script>
	<script src='main.js'></script>
        
    </head>
    <body>
        <?php
		
        $search = isset($_GET['name']) ? $_GET['name'] : "";
        if ($search) {
            $where = "WHERE `name` LIKE '%" . $search . "%'";
        }
        include './connect_db.php';
        $item_per_page = !empty($_GET['per_page'])?$_GET['per_page']:8;
        $current_page = !empty($_GET['page'])?$_GET['page']:1; //Trang hiện tại
        $offset = ($current_page - 1) * $item_per_page;
        if ($search) {
            $products = mysqli_query($con, "SELECT * FROM `product` WHERE `name` LIKE '%" . $search . "%' ORDER BY `id` ASC  LIMIT " . $item_per_page . " OFFSET " . $offset);
            $totalRecords = mysqli_query($con, "SELECT * FROM `product` WHERE `name` LIKE '%" . $search . "%'");
        } else {
            $products = mysqli_query($con, "SELECT * FROM `product` ORDER BY `id` ASC  LIMIT " . $item_per_page . " OFFSET " . $offset);
            $totalRecords = mysqli_query($con, "SELECT * FROM `product`");
        }
        $totalRecords = $totalRecords->num_rows;
        $totalPages = ceil($totalRecords / $item_per_page);
        ?>
        <header class="sticky-top">
		<div class="container">
			<div class="row">
				<div class="col-2 menu">
					<img src="uploads/alogo.png">
				</div>
				<div class="col-2">				
				</div>
				
				<div class="col-8 menu">
				<div id="wrapper-product" class="container">
					<ul>
						<li ><form id="product-search" action="" method="GET">
                            <input style="height:20px; width:110%;" type="text" value="<?=isset($_GET['name']) ? $_GET['name'] : ""?>" name="name" />
						</li>
						<li><form id="product-search" action="" method="GET"><input  style="height:25px; background-color:white;"type="submit" value="Tìm kiếm"></li>
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
            
            <div class="product-items">
                <?php
				
                while ($row = mysqli_fetch_array($products)) {
                    ?>
                    <div class="product-item">
                        <div class="product-img">
							<a href="detail.php?id=<?= $row['id'] ?>"><img src="./<?= $row['image'] ?>" title="<?= $row['name'] ?>" /></a>
                        </div>
                        
                        <label>Giá: </label><span class="product-price"><?= number_format($row['price'], 0, ",", ".") ?> VNĐ</span><br/>
                        <p><?= $row['name'] ?></p>
                        <div class="buy-button">
							<form id="add-to-cart-form" action="cart.php?action=add" method="POST">
								<strong><a href="detail.php?id=<?= $row['id'] ?>">Mua sản phẩm</a></strong><br/>
							</form>
                        </div>
                    </div>
                <?php } ?>
                <div class="clear-both"></div>
                <?php
                include './pagination.php';
                ?>
                <div class="clear-both"></div>
            </div>
        </div>
    </body>
</html>