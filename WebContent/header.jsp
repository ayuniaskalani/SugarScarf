<!-- just design -->
 <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <img src="image/sugar-logo.png" height="40">
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="Home.php">Home</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Collection<span class="caret"></span></a>
          <ul class="dropdown-menu">
           	<li class="dropdown-header">Square</li>
            <li><a href="Shop.php?type=Square Printed">Square Printed</a></li>
            <li><a href="Shop.php?type=Satin Ombre">Satin Ombre</a></li>
            <li><a href="Shop.php?type=Satin Printed">Satin Printed</a></li>
            
            <li role="separator" class="divider"></li>
            <li class="dropdown-header">Shawl</li>
            <li><a href="Shop.php?type=Plain Shawl">Plain Shawl</a></li>
            <li><a href="Shop.php?type=Ombre Shawl">Ombre Shawl</a></li>
            <li><a href="Shop.php?type=Neck Shawl">Neck Shawl</a></li>
            <li><a href="Shop.php?type=Ombre">Ombre</a></li>
            <li><a href="Shop.php?type=Floral">Floral</a></li>
            
            <li role="separator" class="divider"></li>
            <li class="dropdown-header">Inner Neck</li>
            <li><a href="Shop.php?type=Inner Neck">Inner Neck</a></li>
          </ul>
        </li>
        <li><a href="Location.php">Location</a></li>
        <li><a href="About_us.php">About us</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="<?php echo $acc_redirect ?>"><?php echo $acc_text ?></a></li>
       	<li><?php if($acc_sign==true){ ?> <a href="php_lib/logout.php">Log Out</a> <?php }?></li>
        <li><?php if($acc_sign==true&&$acc_type==true){ ?> <a href="Cart.php">Cart</a> <?php }?></li>
      </ul>
    </div>
  </div>
</nav>