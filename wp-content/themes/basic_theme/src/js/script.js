import $ from "jquery";
import axios from "axios";
import "slick-slider";
import YTPlayer from "yt-player";
import "./carousel.js";
import "./selectorStylize.js";
import "./calendar.js";
import "./vueAdd.js";
import "./back.js";
import { TweenLite, TimelineLite, Power2 } from "gsap";

document.addEventListener("DOMContentLoaded", function(event) {
    pageLoad();
});

function pageLoad() {
    if (!/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        document.body.classList.add("desktop");
    } else {
        document.body.classList.add("mobile");
    }

    var inputLabel = document.querySelectorAll(".label-text");
    if (inputLabel) {
        inputNotEmpty(inputLabel);
    }

    var inputTextarea = document.querySelectorAll(".label-text textarea");
    if (inputTextarea) {
        inputTextarea.forEach(inputTextarea => {
            var defaultHeight = inputTextarea.offsetHeight;
            elasticElement(inputTextarea, defaultHeight);
            inputTextarea.addEventListener(
                "input",
                () => {
                    elasticElement(inputTextarea, defaultHeight);
                },
                false
            );
        });
    }

    var labelInputFile = document.querySelectorAll(".label-file input");
    if (labelInputFile) {
        for (var f = 0; f < labelInputFile.length; f++) {
            labelInputFile[f].addEventListener("change", function() {
                inputFileName(this);
            });
        }
    }

    if (window.innerWidth > 1200) {
        if (!document.getElementById("body-wrap").classList.contains("report-body-wrap")) {
            openDesktopMenu();
        }
    } else {
        if (!document.getElementById("body-wrap").classList.contains("report-body-wrap")) {
            openMobileMenu();
        }
    }

    addAnim();

    var videoBtnOpen = document.querySelectorAll(".js-btn-video");
    var videoModal = document.getElementById("js-modal-video");
    if (videoBtnOpen) {
        for (var i = 0; i < videoBtnOpen.length; i++) {
            videoBtnOpen[i].addEventListener("click", function(event) {
                event.preventDefault();
                openVideoModal(videoModal, this.getAttribute("data-video"));
            });
        }
    }

    var videoItemOpen = document.querySelectorAll(".js-open-video");
    if (videoItemOpen) {
        for (var i = 0; i < videoItemOpen.length; i++) {
            videoItemOpen[i].addEventListener("click", function(event) {
                event.preventDefault();
                openVideoModal(videoModal, this.getAttribute("data-video"));
            });
        }
    }

    var galleryPhoto = document.getElementsByClassName("js-collection-photo");
    var modalGalleryBlock = document.getElementById("js-modal-gallery");

    var addFirst = true;

    for (let g = 0; g < galleryPhoto.length; g++) {
        galleryPhoto[g].addEventListener("click", function() {
            if (addFirst) {
                addFirst = false;
                $("#js-main-gallery-carousel").slick({
                    infinite: true,
                    dots: false,
                    arrows: true,
                    swipeToSlide: true,
                    fade: true,
                    slidesToShow: 1,
                    prevArrow: $("#js-main-gallery-carousel")
                        .parent()
                        .find(".gallery-controls .prev"),
                    nextArrow: $("#js-main-gallery-carousel")
                        .parent()
                        .find(".gallery-controls .next"),
                    asNavFor: "#js-gallery-carousel"
                });

                $("#js-gallery-carousel").slick({
                    infinite: true,
                    dots: false,
                    arrows: false,
                    swipeToSlide: true,
                    variableWidth: true,
                    focusOnSelect: true,
                    asNavFor: "#js-main-gallery-carousel"
                });
            }
            $("#js-main-gallery-carousel").slick("slickGoTo", g);
            openModal(modalGalleryBlock);
        });
    }

    if (document.getElementById("ukraine-map")) {
        mapRegions();
    }

    if (document.getElementById("full-panel-small")) {
        var btnInfo = document.getElementById("btn-info-main");
        var panelSideLeft = document.getElementById("panel-side-left");
        var panelSideRight = document.getElementById("panel-side-right");
        var panelSideRightInner = document.getElementById("panel-side-right-inner");
        var tc = new TimelineLite();
        if (window.innerWidth > 960) {
            tc.set(panelSideRight, { scale: 0, transformOrigin: "-50% 100%", autoAlpha: 0, borderRadius: "30px", height: 0 }).set(panelSideRightInner, { autoAlpha: 0, y: "5%" });
        } else {
            tc.set(panelSideRight, { scale: 0, transformOrigin: "0% 100%", autoAlpha: 0, borderRadius: "30px", height: 0 }).set(panelSideRightInner, { autoAlpha: 0, x: "5%" });
        }

        btnInfo.addEventListener("click", function() {
            if (window.innerWidth <= 420) {
                tc.to(btnInfo, 0, { autoAlpha: 0 })
                    .to(panelSideLeft, 0.1, { autoAlpha: 0 })
                    .to(panelSideRight, 0.4, { scale: 1, autoAlpha: 1, borderRadius: "0px", height: "100%", ease: Power2.easeOut })
                    .to(panelSideRightInner, 0.4, { autoAlpha: 1, x: "0%", ease: Power2.easeOut })
                    .to(".section.full-screen", 0.2, { height: panelSideRight.innerHeight + 20 + "px" });
            } else {
                tc.to(btnInfo, 0, { autoAlpha: 0 })
                    .to(panelSideRight, 0.4, { scale: 1, autoAlpha: 1, borderRadius: "0px", height: "100%", ease: Power2.easeOut })
                    .to(panelSideRightInner, 0.4, { autoAlpha: 1, x: "0%", ease: Power2.easeOut });
            }
        });
    }

    if (document.querySelectorAll(".form-request")) {
        var selectAll = document.querySelectorAll(".select-all-link");
        selectAll.forEach(function(selectItem) {
            selectItem.addEventListener("click", function(e) {
                e.preventDefault();
                var parentEl = this.parentElement;
                var allCheckboxes = parentEl.querySelectorAll('input[type="checkbox"]');
                allCheckboxes.forEach(function(selectCheckbox) {
                    selectCheckbox.checked = true;
                });
            });
        });
    }

    if (document.querySelectorAll(".label-with-panel")) {
        var labelPanel = document.querySelectorAll(".label-with-panel");
        var panelGetInfo = document.querySelectorAll(".panel-getinfo");
        labelPanel.forEach(function(labelItem) {
            var input = labelItem.querySelector("input");
            input.addEventListener("input", function() {
                var currentPanel;
                if (input.value > 0 && input.value < 20) {
                    panelGetInfo.forEach(function(thisPanelInfo) {
                        if (thisPanelInfo.getAttribute("data-panel") == "a") {
                            currentPanel = thisPanelInfo;
                        }
                    });
                } else if (input.value >= 20 && input.value < 100) {
                    panelGetInfo.forEach(function(thisPanelInfo) {
                        if (thisPanelInfo.getAttribute("data-panel") == "b") {
                            currentPanel = thisPanelInfo;
                        }
                    });
                } else if (input.value >= 100) {
                    panelGetInfo.forEach(function(thisPanelInfo) {
                        if (thisPanelInfo.getAttribute("data-panel") == "c") {
                            currentPanel = thisPanelInfo;
                        }
                    });
                }
                if (input.value.length > 0) {
                    labelItem.classList.add("open-panel");
                } else {
                    labelItem.classList.remove("open-panel");
                }
                if (currentPanel) {
                    labelItem.querySelector(".drop-panel .drop-panel-type").innerHTML = currentPanel.querySelector(".panel-getinfo-type").innerHTML;
                    labelItem.querySelector(".drop-panel .drop-panel-value").innerHTML = currentPanel.querySelector(".panel-getinfo-price").innerHTML;
                    labelItem.querySelector(".drop-panel .drop-panel-text").innerHTML = currentPanel.querySelector(".panel-getinfo-text").innerHTML;
                }
            });
            input.addEventListener("focusout", function() {
                labelItem.classList.remove("open-panel");
            });
        });
    }

    if (document.querySelectorAll(".form-nav a")) {
        anchorScroll(document.querySelectorAll(".form-nav a"));
    }

    if (document.querySelectorAll(".open-team-modal")) {
        document.querySelectorAll(".open-team-modal").forEach(function(thisItem) {
            thisItem.addEventListener("click", function(e) {
                e.preventDefault();
                openModal(document.getElementById("js-modal-team"));
            });
        });
    }

    // if(document.querySelectorAll('form')){
    //     validation();
    // }

    var th = new TimelineLite();
    if (window.innerWidth > 1200) {
        if (document.getElementById("lang-helper")) {
            th.set("#lang-helper", {
                width: document.getElementById("main-menu-nav").clientWidth + document.getElementById("user-menu").clientWidth + "px",
                y: "-100%",
                autoAlpha: 0,
                maxHeight: "80px"
            });
        }
    } else {
        if (document.getElementById("lang-helper")) {
            th.set("#lang-helper", { width: window.innerWidth + "px", y: "-100%", autoAlpha: 0, maxHeight: "80px" });
        }
    }

    if (sessionStorage.getItem("LangOnce") !== "true") {
        th.to("#lang-helper", 1, { y: "0%", autoAlpha: 1, ease: Power2.easeOut });
        setTimeout(function() {
            if (window.innerWidth > 1200) {
                th.to(".lang-helper-container", 0.2, { autoAlpha: 0, ease: Power2.easeOut })
                    .to("#lang-helper", 0.4, { width: document.getElementById("lang-choose").clientWidth + "px", paddingLeft: 0, paddingRight: 0, ease: Power2.easeOut })
                    .to("#lang-helper", 0.3, { y: "-100%", autoAlpha: 0, ease: Power2.easeOut });
            } else {
                th.to(".lang-helper-container", 0.2, { autoAlpha: 0, ease: Power2.easeOut })
                    .to("#lang-helper", 0.4, { width: "60px", paddingLeft: 0, paddingRight: 0, ease: Power2.easeOut })
                    .to("#lang-helper", 0.3, { y: "-100%", autoAlpha: 0, ease: Power2.easeOut });
            }
        }, 3000);
        sessionStorage.setItem("LangOnce", "true");
    }

    if (document.getElementById("additional-menu")) {
        var additionalMenu = document.getElementById("additional-menu");
        var additinalMenuItems = additionalMenu.querySelectorAll("#additional-menu-list>li>a");
        var additinalMenuItemsWidth = 0;
        var currentAddMenuWidth = 0;
        for (var i = 0; i < additinalMenuItems.length; i++) {
            additinalMenuItemsWidth += additinalMenuItems[i].clientWidth;
        }
        if (window.innerWidth > 1800) {
            additionalMenu.style.left = document.getElementById("main-menu-nav").getBoundingClientRect().left - (window.innerWidth - 1800) / 2 + "px";
            currentAddMenuWidth =
                document.getElementById("main-menu-nav").clientWidth +
                document.getElementById("user-menu").clientWidth -
                document.getElementById("lang-choose").clientWidth -
                document.getElementById("additional-menu-controls").clientWidth +
                20 +
                "px";
        } else {
            additionalMenu.style.left = document.getElementById("main-menu-nav").getBoundingClientRect().left - 30 + "px";
            currentAddMenuWidth = document.getElementById("main-menu-nav").clientWidth + document.getElementById("user-menu").clientWidth - 120 + "px";
        }
        additionalMenu.style.width = currentAddMenuWidth;
        if (currentAddMenuWidth < additinalMenuItemsWidth) {
            document.getElementById("additional-menu-controls").style.display = "none";
        }
    }

    if(document.getElementById('non_member')){

        document.getElementById('non_member').addEventListener('change', function(){
            var nonmember_checbox = document.getElementById('non_member');
            var no_member_field = document.getElementById('no-member_field'); 
            var member_field = document.getElementById('member_field_block');  
            var user_company_field = document.getElementById('user_company_field');  
            var user_company = document.getElementById('member_field');

            user_company_field.value = null;
            if(nonmember_checbox){

                if(nonmember_checbox.querySelector('input').checked == true ){
                    no_member_field.style.display = 'block';
                    member_field.style.display = 'none';
                    user_company_field.classList.remove('hidden');
                    user_company.classList.add('hidden');
                }
                else{
                    no_member_field.style.display = 'none';
                    member_field.style.display = 'block';
                    user_company_field.classList.add('hidden');
                    user_company.classList.remove('hidden');
                }
            }
        });
    }
}

