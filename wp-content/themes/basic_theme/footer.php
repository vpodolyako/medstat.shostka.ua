<?php
global $options_fields;
?>

<footer class="footer">
    <div class="wrap">
        <div class="row">
            <div class="col-4 col-xlg-3 col-md">
                <a href="<?php echo pll_home_url($cur_lang); ?>" class="logo">
                    <img src="<?php echo get_template_directory_uri() ?>/img/acc-logo.svg" alt="ACC">
                </a>
            </div> 
            <div class="col-4 col-xlg-4 col-md-6 col-xs">
                <a href="<?= $options_fields['address_google_link']; ?>" target="_blank" class="contact footer-text">
                    <span>
                        <?= $options_fields['footer_address']; ?>
                    </span>
                </a>
            </div>
            <div class="col-4 col-md-5 col-xs">
                <div class="footer-text">
                    <a href="mailto:<?= $options_fields['footer_e-mail']; ?>" class="contact">e-mail: <?= $options_fields['footer_e-mail']; ?> </a>
                    <a href="tel: <?= $options_fields['footer_phone']; ?>" class="contact">Phone: <?= $options_fields['footer_phone']; ?> </a>
                </div>
            </div>
        </div>
        <div class="row footer-row-reverse-sm">
            <div class="col-4 col-xlg-2 col-sm">
                <span class="copyright">&copy; 1992 - 2019</span>
            </div>
            <div class="col-4 col-xlg-6 col-sm">
                <a href="https://veedoo.io/" target="_blank" class="developed">
                    <span class="text">Designed and developed by</span>
                    <img src="<?= get_template_directory_uri();?>/img/veedoo-logo.svg" alt="Veedoo" class="img">
                </a>
            </div>
            <div class="col-4 col-sm">
                <ul class="footer-social">
                    <li>

                        <a href="<?= $options_fields['facebook']; ?>">
                            <svg class="icon">

                                <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#facebook" />
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="<?= $options_fields['twitter']; ?>">
                            <svg class="icon">
                                <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#twitter" />
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="<?= $options_fields['youtube']; ?>">
                            <svg class="icon">
                                <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#youtube" />
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="<?= $options_fields['linkedin']; ?>">
                            <svg class="icon">
                                <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#linkedin" />
                            </svg>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>

</div>

<script>
    function initMap() {
        if (document.getElementById('google-map')) {
            //console.log("Map working...");

            var map = new google.maps.Map(document.getElementById('google-map'), {
                center: {
                    lat: 50.4223714,
                    lng: 30.5057904
                },
                zoom: 15,
                disableDefaultUI: true
            });
            var iconMarker = {
                url: 'img/icons/colored-icons/pin.png',
                scaledSize: new google.maps.Size(120, 120)
            }

            var marker = new google.maps.Marker({
                position: {
                    lat: 50.438,
                    lng: 30.523
                },
                map: map,
                icon: iconMarker,
            });
        }
    }
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1nAaYGQo0755BOTaM2E68gO7dsoxAeA8&callback=initMap"></script>
<script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
<?php wp_footer(); ?>

</body>

</html>