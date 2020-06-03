<?php
/* 
	Template Name: Documents
*/
get_header();
?>

<main class="main docs_page">	

<?php
	$documents_fields = get_fields();
	$documents_laws = $documents_fields['law_base'];
	$documents_reports = $documents_fields['reports'];
?>

    <div class="doc">
		<details>
		<summary><h3><p>Нормативно-правова база</p></h3></summary>
			<?php
			foreach ($documents_laws as $value) {
			?>
				<div class="file">
					<a href="<?= $value['link']; ?>"><h3><?= $value['title']; ?></h3></a> <a download href="<?= $value['link']; ?>"><img src= "<?php bloginfo('template_directory');?>/img/Download.png"/></a>  
				</div>
			<?php
			}
			?>

		</details>

		<details>
		<summary><h3><p>Звіт за 2019 рік</p></h3></summary>
			<?php
			foreach ($documents_reports as $value) {
			?>
				<div class="file">
					<a href="<?= $value['link']; ?>"><h3><?= $value['title']; ?></h3></a> <a download href="<?= $value['link']; ?>"><img src= "<?php bloginfo('template_directory');?>/img/Download.png"/></a>  
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