/**
 * add class .not-empty for filled inputs and change empty status on input event
 * @param  inputLabel - label tag
 */
function inputNotEmpty(inputLabel) {
    inputLabel.forEach(function(thisElement) {
        var input = thisElement.querySelector("input");
        if (!input) {
            input = thisElement.querySelector("textarea");
        }
        if (input.value.length > 0) {
            input.classList.add("not-empty");
        }
        input.addEventListener("input", function() {
            if (this.value.length > 0) {
                input.classList.add("not-empty");
            } else {
                input.classList.remove("not-empty");
            }
        });
    });
}

/*
 * add rows in textarea, when user adding text
 * inputTextarea example - document.querySelectorAll('.label-text .input-textarea')[0]
 * defaultHeight - float number in px
 */
function elasticElement(inputTextarea, defaultHeight) {
    inputTextarea.style.height = defaultHeight + "px";
    inputTextarea.style.height = inputTextarea.scrollHeight + 5 + "px";
}

/*
 * change view input[type="file"], when file upload
 */

function inputFileName(inputFile) {
    var fullPath = inputFile.value;
    if (fullPath) {
        var startIndex = fullPath.indexOf("\\") >= 0 ? fullPath.lastIndexOf("\\") : fullPath.lastIndexOf("/");
        var filename = fullPath.substring(startIndex);
        if (filename.indexOf("\\") === 0 || filename.indexOf("/") === 0) {
            filename = filename.substring(1);
        }
        var inputFileParent = inputFile.parentNode;
        inputFileParent.classList.add("uploaded-file");
        var inputFileText = inputFileParent.querySelector(".file-name");
        inputFileText.innerHTML = filename;
    }
}

