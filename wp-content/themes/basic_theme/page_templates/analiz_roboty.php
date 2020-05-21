<?php
/* 
	Template Name: Analis_roboty
	*/
get_header();
?>

<?php
//Data analiz algoritm Start//
	$all_illness = [
		['name' => "Новоутворення", 'code' => "С00-D48"],     
		['name' => "Хвороби крові та кровотворних органів", 'code' => "D50-D89"],     
		['name' => "Хвороби ендокринної с-ми ", 'code' => "E00-E90"],    
		['name' => "Розлади психіки та поведінки", 'code' => "F00-F99"],     
		['name' => "Хвороби нервової с-ми ", 'code' => "G00-G99"],     
		['name' => "Хвороби ока ", 'code' => "H00-H59"],     
		['name' => "Хвороби вуха ", 'code' => "Н60-Н95"],     
		['name' => "Хвороби системи кровообігу", 'code' => "I00-I99"],     
		['name' => "Хвороби органів дихання", 'code' => "J00-J99"],     
		['name' => "Хвороби органів травлення", 'code' => "К00-К93"],     
		['name' => "Хвороби шкіри та підшкірної клітковини", 'code' => "L00-L99"],     
		['name' => "Хвороби кістково-м'язової с-ми", 'code' => "M00-M99"],     
		['name' => "Хвороби сечостатевої системи", 'code' => " N00-N99"],     
		['name' => "Травми, отруєння", 'code' => " S00-T98"],
	];

	$blanks = get_posts( array(
		'order'       => 'DESC',
		'post_type'   => 'blanks',
	));

	$all_blanks = count($blanks);
	$man_patients = 0;
	$first_patients = 0;
	$first_man_patients = 0;
	$oblik_patients = 0;

	for ($i=0; $i <$all_blanks ; $i++) { 
		$blank_one_fields =  get_fields($blanks[$i]->ID);
		$patient_sex = $blank_one_fields['sex'];
		$patient_first = $blank_one_fields['first'][0];
		$patient_oblik = $blank_one_fields['oblik'][0];

		if($patient_sex == 'man'){
			$man_patients++;
		}

		if($patient_first == 'first'){
			$first_patients++;
		}

		if($patient_sex == 'man' && $patient_first == 'first'){
			$first_man_patients++;
		}

		if($patient_oblik == 'oblik'){
			$oblik_patients++;
		}
	}
?>

<main class="main">
	<div class="pidroz">
		<table border="1", cellpadding="5", cellspacing="5">
		<hr><caption><h3>ФОРМА №12. ЗВІТ ПРО КІЛЬКІСТЬ ЗАХВОРЮВАНЬ</h3></caption><hr>
			<tr>
				<th class=zagl>НАЙМЕНУВАННЯ</th>
				<th class=zagl>ЗАРЕЄСТРОВАНО ЗАХВОРЮВАНЬ ВСЬОГО</th>
				<th class=zagl>з них у чоловіків</th>
				<th class=zagl>У Т.Ч. ВПЕРШЕ В ЖИТТІ</th>
				<th class=zagl>з них у чоловіків</th>
				<th class=zagl>ПЕРЕБУВАЮТЬ ПІД Д-НАГЛЯДОМ</th>
			</tr>

			<tr>
				<th> Усі хвороби  А00-Т98</th>
				<th> <?= $all_blanks ?> </th>
				<th> <?= $man_patients ?> </th>
				<th> <?= $first_patients ?> </th>
				<th> <?= $first_man_patients ?> </th>
				<th> <?= $oblik_patients ?> </th>
			</tr>

			<?php
				for ($j=0; $j <count($all_illness) ; $j++) { 

					$man_patients = 0;
					$first_patients = 0;
					$first_man_patients = 0;
					$oblik_patients = 0;
					$all_blanks_hvoroba = 0;

					for ($i=0; $i <$all_blanks ; $i++) { 
						$blank_one_fields =  get_fields($blanks[$i]->ID);
						$patient_sex = $blank_one_fields['sex'];
						$patient_first = $blank_one_fields['first'][0];
						$patient_oblik = $blank_one_fields['oblik'][0];
						$patient_hvoroba = $blank_one_fields['hvoroba'];

						if($patient_hvoroba == $all_illness[$j]['code']){
							$all_blanks_hvoroba++;
						}

					
						if($patient_sex == 'man' && $patient_hvoroba == $all_illness[$j]['code']){
							$man_patients++;
						}
					
						if($patient_first == 'first' && $patient_hvoroba == $all_illness[$j]['code']){
							$first_patients++;
						}
					
						if($patient_sex == 'man' && $patient_first == 'first' && $patient_hvoroba == $all_illness[$j]['code']){
							$first_man_patients++;
						}
					
						if($patient_oblik == 'oblik' && $patient_hvoroba == $all_illness[$j]['code']){
							$oblik_patients++;
						}
					}
			?>

			<tr>
				<td><?= $all_illness[$j]['name'] . ' , ' . $all_illness[$j]['code'] ?></td>
				<td> <?php if($all_blanks_hvoroba == 0){ echo "-";} else{ echo $all_blanks_hvoroba;}  ?> </td>
				<td> <?php if($man_patients == 0){ echo "-";} else{ echo $man_patients;}?> </td>
				<td> <?php if($first_patients == 0){ echo "-";} else{ echo $first_patients;}?> </td>
				<td> <?php if($first_man_patients == 0){ echo "-";} else{ echo $first_man_patients;}?> </td>
				<td> <?php if($oblik_patients == 0){ echo "-";} else{ echo $oblik_patients;}?> </td>
			</tr>

			<?php
				}
			?>
		</table>
	</div>
</main>

<?php
get_footer();
?>