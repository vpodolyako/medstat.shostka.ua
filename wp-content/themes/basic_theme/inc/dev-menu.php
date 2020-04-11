<style>
	.btn-dev{
		min-width: auto;
		padding: 1rem;
		font-size: 1.2rem;
		line-height: 1.2rem;
		position: fixed;
		z-index: 500;
		bottom: 1rem;
		right: 1rem;
	}
	.dev-menu{
		position: fixed;
		bottom: 10rem;
		right: 1rem;
		background-color: #282828;
		list-style-type: none;
		margin: 0;
		padding: 0;
		width: 200px;
		z-index: 9999999;
		max-height: 80vh;
		overflow-y: auto;
	}

	.dev-menu li a{
		padding: 10px 20px;
		text-decoration: none;
		font-size: 16px;
		font-weight: 600;
		color: #fff;
		display: block;
	}
</style>

<button class="btn btn-dev" type="button" id="btn-dev">
	dev-menu
</button>

<ul class="dev-menu d-none" id="dev-menu">
	<li>
		<a href="/uikit.php">
			UIKit
		</a>
	</li>
	<li>
		<a href="/single-page.php">
			Single Page
		</a>
	</li>
	<li>
		<a href="/login.php">
			Login Page
		</a>
	</li>
	<li>
		<a href="/registration.php">
			Registration Page
		</a>
	</li>
	<li>
		<a href="/password-recovery-1.php">
			Password Recovery Step 1
		</a>
	</li>
	<li>
		<a href="/password-recovery-2.php">
			Password Recovery Step 2
		</a>
	</li>
	<li>
		<a href="/b2b-main.php">
			B2B Main Page
		</a>
	</li>
	<li>
		<a href="/b2b-bne.php">
			B2B - Business Networking Events
		</a>
	</li>
	<li>
		<a href="/b2b-usebv.php">
			B2B – US Express Business Visa
		</a>
	</li>
	<li>
		<a href="/b2g-main.php">
			B2G – Main
		</a>
	</li>
	<li>
		<a href="/b2g-focus-areas.php">
			B2G – Focus Areas
		</a>
	</li>
	<li>
		<a href="/b2g-working-groups.php">
			B2G – Working Groups
		</a>
	</li>
	<li>
		<a href="/b2g-clubs.php">
			B2G – Clubs
		</a>
	</li>
	<li>
		<a href="/b2g-success-stories.php">
			B2G - Success Stories
		</a>
	</li>
	<li>
		<a href="/b2g-single-club.php">
			B2G - Single Club
		</a>
	</li>
	<li>
		<a href="/b2g-single-success-story.php">
			B2G - Single Success Story
		</a>
	</li>
	<li>
		<a href="/b2g-single-working-group.php">
			B2G - Single Working Group
		</a>
	</li>
	<li>
		<a href="/b2g-single-committee-page.php">
			B2G - Single Committee Page
		</a>
	</li>
	<li>
		<a href="/b2u-investment-stories.php">
			B2U - Investment Stories
		</a>
	</li>
	<li>
		<a href="/b2u-search-for-support.php">
			B2U - Search For Support
		</a>
	</li>
	<li>
		<a href="/b2u-jobs-in-the-state-sector.php">
			B2U - Jobs in the state sector
		</a>
	</li>
	<li>
		<a href="/b2u-overview-of-the-ukrainian-economy.php">
			B2U - Overview of the Ukrainian Economy
		</a>
	</li>
	<li>
		<a href="/b2u-invest-in-regions.php">
			B2U - Invest in Regions
		</a>
	</li>
	<li>
		<a href="/b2u-invest-in-ukraine.php">
			B2U - Invest in Ukraine
		</a>
	</li>
	<li>
		<a href="/membership-main.php">
			Membership - Main
		</a>
	</li>
	<li>
		<a href="/membership-list-of-members.php">
			Membership - List of Members
		</a>
	</li>
	<li>
		<a href="/membership-company-profile.php">
			Membership - Company Profile
		</a>
	</li>
	<li>
		<a href="/membership-partners-and-friends.php">
			Membership - Partners and Friends
		</a>
	</li>
	<li>
		<a href="/membership-structure-page.php">
			Membership - Structure Page
		</a>
	</li>
	<li>
		<a href="/membership-discount-platform.php">
			Membership - Discount Platform
		</a>
	</li>
	<li>
		<a href="/membership-discount-platform-single-page.php">
			Membership - Discount Platform Single Page
		</a>
	</li>
	<li>
		<a href="/about-us.php">
			About Us
		</a>
	</li>
	<li>
		<a href="/about-us-board-of-directors.php">
			About Us - Board of Directors
		</a>
	</li>
	<li>
		<a href="/about-us-acc-team.php">
			About Us - ACC Team
		</a>
	</li>
	<li>
		<a href="/about-us-contacts.php">
			About Us - Contacts
		</a>
	</li>
	<li>
		<a href="/about-us-25th-anniversary.php">
			About Us - 25th Anniversary
		</a>
	</li>
	<li>
		<a href="/media-news.php">
			Media - News
		</a>
	</li>
	<li>
		<a href="/media-companies-news.php">
			Media - Companies News
		</a>
	</li>
	<li>
		<a href="/media-single-company-news-page.php">
			Media - Single Company News Page
		</a>
	</li>
	<li>
		<a href="/media-article.php">
			Media - Article
		</a>
	</li>
	<li>
		<a href="/media-article-by-company.php">
			Media - Article By Company
		</a>
	</li>
	<li>
		<a href="/vacancies.php">
			Vacancies
		</a>
	</li>
	<li>
		<a href="/single-vacancy-page.php">
			Single Vacancy page 
		</a>
	</li>
	<li>
		<a href="/calendar.php">
			Calendar
		</a>
	</li>
	<li>
		<a href="/single-event.php">
			Single Event
		</a>
	</li>
	
	<li>
		<a href="/index.php">
			Home Page
		</a>
	</li>
</ul>

<script>
	var btnDev = document.getElementById('btn-dev');
	var devMenu = document.getElementById('dev-menu');
	document.addEventListener('keypress', function(e){
		if(e.keyCode == 113){
			devMenu.classList.toggle('d-none');
		}
	});

	btnDev.addEventListener('click', function(){
		devMenu.classList.toggle('d-none');
	});

</script>