/**
 * add line to current hovered item in main menu
 */
function openDesktopMenu() {
    var header = document.getElementById("header");
    var line = document.getElementById("main-menu-line");
    var mainMenuNav = document.getElementById("main-menu-nav");
    var mainMenu = document.getElementById("main-menu");
    var mainMenuItems = document.querySelectorAll("#main-menu>li>a");

    var mainMenuSquare = document.getElementById("main-menu-square");
    var mainMenuSquareWrap = document.getElementById("main-menu-square-wrap");
    var userMenuInner = document.getElementById("user-menu-inner");
    var userMenuInnerWrap = document.getElementById("user-menu-inner-wrap");

    var tl = new TimelineLite();
    tl.set(mainMenuSquare, { y: "-100%" })
        .set(mainMenuSquareWrap, { y: "-10%", autoAlpha: 0 })
        .set(userMenuInner, { y: "-100%" })
        .set(userMenuInnerWrap, { y: "-10%", autoAlpha: 0 })
        .set(document.getElementById("current-choosed"), { autoAlpha: 1 });

    var openMenu = [document.getElementById("btn-menu"), document.querySelector(".current-lang")];
    openMenu.forEach(function(thisOpenMenu) {
        thisOpenMenu.addEventListener(
            "click",
            function(e) {
                e.preventDefault();
                if (this == document.getElementById("btn-menu") && document.getElementById("btn-menu").classList.contains("open-menu")) {
                    header.classList.remove("open-menu");
                    controlsMenuClose();
                    return false;
                }
                mainMenuItems[0].classList.add("active");
                header.classList.add("open-menu");
                controlsMenuOpen();
                addFolower(document.querySelector("#main-menu>li>a.active"));
                document.getElementById("current-choosed").innerHTML = document.querySelector("#main-menu>li>a.active").innerHTML;
                document.getElementById("current-choosed").setAttribute("href", document.querySelector("#main-menu>li>a.active").getAttribute("href"));
            },
            false
        );
    });

    mainMenuItems.forEach(function(thisItem) {
        thisItem.addEventListener("click", function(e) {
            if (this.nextSibling) {
                e.preventDefault();
                header.classList.add("open-menu");
                if (this.classList.contains("active")) {
                    e.preventDefault();
                }
                mainMenuItems.forEach(function(thisItem) {
                    thisItem.classList.remove("active");
                });
                this.classList.add("active");
                controlsMenuOpen();
                addFolower(document.querySelector("#main-menu>li>a.active"));
            }
        });
    });

    function controlsMenuOpen() {
        line.classList.add("visible");
        document.body.classList.add("body-overflow-mode");

        document.getElementById("current-choosed").innerHTML = document.querySelector("#main-menu>li>a.active").innerHTML;
        document.getElementById("current-choosed").setAttribute("href", document.querySelector("#main-menu>li>a.active").getAttribute("href"));

        if (document.querySelector("#main-menu>li>a.active").classList.contains("no-page")) {
            document.getElementById("current-choosed").classList.add("no-page");
        } else {
            document.getElementById("current-choosed").classList.remove("no-page");
        }

        document.getElementById("btn-menu").classList.add("open-menu");
        tl.to(userMenuInner, 0.4, { y: "0%", ease: Power2.easeOut })
            .to(mainMenuSquare, 0.4, { y: "0%", ease: Power2.easeOut }, "-=.3")
            .to(userMenuInnerWrap, 0.4, { y: "0%", autoAlpha: 1, ease: Power2.easeOut }, "-=.2")
            .to(mainMenuSquareWrap, 0.4, { y: "0%", autoAlpha: 1, ease: Power2.easeOut }, "-=.2");

        document.addEventListener(
            "click",
            function(e) {
                var target = e.target;
                var thisBlock = target == document.getElementById("main-menu-nav") || document.getElementById("main-menu-nav").contains(target);
                var thatBlock = target == document.getElementById("user-menu") || document.getElementById("user-menu").contains(target);

                if (!thisBlock && !thatBlock) {
                    header.classList.remove("open-menu");
                    controlsMenuClose();
                }
            },
            false
        );
    }

    function controlsMenuClose() {
        document.getElementById("btn-menu").classList.remove("open-menu");
        document.body.classList.remove("body-overflow-mode");
        line.classList.remove("visible");
        tl.to(userMenuInnerWrap, 0.4, { y: "-10%", autoAlpha: 0, ease: Power2.easeOut })
            .to(userMenuInner, 0.4, { y: "-100%", ease: Power2.easeOut }, "-=.2")
            .to(mainMenuSquareWrap, 0.4, { y: "-10%", autoAlpha: 0, ease: Power2.easeOut })
            .to(mainMenuSquare, 0.4, { y: "-100%", ease: Power2.easeOut }, "-=.3");

        mainMenuItems.forEach(function(thisItem) {
            thisItem.classList.remove("active");
        });
    }

    function addFolower(activeMenu) {
        var mainMenuNavLeft = mainMenuNav.getBoundingClientRect().left;

        line.style.left = activeMenu.getBoundingClientRect().left - mainMenuNav.getBoundingClientRect().left + "px";
        line.style.width = activeMenu.clientWidth + "px";

        mainMenuItems.forEach(function(thisItem) {
            thisItem.addEventListener("click", function(e) {
                if (this.nextSibling) {
                    if (this.classList.contains("active")) {
                        e.preventDefault();
                    }
                }
                mainMenuItems.forEach(function(thisItem) {
                    thisItem.classList.remove("active");
                });
                this.classList.add("active");
                activeMenu = document.querySelector("#main-menu>li>a.active");
            });
            thisItem.addEventListener("mouseenter", function() {
                line.style.left = this.getBoundingClientRect().left - mainMenuNav.getBoundingClientRect().left + "px";
                line.style.width = this.clientWidth + "px";
            });
            thisItem.addEventListener("mouseout", function() {
                line.style.left = activeMenu.getBoundingClientRect().left - mainMenuNav.getBoundingClientRect().left + "px";
                line.style.width = activeMenu.clientWidth + "px";
            });
        });
    }
}

