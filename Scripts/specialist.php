<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Patient Table</title>
	</head>	
	<tr><td><a href="/home">Home</a>  </td>  
	<body>
		<h2>Patients to refer to specialist</h2>
		<h4>select patient_table.pid, info_table.pname, info_table.pNumber from patient_table inner</h4>
		<h4>join info_table on patient_table.pid=info_table.pid where patient_table.specialist='y';"</h4>
	 
		<table border="1">
			
			<tr>
				<td><h2>pid</h2></td>
				<td><h2>pname</h2></td>
     			<td><h2>pNumber</h2></td>
			</tr>

			<?php				
				$host = "34.72.168.82";
				$user = "KOC";
				$password = "KOC";
				$database = "dentistdb";				
				
				$query = "select patient_table.pid, info_table.pname, info_table.pNumber from patient_table inner join info_table on patient_table.pid=info_table.pid where patient_table.specialist='y';";
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
					echo "<td><h2>" .$row['pNumber'] . "</h2></td>";
					echo "</tr>";
				}
			?>

		<table>
	</body>
</html>