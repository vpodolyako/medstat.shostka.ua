<?php
/* 
	Template Name: Documents
*/
get_header();
?>

<<<<<<< HEAD
<main class="main">		
		<!-- <div class="god"> 		
			<h3>ЗВІТ ЗА 2019 РІК</h3> -->
				<!-- <p>Амбулаторно-поліклінічні показники</p>
				<p>Аналітична довідка(табличний варіант)</p>
				<p>Аналітична довідка</p>
				<p>ЗВІТ про нещасні випадки</p> 
				<p>Комп'ютерна техніка</p>
				<p>Населення</p>
				<p>Статистична ревізія</p>
				<p>Форма 12</p>
				<p>Форма 20</p>
				<p>Форма 50</p> -->
	    <!-- </div> -->
    <div class="doc">
	<hr><h3><p>  </p></h3><hr> 
        <h3><p>Нормативно-правова база</p></h3><hr> 
		<h3><p>Звіт за 2019 рік</h3></p><hr>
        
        <!-- <hr><p>Закони України</p>
        <hr><p>Укази Президента</p>
        <hr><p>Постанови КМ</p>  -->
=======
<main class="main">	

<?php
	$documents_fields = get_fields();
	$documents_laws = $documents_fields['law_base'];
	$documents_reports = $documents_fields['reports'];
?>

<hr> 
    <div class="doc">
		<details>
		<summary><h3><p>Нормативно-правова база</p></h3><hr> </summary>
			<?php
			foreach ($documents_laws as $value) {
			?>
				<div class="file">
					<a href="<?= $value['link']; ?>"><h3><?= $value['title']; ?></h3></a> <a download href="<?= $value['link']; ?>">Завантажити</a>  
				</div>
			<?php
			}
			?>

		</details>

		<details>
		<summary><h3><p>Звіт за 2019 рік</h3></p></summary>
			<?php
			foreach ($documents_reports as $value) {
			?>
				<div class="file">
					<a href="<?= $value['link']; ?>"><h3><?= $value['title']; ?></h3></a> <a download href="<?= $value['link']; ?>">Завантажити</a>  
				</div>
			<?php
			}
			?>
>>>>>>> 8423a3c5a8acda97cc768f68a335da983662a796

		</details>
      </div>
		 
</main>



<?php
get_footer();
?>