function openMobileMenu() {
    var btnMenu = document.getElementById("btn-menu");
    var header = document.getElementById("header");
    var userInfo = document.getElementById("user-info");

    btnMenu.addEventListener("click", function() {
        header.classList.toggle("open-menu");
        btnMenu.classList.toggle("open-menu");
        document.body.classList.toggle("body-overflow-mode");
        document.body.classList.toggle("body-overflow-mode-white");
        if (!document.body.classList.contains("body-overflow-mode")) {
            header.classList.remove("open-menu-user");
        }
    });
    userInfo.addEventListener("click", function() {
        header.classList.toggle("open-menu-user");
    });
}

function addAnim() {
    var windowTop = window.pageYOffset;
    var imgAnim = document.querySelectorAll(".img-anim");

    if (imgAnim) {
        var bool = [];
        imgAnim.forEach(function(itemImg, i) {
            bool[i] = true;

            imgAnimate(itemImg);

            function imgAnimate(itemImg) {
                if (bool[i]) {
                    var spanAfter = document.createElement("span");
                    spanAfter.classList.add("after");

                    itemImg.appendChild(spanAfter);

                    var imgInner = itemImg.querySelector("img");

                    var tlA = new TimelineLite();
                    tlA.set(imgInner, { autoAlpha: 0 }).set(spanAfter, { x: "-100%", autoAlpha: 0 });

                    var topElement = itemImg.getBoundingClientRect().top;
                    if (topElement < window.innerHeight * 0.7) {
                        tlA.to(spanAfter, 0.4, {
                            x: "0%",
                            autoAlpha: 1,
                            ease: Power1.easeInOut
                        })
                            .to(imgInner, 0.1, {
                                autoAlpha: 1,
                                ease: Power1.easeInOut
                            })
                            .to(spanAfter, 0.4, {
                                x: "110%",
                                ease: Power1.easeInOut
                            });

                        setTimeout(function() {
                            spanAfter.remove();
                        }, 1200);
                        bool[i] = false;
                    }
                }
            }

            window.addEventListener("scroll", function() {
                imgAnimate(itemImg);
            });
        });
    }
}

