<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>this month</title>
	</head>	
	<tr><td><a href="/home">Home</a>  </td>  
	<body>
		<h2>Appointments This month</h2>
		<h4>select * from appointment_table where app_date < "2021-03-01" and app_date > '2021-01-30';</h4>
	 
		<table border="1">
			
			<tr>
				<td><h2>pid</h2></td>
				<td><h2>pname</h2></td>
     			<td><h2>app_date</h2></td>
				<td><h2>paid</h2></td>
			</tr>

			<?php				
				$host = "34.72.168.82";
				$user = "KOC";
				$password = "KOC";
				$database = "dentistdb";				
				
				$query = "select * from appointment_table where app_date < '2021-03-01' and app_date > '2021-01-30';";
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
					echo "<td><h2>" .$row['pname'] . "</h2></td>";
					echo "<td><h2>" .$row['app_date'] . "</h2></td>";
					echo "<td><h2>" .$row['paid'] . "</h2></td>";
					echo "</tr>";
				}
			?>

		<table>
	</body>
</html>