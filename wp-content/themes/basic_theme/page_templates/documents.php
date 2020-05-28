<?php
/* 
	Template Name: Documents
*/
get_header();
?>

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

		</details>
      </div>
		 
</main>



<?php
get_footer();
?>