/**
 * open modal window
 */
function openModal(modal) {
    var windowScrollTo = window.pageYOffset;

    modal.classList.add("modal-open");
    document.body.classList.add("body-overflow");

    closeModal(modal, windowScrollTo);
}

function openVideoModal(modal, videoSrc) {
    openModal(modal);

    if (modal == document.getElementById("js-modal-video")) {
        var modalDialog = modal.querySelector(".js-modal-dialog");
        modalDialog.innerHTML =
            '<iframe id="video" class="video" src="https://www.youtube.com/embed/' +
            videoSrc +
            '?enablejsapi=1&html5=1" frameborder="0" allowfullscreen autoplay muted data-video="' +
            videoSrc +
            '"></iframe>';
        var player = new YTPlayer("#video");
        player.load(videoSrc);
        setTimeout(function() {
            player.play();
        }, 100);
    }
}

function closeModal(modal, windowScrollTo) {
    var modalClose = modal.getElementsByClassName("js-modal-close");
    var modalDialog = modal.getElementsByClassName("js-modal-dialog");

    for (var i = 0; i < modalClose.length; i++) {
        modalClose[i].addEventListener("click", function(ev) {
            ev.preventDefault();
            closeModalInner(modal, windowScrollTo);
        });
    }

    modal.addEventListener("click", function(e) {
        var target = e.target;
        var thisBlock = target == modalDialog[0] || modalDialog[0].contains(target);
        if (!thisBlock) {
            closeModalInner(modal, windowScrollTo);
        }
    });

    document.addEventListener("keydown", function(e) {
        if (e.keyCode === 27) {
            closeModalInner(modal, windowScrollTo);
        }
    });
}

