<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Payment Table</title>
	</head>	
	<tr><td><a href="/home">Home</a>  </td>  
	<body>
		<h2>Payments</h2>
		<h4>Select * from payment; </h4>
	 
		<table border="1">
			
			<tr>
				<td><h2>pid</h2></td>
				<td><h2>price</h2></td>
     			<td><h2>paid</h2></td>
			</tr>

			<?php				
				$host = "34.72.168.82";
				$user = "KOC";
				$password = "KOC";
				$database = "dentistdb";				
				
				$query = "Select * from payment";
				//Connect to the database
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				//Set connection to UTF-8
				mysqli_query($connect,"SET NAMES utf8");
				//Select data
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);
				while($row = $result->fetch_array())
				{
					echo "<tr>";
					echo "<td><h2>" .$row['pid'] . "</h2></td>";
					echo "<td><h2>" .$row['price'] . "</h2></td>";
					echo "<td><h2>" .$row['paid'] . "</h2></td>";
					echo "</tr>";
				}
			?>

		<table>
	</body>
</html>