function closeModalInner(modal, windowScrollTo) {
    document.body.classList.remove("body-overflow");
    modal.classList.remove("modal-open");
    if (modal == document.getElementById("js-modal-video")) {
        var modalDialog = modal.querySelector(".js-modal-dialog");
        modalDialog.innerHTML = "";
    }
    // window.scrollTo({ top: windowScrollTo, left: 0, behavior: 'smooth' });
}

function mapRegions(){
    var regionGroup = document.querySelectorAll('.region-group');
    var regionCenter = document.querySelectorAll('.region-center');
    var mapContent = document.getElementById('map-content');

    for(var i = 0; i < regionGroup.length; i++){
        regionGroup[i].addEventListener('click', function(event){
            axiosMap(this, regionGroup, regionCenter);
            setMapContent(event, mapContent);
        });
        regionCenter[i].addEventListener('click', function(event){
            axiosMap(this, regionGroup, regionCenter);
            setMapContent(event, mapContent);
        });
    }
}

function setMapContent(event, mapContent){
    var mapUkraine = document.getElementById('ukraine-map');
    var b = mapUkraine.getBoundingClientRect();

    var x = event.clientX - b.left;
    var y = event.clientY - b.top;

    console.log(event.clientX);

    mapContent.style.top = y + 3 +'px';
    mapContent.style.left = x + window.innerWidth * 0.065 + 'px';
    mapContent.classList.remove('hidden');
}

function axiosMap(thisElement, regionGroup, regionCenter){
    for(var j = 0; j < regionGroup.length; j++){
        regionGroup[j].classList.remove('active-region');
        regionCenter[j].classList.remove('active-region');
        if(thisElement.getAttribute('data-region') == regionCenter[j].getAttribute('data-region')){
            regionCenter[j].classList.add('active-region');
            regionGroup[j].classList.add('active-region');
        }
    }
    var region = thisElement.getAttribute('data-region');

    // var region_name = thisElement.children[1].innerHTML;

    if(document.getElementById('map-wrap')){
        var page_id = document.getElementById('map-wrap').getAttribute("data-page");
    }

    axios({
        method: "post",
        url: window.api_settings.ajax_url  + '?action=getRegionCompanies&region=' + region + '&page_id=' + page_id,
    })
    .then(response => {
        setMap(response.data, region);
    })
    .catch(error => {
        console.log(error);
    });
}

function setMap(data, region) {
    var companiesWrap = document.getElementById("companies-wrap");
    var mapContent = document.getElementById("map-content");
    var content = "";
    var smallContent = "";
    // var allText = "Всі компанії області";
    // var allEmptyText = "В обраній області компаній немає.";
    
    companiesWrap.innerHTML = "";
    // mapContent.innerHTML = '';

    if (data.region == region) {
        if (data.companies.length > 0) {
            content += '<h2 class="h2">' + data.region_data.companiesTitle + '</h2>\
                <div class="row">';
        }

        smallContent += '<span class="map-content-title">' + data.region_data.title + "</span>";
        for (var i = 0; i < data.companies.length; i++) {
            content +=
                '<div class="column col-3 col-sm-6">\
                        <a href="' +
                data.companies[i].link +
                '" class="imagein-block">\
                            <img src="' +
                data.companies[i].compnie_logo +
                '">\
                        </a>\
                    </div>';
        }

        if (data.companies.length > 0) {
            // smallContent += '<button class="companies-button"><a href="#companies" class="link companies-anchor" id="companies-anchor">' + data.allText + "</a></button>";
            
        for(var i= 0; i< data.region_link.length;i++){
            smallContent += "<div class='link_container'><a href='" + data.region_link[i].link + "' target='_blank' class='map_link'>" + data.region_link[i].title + "</a></div>";
        }
            
        } else {
            smallContent += "<span>" + data.allEmptyText + "</span>";
        }

        content += "</div>";
    }

    companiesWrap.innerHTML = content;
    mapContent.innerHTML = smallContent;

    var companiesAnchor = document.querySelector("#companies-anchor");
    companiesAnchor.addEventListener("click", function(e) {
        e.preventDefault();
        var companies = document.getElementById("companies");
        var companiesTop = companies.getBoundingClientRect().top + window.pageYOffset - 30;
        window.scrollTo({ top: companiesTop, left: 0, behavior: "smooth" });
    });
}

function anchorScroll(anchorlinks){
	var anchorLength = anchorlinks.length;

	if(anchorlinks){
		for(var i = 0; i < anchorLength; i++){
			anchorlinks[i].addEventListener('click', function(e) {
				var hashval =  this.getAttribute('href');
                var target = document.querySelector(hashval);

				var targetTop = target.getBoundingClientRect().top - 40 + window.pageYOffset;
                
				window.scrollTo({ top: targetTop, left: 0, behavior: 'smooth' });
				e.preventDefault();
			});
		}
	}
	
}

/*
    notification show/hode
    (string) type - type of message (can be info, success and error) 
    (string) name - name of message
    (string) message - text of message
*/
function notificationOpen(type, name, message) {
    var notification = document.getElementById("notification");

    notification.querySelector(".notification-title").innerHTML = name;
    notification.querySelector(".notification-content").innerHTML = message;

    notification.classList.add("open-notification");
    if (type == "info") {
        notification.classList.add("info");
        notification.classList.remove("success");
        notification.classList.remove("error");
        setTimeout(function() {
            notificationClose();
        }, 3000);
    } else if (type == "success") {
        notification.classList.add("success");
        notification.classList.remove("info");
        notification.classList.remove("error");
        setTimeout(function() {
            notificationClose();
        }, 3000);
    } else if (type == "error") {
        notification.classList.add("error");
        notification.classList.remove("info");
        notification.classList.remove("success");
    }

    notification.querySelector(".btn-close").addEventListener("click", function() {
        notificationClose();
    });
}

function notificationClose() {
    var notification = document.getElementById("notification");
    notification.classList.remove("open-notification");
    notification.classList.remove("info");
    notification.classList.remove("success");
    notification.classList.remove("error");

    notification.querySelector(".notification-title").innerHTML = "";
    notification.querySelector(".notification-content").innerHTML = "";
}

/*
 * form initialize
 */
// function validation(){

// 	var textRegExp = new RegExp("^.{3,40}$");
// 	var mailRegExp = new RegExp("^[A-z0-9_-]+@[A-z0-9-]+\.[A-z]{2,15}$");
// 	var phoneRegExp = new RegExp("^[0-9\- ()+]{4,20}$");

// 	var validation = {
// 		isEmail: function(str) {
// 		    var pattern =/^[A-z0-9_-]+@[A-z0-9-]+\.[A-z]{2,15}$/;
// 		    return pattern.test(str);
// 		},
// 		isNotEmpty: function (str) {
// 		    var pattern =/\S+/;
// 		    return pattern.test(str);
// 		},
// 		isNumber: function(str) {
// 		    var pattern = /^\d+$/;
// 		    return pattern.test(str);
// 		},
// 		isPhone: function(str){
// 			var pattern = /^[0-9\- ()+]{4,20}$/;
// 			return pattern.test(str);
// 		},
// 		isLetter: function(str){
// 			var pattern = /^.{3,40}$/;
// 			return pattern.test(str);
// 		},
// 		isDate: function(str){
// 			var pattern = /^\s*(3[01]|[12][0-9]|0?[1-9])\.(1[012]|0?[1-9])\.((?:19|20)\d{2})\s*$/;
// 			return pattern.test(str);
// 		}
// 	};

// 	var notifications = {
// 		empty: 'Заповніть поле',
// 		mail: 'Введіть правильний e-mail',
// 		phone: 'Введіть правильний номер',
// 		error: 'Перевірте правильність введених даних',
// 	}

// 	var validateForm = document.querySelectorAll(".js-validate-form");

// 	for(var v = 0; v < validateForm.length; v++){
// 		validateForm[v].addEventListener('submit', function(e){
// 			e.preventDefault();
// 			var canSubmit = true;

// 			var labelLetter = this.querySelectorAll('.label-letter');
// 			var labelMail = this.querySelectorAll('.label-mail');
// 			var labelPhone = this.querySelectorAll('.label-phone');
// 			var labelNumber = this.querySelectorAll('.label-number');
// 			var labelDate = this.querySelectorAll('.label-date');
// 			var labelRequired = this.querySelectorAll('.label-required');

// 			for(var i = 0; i < labelRequired.length; i++){
// 				var empty = validation.isNotEmpty(labelRequired[i].querySelector('input').value);
// 				if(!empty){
// 					canSubmit = false;
// 					labelRequired[i].classList.add('error');
// 					labelRequired[i].querySelector('.text-notification').innerHTML = notifications.empty;
// 				} else {
// 					labelRequired[i].classList.remove('error');
// 				}
// 			}

// 			for(var i = 0; i < labelMail.length; i++){
// 				var mailVal = validation.isEmail(labelMail[i].querySelector('input').value);
// 				if(!mailVal){
// 					canSubmit = false;
// 					labelMail[i].classList.add('error');
// 					labelMail[i].querySelector('.text-notification').innerHTML = notifications.mail;
// 				} else {
// 					labelMail[i].classList.remove('error');
// 				}
// 			}

// 			for(var i = 0; i < labelPhone.length; i++){
// 				var phoneVal = validation.isPhone(labelPhone[i].querySelector('input').value);
// 				if(!phoneVal){
// 					canSubmit = false;
// 					labelPhone[i].classList.add('error');
// 					labelPhone[i].querySelector('.text-notification').innerHTML = notifications.phone;
// 				} else {
// 					labelPhone[i].classList.remove('error');
// 				}
// 			}

// 			for(var i = 0; i < labelNumber.length; i++){
// 				var numberVal = validation.isNumber(labelNumber[i].querySelector('input').value);
// 				if(!numberVal){
// 					canSubmit = false;
// 					labelNumber[i].classList.add('error');
// 					labelNumber[i].querySelector('.text-notification').innerHTML = notifications.error;
// 				} else {
// 					labelNumber[i].classList.remove('error');
// 				}
// 			}

// 			for(var i = 0; i < labelDate.length; i++){
// 				var dateVal = validation.isDate(labelDate[i].querySelector('input').value);
// 				if(!dateVal){
// 					canSubmit = false;
// 					labelDate[i].classList.add('error');
// 					labelDate[i].querySelector('.text-conification').innerHTML = notifications.error;
// 				} else {
// 					labelDate[i].classList.remove('error');
// 				}
// 			}

// 			if(canSubmit){
// 				this.classList.add('valid-form');
// 				var formThis = this;
// 				setTimeout(function(){
// 					formThis.submit();
// 				}, 1000);
// 			} else {
//                 var errorBlocks = document.querySelectorAll('.label-text.error');
//                 var errorBlocksTop = errorBlocks[0].getBoundingClientRect().top + window.pageYOffset - 100;
//                 window.scrollTo({ top: errorBlocksTop, left: 0, behavior: 'smooth' });
//             }
// 		});
// 	}
// }
