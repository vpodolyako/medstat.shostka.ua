import moment from "moment";
import "moment/locale/en-au";
import Inputmask from "inputmask";

document.addEventListener("DOMContentLoaded", function(event) {
    logOutUser();
    CompaniesSearch();
    sortingCompanies();
    PartnersSearch();
    sortingPartners();
    IndustryFilterDiscount();
    CompanyFilterDiscount();
    goBack();
    approvedHandler();
    updateProfile();
    getSignleEventTimeLeft();
    getSectorPrice();
    UpdateProfileSubscribe();
    showMoreWorkGroups();
    getManagerTeam();
    IndustryFilter();
    getSidebarEventDate();
    scrollToRegistrationButton();
    getEventsListOfCommitteeGroupClub();
    eventsListFilter();
});

var paginationStories = document.getElementById("pagination_body_success");
var pagination_body_news = document.getElementById("pagination_body_news");
var pagination_body_speesches = document.getElementById("pagination_body_speesches");
var pagination_body_publication = document.getElementById("pagination_body_publication");
var pagination_body_expert_materials = document.getElementById("pagination_body_expert_materials");
var pagination_body_companies_news = document.getElementById("pagination_body_companies_news");
var pagination_body_vacancies = document.getElementById("pagination_body_vacancies");
var pagination_body_companies = document.getElementById("pagination_body_companies");
var pagination_body_partners = document.getElementById("pagination_body_partners");
var pagination_body_promotions = document.getElementById("pagination_body_promotions"); 
var pagination_body_invest_success = document.getElementById("pagination_body_invest_success");
var pagination_body_events =  document.getElementById("pagination_body_events");
var pagination_body_events = document.getElementById("pagination_body_events");


if (paginationStories != null) {
    buildPagination(paginationStories, "success_historys", window.api_settings.success_stories_displayed_per_page, 0, createPagination);
}

if (pagination_body_news != null) {
    buildPagination(pagination_body_news, "news", window.api_settings.simple_news_displayed_per_page, 0, createPagination);
}

if (pagination_body_speesches != null) {
    buildPagination(pagination_body_speesches, "speeches", window.api_settings.president_speeches_displayed_per_page, 0, createPagination);
}

if (pagination_body_publication != null) {
    buildPagination(pagination_body_publication, "publication", window.api_settings.publications_displayed_per_page, 0, createPagination);
}

if (pagination_body_expert_materials != null) {
    buildPagination(pagination_body_expert_materials, "expert_materials", window.api_settings.expert_materials_displayed_per_page, 0, createPagination);
}

if (pagination_body_vacancies != null) {
    buildPagination(pagination_body_vacancies, "vacancies", window.api_settings.vacancies_displayed_per_page, 0, createPagination);
}

if (pagination_body_companies_news != null) {
    buildPagination(pagination_body_companies_news, "company", window.api_settings.companies_news_displayed_per_page, 0, createPagination);
}

if (pagination_body_companies != null) {
    buildPagination(pagination_body_companies, "companies", window.api_settings.number_of_companies_displayed_per_page, 0, createPagination);
    let params = new URLSearchParams(document.location.search.substring(1));
    var order_options = document.getElementsByClassName("order_option");
    var sortFieldHead = params.get("order");
    var filterFieldHead = params.get("filter");

    for (var i = 0; i < order_options.length; i++) {
        if (order_options[i].value == sortFieldHead) {
            order_options[i].setAttribute("selected", "true");
        }
    
        var filter_options = document.getElementsByClassName("filter_options");
        var filterFieldHead = params.get("filter");
    
        for (var i = 0; i < filter_options.length; i++) {
            if (filter_options[i].value == filterFieldHead) {
                filter_options[i].setAttribute("selected", "true");
            }
        }
    }
}

if (pagination_body_partners != null) {
    buildPagination(pagination_body_partners, "partners", window.api_settings.number_of_parthners_displayed_per_page, 0, createPagination);
}

if (pagination_body_promotions != null) {
    buildPagination(pagination_body_promotions, "promotions", window.api_settings.promotions_displayed_per_page, 0, createPagination);

    let params = new URLSearchParams(document.location.search.substring(1));

    var industry_filter_option = document.getElementsByClassName("industry_filter_option");
    var filterFieldHead = params.get("industry");

    for (var i = 0; i < industry_filter_option.length; i++) {
        if (industry_filter_option[i].value == filterFieldHead) {
            industry_filter_option[i].setAttribute("selected", "true");
        }
    }

}

if(pagination_body_invest_success != null){
    buildPagination(pagination_body_invest_success, "investment_successes", window.api_settings.investment_success_stories_displayed_per_page, 0, createPagination);
}

if(pagination_body_events != null){
    buildPagination(pagination_body_events, "events", window.api_settings.events_displayed_per_page, 0, createPagination);
}



/**
 * Create pagination links for all custom post types
*/

/**
 * Function for re-build pagination when user lcik on page or arrow
 */
function buildPaginationRepeater() {
    if (paginationStories != null) {
        buildPagination(paginationStories, "success_historys", window.api_settings.success_stories_displayed_per_page, 0, createPagination);
    }

    if (pagination_body_news != null) {
        buildPagination(pagination_body_news, "news", window.api_settings.simple_news_displayed_per_page, 0, createPagination);
    }

    if (pagination_body_speesches != null) {
        buildPagination(pagination_body_speesches, "speeches", window.api_settings.president_speeches_displayed_per_page, 0, createPagination);
    }

    if (pagination_body_publication != null) {
        buildPagination(pagination_body_publication, "publication", window.api_settings.publications_displayed_per_page, 0, createPagination);
    }

    if (pagination_body_expert_materials != null) {
        buildPagination(pagination_body_expert_materials, "expert_materials", window.api_settings.expert_materials_displayed_per_page, 0, createPagination);
    }

    if (pagination_body_vacancies != null) {
        buildPagination(pagination_body_vacancies, "vacancies", window.api_settings.vacancies_displayed_per_page, 0, createPagination);
    }

    if (pagination_body_companies_news != null) {
        buildPagination(pagination_body_companies_news, "company", window.api_settings.companies_news_displayed_per_page, 0, createPagination);
    }

    if (pagination_body_companies != null) {
        buildPagination(pagination_body_companies, "companies", window.api_settings.number_of_companies_displayed_per_page, 0, createPagination);
    }

    if (pagination_body_partners != null) {
        buildPagination(pagination_body_partners, "partners", window.api_settings.number_of_parthners_displayed_per_page, 0, createPagination);
    }

    if (pagination_body_promotions != null) {
        buildPagination(pagination_body_promotions, "promotions", window.api_settings.promotions_displayed_per_page, 0, createPagination);
    }

    if(pagination_body_invest_success != null){
        buildPagination(pagination_body_invest_success, "investment_successes", window.api_settings.investment_success_stories_displayed_per_page, 0, createPagination);
    }

    if(pagination_body_events != null){
        buildPagination(pagination_body_events, "events", window.api_settings.events_displayed_per_page, 0, createPagination);
        getSidebarEventDate();
    }    
}

/**
 * Create pagination links for all custom post types
 */

/**
 * Function for showing other work groups, when we click to button 'More work groups'
 */
function showMoreWorkGroups() {
    var more_links = document.getElementsByClassName("more_links_wg");

    for (var f = 0; f < more_links.length; f++) {
        more_links[f].addEventListener("click", function(event) {
            event.preventDefault();
            console.log(this.parentNode.querySelectorAll(".wg_link"));
            var wg = this.parentNode.querySelectorAll(".wg_link.hidden");

            for (var i = 0; i < wg.length; i++) {
                wg[i].classList.remove("hidden");
            }

            this.style.display = "none";
        });
    }
}

/**
 * Function for filter promotions by industry of company
 */
function IndustryFilterDiscount() {
    $("#industry_select_discount").change(function() {
        var content;
        var page = 0;
        var count = window.api_settings.promotions_displayed_per_page;
        var filtered_field = this.value;
        var filterResponse = document.getElementById("news_body");
        filterResponse.innerHTML = "";
        var FilterData = new FormData();
        FilterData.append("filtered_field", filtered_field);
        FilterData.append("action", "promotionFilterIndustry");
        FilterData.append("count", count);
        FilterData.append("page_id", page);

        axios
            .post(window.api_settings.ajax_url, FilterData, {
                headers: {
                    "Content-Type": "multipart/form-data"
                }
            })
            .then(function(response) {
                content = "";
                var filterd_companies = [];

                if (history && history.pushState) {
                    //Only do this if history.pushState is supported by the browser
                    var obj = { Title: "test", Url: "tester" };

                    window.history.replaceState(
                        obj,
                        event.target.innerHTML,
                        location.origin + location.pathname + "?pages=" + page + "&industry=" + filtered_field
                    );
                }

                if (response.data.result.length > 0) {
                    for (var i = 0; i < response.data.result.length; i++) {
                        filterd_companies.push(response.data.result[i]);
                    }

                    localStorage.setItem("Filtered_companies", JSON.stringify(filterd_companies));

                    for (var i = 0; i < response.data.result.length; i++) {
                        console.log("cycle");
                        content +=
                            '<div class="col-3-w col-xlg-4-w col-sm-6-w col-xs-w promotion_item" data-company="' +
                            response.data.result[i].companie_refered.post_title +
                            '">\
                        <div class="news-block">\
                            <a href="<?= get_permalink($post_with_logo->ID) ?>" class="news-block-image">\
                                <img src="' +
                            response.data.result[i].logo +
                            '" alt="" class="cover">\
                            </a>\
                            <h3 class="h5 news-block-title">\
                                <a href="<?= get_permalink($post_with_logo->ID) ?>">' +
                            response.data.result[i].post_title +
                            '</a>\
                            </h3>\
                            <span class="news-block-company-name secondary-text">' +
                            response.data.result[i].companie_refered.post_title +
                            '</span>\
                            <div class="news-block-hover">\
                                <div class="news-block-hover-inner">\
                                    <img class="news-block-hover-img" src="' +
                            response.data.result[i].companie_refered_logo +
                            '"/>\
                                    <h3 class="h5 news-block-title">\
                                        <a href="<?= get_permalink($post_with_logo->ID) ?>">\
                                            ' +
                            response.data.result[i].post_title +
                            '\
                                        </a>\
                                    </h3>\
                                    <a class="btn-round" href="#">\
                                        <svg class="icon">\
                                            <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right-arrow" />\
                                        </svg>\
                                    </a>\
                                </div>\
                            </div>\
                            <a href="' +
                            response.data.result[i].link +
                            '" class="inner-link"></a>\
                        </div>\
                    </div>';
                    }

                    filterResponse.innerHTML = content;
                } else {
                    filterResponse.innerHTML = window.api_settings.translations["Your search did not match any"];
                }
                buildPagination(pagination_body_promotions, "promotions", window.api_settings.promotions_displayed_per_page, 0, createPagination);
            });
    });
}

/**
 * Function for filter promotions by name of company
 */
function CompanyFilterDiscount() {
    $("#companies_select_discount").change(function() {
        var content;
        var page = 0;
        var count = window.api_settings.promotions_displayed_per_page;
        var filtered_field = this.value;
        var filterResponse = document.getElementById("news_body");
        filterResponse.innerHTML = "";
        var FilterData = new FormData();
        FilterData.append("companies_filtered_field", filtered_field);
        FilterData.append("action", "promotionFilterIndustry");
        FilterData.append("count", count);
        FilterData.append("page_id", page);

        axios
            .post(window.api_settings.ajax_url, FilterData, {
                headers: {
                    "Content-Type": "multipart/form-data"
                }
            })
            .then(function(response) {
                content = "";
                var filterd_companies = [];

                if (history && history.pushState) {
                    //Only do this if history.pushState is supported by the browser
                    var obj = { Title: "test", Url: "tester" };

                    window.history.replaceState(
                        obj,
                        event.target.innerHTML,
                        location.origin + location.pathname + "?pages=" + page + "&industry=" + filtered_field
                    );
                }

                if (response.data.result.length > 0) {
                    for (var i = 0; i < response.data.result.length; i++) {
                        filterd_companies.push(response.data.result[i]);
                    }

                    localStorage.setItem("Filtered_companies", JSON.stringify(filterd_companies));

                    for (var i = 0; i < response.data.result.length; i++) {
                        console.log("cycle");
                        content +=
                            '<div class="col-3-w col-xlg-4-w col-sm-6-w col-xs-w promotion_item" data-company="' +
                            response.data.result[i].companie_refered.post_title +
                            '">\
                        <div class="news-block">\
                            <a href="<?= get_permalink($post_with_logo->ID) ?>" class="news-block-image">\
                                <img src="' +
                            response.data.result[i].logo +
                            '" alt="" class="cover">\
                            </a>\
                            <h3 class="h5 news-block-title">\
                                <a href="<?= get_permalink($post_with_logo->ID) ?>">' +
                            response.data.result[i].post_title +
                            '</a>\
                            </h3>\
                            <span class="news-block-company-name secondary-text">' +
                            response.data.result[i].companie_refered.post_title +
                            '</span>\
                            <div class="news-block-hover">\
                                <div class="news-block-hover-inner">\
                                    <img class="news-block-hover-img" src="' +
                            response.data.result[i].companie_refered_logo +
                            '"/>\
                                    <h3 class="h5 news-block-title">\
                                        <a href="<?= get_permalink($post_with_logo->ID) ?>">\
                                            ' +
                            response.data.result[i].post_title +
                            '\
                                        </a>\
                                    </h3>\
                                    <a class="btn-round" href="#">\
                                        <svg class="icon">\
                                            <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right-arrow" />\
                                        </svg>\
                                    </a>\
                                </div>\
                            </div>\
                            <a href="' +
                            response.data.result[i].link +
                            '" class="inner-link"></a>\
                        </div>\
                    </div>';
                    }

                    filterResponse.innerHTML = content;
                } else {
                    filterResponse.innerHTML = window.api_settings.translations["Your search did not match any"];
                }
                buildPagination(pagination_body_promotions, "promotions", window.api_settings.promotions_displayed_per_page, 0, createPagination);
            });
    });
        // var data= $(this).val();
        // var content = "";
        // var filtered_field = this.value;
        // var filterResponse = document.getElementById("news_body");
        // // filterResponse.innerHTML = '';

        // var FilterData = new FormData();
        // FilterData.append("filtered_field", filtered_field);
        // FilterData.append("action", "promotionFilter");

        // var all_companies = document.getElementsByClassName("promotion_item");

        // console.log("All companies:");
        // console.log(all_companies);

        // var promotion_list = [];

        // if (filtered_field == "all") {
        //     var companies_filter = JSON.parse(localStorage.getItem("Filtered_companies"));

        //     if (companies_filter.length > 0) {
        //         for (var i = 0; i < companies_filter.length; i++) {
        //             console.log("cycle");
        //             content +=
        //                 '<div class="col-3-w col-xlg-4-w col-sm-6-w col-xs-w">\
        //                 <div class="news-block">\
        //                     <a href="<?= get_permalink($post_with_logo->ID) ?>" class="news-block-image">\
        //                         <img src="' +
        //                 companies_filter[i].logo +
        //                 '" alt="" class="cover">\
        //                     </a>\
        //                     <h3 class="h5 news-block-title">\
        //                         <a href="<?= get_permalink($post_with_logo->ID) ?>">' +
        //                 companies_filter[i].post_title +
        //                 '</a>\
        //                     </h3>\
        //                     <span class="news-block-company-name secondary-text">' +
        //                 companies_filter[i].companie_refered.post_title +
        //                 '</span>\
        //                     <div class="news-block-hover">\
        //                         <div class="news-block-hover-inner">\
        //                             <img class="news-block-hover-img" src="' +
        //                 companies_filter[i].companie_refered_logo +
        //                 '"/>\
        //                             <h3 class="h5 news-block-title">\
        //                                 <a href="<?= get_permalink($post_with_logo->ID) ?>">\
        //                                     ' +
        //                 companies_filter[i].post_title +
        //                 '\
        //                                 </a>\
        //                             </h3>\
        //                             <a class="btn-round" href="#">\
        //                                 <svg class="icon">\
        //                                     <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right-arrow" />\
        //                                 </svg>\
        //                             </a>\
        //                         </div>\
        //                     </div>\
        //                     <a href="' +
        //                 companies_filter[i].link +
        //                 '" class="inner-link"></a>\
        //                 </div>\
        //             </div>';
        //         }

        //         console.log(content);
        //         filterResponse.innerHTML = content;
        //     }
        // } else {
        //     var companies_filter = JSON.parse(localStorage.getItem("Filtered_companies"));

        //     console.log("Companies filter:");
        //     console.log(companies_filter);

        //     for (var f = 0; f < companies_filter.length; f++) {
        //         if (companies_filter[f].companie_refered.post_title == filtered_field) {
        //             promotion_list.push(companies_filter[f]);
        //         }
        //     }

        //     console.log("promotion_list:");
        //     console.log(promotion_list);
        //     content = "";
        //     for (var i = 0; i < promotion_list.length; i++) {
        //         content +=
        //             '<div class="col-3-w col-xlg-4-w col-sm-6-w col-xs-w">\
        //                 <div class="news-block">\
        //                     <a href="<?= get_permalink($post_with_logo->ID) ?>" class="news-block-image">\
        //                         <img src="' +
        //             promotion_list[i].logo +
        //             '" alt="" class="cover">\
        //                     </a>\
        //                     <h3 class="h5 news-block-title">\
        //                         <a href="<?= get_permalink($post_with_logo->ID) ?>">' +
        //             promotion_list[i].post_title +
        //             '</a>\
        //                     </h3>\
        //                     <span class="news-block-company-name secondary-text">' +
        //             promotion_list[i].companie_refered.post_title +
        //             '</span>\
        //                     <div class="news-block-hover">\
        //                         <div class="news-block-hover-inner">\
        //                             <img class="news-block-hover-img" src="' +
        //             promotion_list[i].companie_refered_logo +
        //             '"/>\
        //                             <h3 class="h5 news-block-title">\
        //                                 <a href="<?= get_permalink($post_with_logo->ID) ?>">\
        //                                     ' +
        //             promotion_list[i].post_title +
        //             '\
        //                                 </a>\
        //                             </h3>\
        //                             <a class="btn-round" href="#">\
        //                                 <svg class="icon">\
        //                                     <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right-arrow" />\
        //                                 </svg>\
        //                             </a>\
        //                         </div>\
        //                     </div>\
        //                     <a href="' +
        //             promotion_list[i].link +
        //             '" class="inner-link"></a>\
        //                 </div>\
        //             </div>';
        //     }
        // }

        // filterResponse.innerHTML = "";
        // filterResponse.innerHTML = content;

        // if (content == "") {
        //     filterResponse.innerHTML = "<h3>" + window.api_settings.translations["Your search did not match any"] + "</h3>";
        // }
    // });
}

/**
 * Function for filter companies by name
 */
function IndustryFilter() {
    $("#industry_select").change(function() {
        // var data= $(this).val();
        var content;
        var sortResponse;
        var sort_field = document.getElementById("sort_select").value;
        var page = 0;
        var count = window.api_settings.number_of_companies_displayed_per_page;

        var filtered_field = this.value;
        var filterResponse = document.getElementById("companies_list");
        filterResponse.innerHTML = "";
        var FilterData = new FormData();

        FilterData.append("sort_field", sort_field);
        FilterData.append("filtered_field", filtered_field);
        FilterData.append("action", "companiesFilter");
        FilterData.append("count", count);
        FilterData.append("page_id", page);

        axios
            .post(window.api_settings.ajax_url, FilterData, {
                headers: {
                    "Content-Type": "multipart/form-data"
                }
            })
            .then(function(response) {
                content = "";

                localStorage.setItem("companies_count", response.data.result.length);

                if (history && history.pushState) {
                    //Only do this if history.pushState is supported by the browser
                    var obj = { Title: "test", Url: "tester" };
                    window.history.replaceState(
                        obj,
                        event.target.innerHTML,
                        location.origin + location.pathname + "?pages=" + 0 + "&order=" + sort_field + "&filter=" + filtered_field
                    );
                }

                if (response.data.result.length > 0) {
                    for (var i = 0; i < response.data.result.length; i++) {
                        console.log("cycle");
                        content +=
                            '<div class="column col-3 col-sm-6 companie_item" data-title="' +
                            response.data.result[i].post_title +
                            '">\
                        <a href="<?= get_permalink($company_with_button->ID) ?>" class="imagein-block-with-text">\
                            <img src="' +
                            response.data.result[i].logo +
                            '" alt="' +
                            response.data.result[i].post_title +
                            '">\
                            <span class="h3">' +
                            response.data.result[i].post_title +
                            "</span>\
                        </a>\
                        </div>";
                    }
                    var pagination = "";

                    for (var i = 0; i < response.data.companies_count; i++) {
                        var j = i + 1;
                        pagination +=
                            '<li class="pagination-item pagination_numbers">\
                        <a data-total="' +
                            response.data.companies_count +
                            '" data-page="' +
                            i +
                            '" class="paginator">' +
                            j +
                            "</a>\
                        </li>";
                    }

                    filterResponse.innerHTML = content;
                } else {
                    filterResponse.innerHTML = "<div class='column'><h3>" + window.api_settings.translations["Your search did not match any"] + "</h3></div>";
                }

                buildPagination(pagination_body_companies, "companies", window.api_settings.number_of_companies_displayed_per_page, 0, createPagination);
            });
    });
}

/**
 * Function for sorting companies by name
 */
function sortingCompanies() {
    $("#sort_select").change(function() {
        // var data= $(this).val();
        var content;
        var sort_field = document.getElementById("sort_select").value;
        var filtered_field = document.getElementById("industry_select").value;

        var count = window.api_settings.number_of_companies_displayed_per_page;

        var filterResponse = document.getElementById("companies_list");
        var page = 0;
        var sortResponse;
        filterResponse.innerHTML = "";
        var FilterData = new FormData();

        FilterData.append("sort_field", sort_field);
        FilterData.append("filtered_field", filtered_field);
        FilterData.append("action", "companiesFilter");
        FilterData.append("count", count);
        FilterData.append("page_id", page);
        FilterData.append("request_type", "sort");

        axios
            .post(window.api_settings.ajax_url, FilterData, {
                headers: {
                    "Content-Type": "multipart/form-data"
                }
            })
            .then(function(response) {
                console.log("Sort form:");
                console.log(response.data.result);
                content = "";

                localStorage.setItem("companies_count", response.data.result.length);

                if (history && history.pushState) {
                    //Only do this if history.pushState is supported by the browser
                    var obj = { Title: "test", Url: "tester" };
                    window.history.replaceState(
                        obj,
                        event.target.innerHTML,
                        location.origin + location.pathname + "?pages=" + 0 + "&order=" + sort_field + "&filter=" + filtered_field
                    );
                }

                if (response.data.result.length > 0) {
                    for (var i = 0; i < response.data.result.length; i++) {
                        console.log("cycle");
                        content +=
                            '<div class="column col-3 col-sm-6 companie_item" data-title="' +
                            response.data.result[i].post_title +
                            '">\
                        <a href="<?= get_permalink($company_with_button->ID) ?>" class="imagein-block-with-text">\
                            <img src="' +
                            response.data.result[i].logo +
                            '" alt=" ' +
                            response.data.result[i].post_title +
                            '">\
                            <span class="h3">' +
                            response.data.result[i].post_title +
                            "</span>\
                        </a>\
                        </div>";
                    }

                    filterResponse.innerHTML = content;
                } else {
                    filterResponse.innerHTML =
                        "<div class='column col'><h3>" + window.api_settings.translations["Your search did not match any"] + "</h3></div>";
                }
                buildPagination(pagination_body_companies, "companies", window.api_settings.number_of_companies_displayed_per_page, 0, createPagination);
            });
    });
}

/**
 * Function for sorting partners by name
 */
function sortingPartners() {
    $("#sort_select_partners").change(function() {
        // var data= $(this).val();
        var content;
        var sort_field = this.value;
        var sortResponsePartner = document.getElementById("partners_list");
        sortResponsePartner.innerHTML = "";
        var SortData = new FormData();
        SortData.append("sort_field", sort_field);
        SortData.append("action", "PartnersSort");
        SortData.append("count", window.api_settings.number_of_parthners_displayed_per_page);

        axios
            .post(window.api_settings.ajax_url, SortData, {
                headers: {
                    "Content-Type": "multipart/form-data"
                }
            })
            .then(function(response) {
                content = "";
                if (response.data.result.length > 0) {
                    for (var i = 0; i < response.data.result.length; i++) {
                        console.log("cycle");
                        content +=
                            '<div class="column col-3 col-sm-6 col-">\
                        <a href="<?= get_permalink($company_with_button->ID) ?>" class="imagein-block-with-text">\
                            <img src="' +
                            response.data.result[i].logo +
                            '" alt="' +
                            response.data.result[i].post_title +
                            '">\
                            <span class="h3">' +
                            response.data.result[i].post_title +
                            "</span>\
                        </a>\
                        </div>";
                    }

                    console.log(content);
                    sortResponsePartner.innerHTML = content;
                } else {
                    sortResponsePartner.innerHTML = window.api_settings.translations["Your search did not match any"];
                }

                if (history && history.pushState) {
                    //Only do this if history.pushState is supported by the browser
                    var obj = { Title: "test", Url: "tester" };
                    window.history.replaceState(obj, event.target.innerHTML, location.origin + location.pathname + "?pages=" + 0 + "&order=" + sort_field);
                }

                buildPagination(pagination_body_partners, "partners", window.api_settings.number_of_parthners_displayed_per_page, 0, createPagination);
            });
    });
}

/**
 * Function for search companies by name
 */
function CompaniesSearch() {
    if (document.getElementById("company_search")) {
        document.getElementById("company_search").addEventListener("submit", function(event) {
            event.preventDefault();
            var searchResponse = document.getElementById("search_response");
            var content;
            var search_query = document.getElementById("company_search_query").value;
            searchResponse.classList.remove("hidden");

            var SearchData = new FormData();

            SearchData.append("search_query", search_query);
            SearchData.append("action", "compniesSearch");

            axios
                .post(window.api_settings.ajax_url, SearchData, {
                    headers: {
                        "Content-Type": "multipart/form-data"
                    }
                })
                .then(function(response) {
                    content = "";
                    if (response.data.result.length > 0) {
                        for (var i = 0; i < response.data.result.length; i++) {
                            console.log("cycle");
                            content +=
                                '<li>\
                                <a href="' +
                                response.data.result[i].link +
                                '">\
                                    <span class="search-title">' +
                                response.data.result[i].post_title +
                                '</span>\
                                    <span class="search-text">Переглянути профіль</span>\
                                </a>\
                            </li>';
                        }

                        searchResponse.innerHTML = content;
                    } else {
                        searchResponse.innerHTML = window.api_settings.translations["Your search did not match any"];
                    }
                })
                .catch(function(error) {
                    console.log(error);
                });
        });
    }
}

/**
 * Function for search parthners by name
 */
function PartnersSearch() {
    if (document.getElementById("partners_search")) {
        document.getElementById("partners_search").addEventListener("submit", function(event) {
            event.preventDefault();
            var searchResponsePartners = document.getElementById("search_response_partners");
            var content;
            var search_query = document.getElementById("partners_search_query").value;
            searchResponsePartners.classList.remove("hidden");

            var SearchData = new FormData();

            SearchData.append("search_query", search_query);
            SearchData.append("action", "PartnersSearch");

            axios
                .post(window.api_settings.ajax_url, SearchData, {
                    headers: {
                        "Content-Type": "multipart/form-data"
                    }
                })
                .then(function(response) {
                    content = "";
                    if (response.data.result.length > 0) {
                        for (var i = 0; i < response.data.result.length; i++) {
                            console.log("cycle");
                            content +=
                                '<li>\
                                <a href="' +
                                response.data.result[i].link +
                                '">\
                                    <span class="search-title">' +
                                response.data.result[i].post_title +
                                '</span>\
                                    <span class="search-text">Переглянути профіль</span>\
                                </a>\
                            </li>';
                        }

                        searchResponsePartners.innerHTML = content;
                    } else {
                        searchResponsePartners.innerHTML = window.api_settings.translations["Your search did not match any"];
                    }
                })
                .catch(function(error) {
                    console.log(error);
                });
        });
    }
}

/**
 * Function for sent information about new vacancies request
 */
function sentVacancieForm() {
    if (document.getElementById("vacancy_form")) {
        document.getElementById("vacancy_form").addEventListener("submit", function(event) {
            event.preventDefault();
            var upload_text;
            var input_fields = document.getElementsByClassName("input_field");
            upload_text = $(".file-name").html();
            var empty_fields = 0;

            var notifications = {
                empty: window.api_settings.translations["Fill field"],
                mail: window.api_settings.translations["Please enter the correct e-mail address"],
                phone: window.api_settings.translations["Please enter the correct number"],
                error: window.api_settings.translations["Check that the information you entered is correct"]
            };

            for (var f = 0; f < input_fields.length; f++) {
                if (input_fields[f].classList.contains("required")) {
                    if (input_fields[f].value == "") {
                        input_fields[f].style.borderColor = "tomato";
                        input_fields[f].style.backgroundColor = "#fff6f6";
                        input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.empty;
                        input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 1;
                        input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "visible";
                        input_fields[f].parentNode.querySelector(".text-notification").style.color = "tomato";

                        if (input_fields[f].getAttribute("type") == "tel") {
                            input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.phone;
                        }

                        if (input_fields[f].getAttribute("type") == "email") {
                            input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.mail;
                        }

                        empty_fields++;
                    } else {
                        // input_fields[f].style.borderColor  = 'green';
                        input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 0;
                        input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "hidden";

                        input_fields[f].style.borderColor = "#003c71";
                        input_fields[f].style.backgroundColor = "#fff";
                    }
                } else {
                    // input_fields[f].style.borderColor  = 'green';
                    input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 0;
                    input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "hidden";

                    input_fields[f].style.borderColor = "#003c71";
                    input_fields[f].style.backgroundColor = "#fff";
                }
            }

            var response = grecaptcha.getResponse();

            if (response.length == 0) {
                document.querySelector("#reCaptcha ~ .text-notification").innerHTML = window.api_settings.translations["'This field is required'"];
                document.querySelector("#reCaptcha ~ .text-notification").style.opacity = 1;
                document.querySelector("#reCaptcha ~ .text-notification").style.visibility = "visible";
                document.querySelector("#reCaptcha ~ .text-notification").style.color = "tomato";
                empty_fields++;
            } else {
                document.querySelector("#reCaptcha ~ .text-notification").innerHTML = "";
            }

            if (empty_fields == 0) {
                var vac_name = document.getElementById("vac_name").value;
                var vac_last = document.getElementById("vac_last").value;
                var vac_email = document.getElementById("vac_email").value;
                var vac_phone = document.getElementById("vac_phone").value;
                var vac_decsription = document.getElementById("vac_decsription").value;
                var vac_file = document.querySelector("#vac_file");
                var vacancy_name = document.querySelector("#vacancy_name").value;

                console.log(vac_file);

                var VacancyData = new FormData();

                VacancyData.append("vac_name", vac_name);
                VacancyData.append("vac_last", vac_last);
                VacancyData.append("vac_email", vac_email);
                VacancyData.append("vac_phone", vac_phone);
                VacancyData.append("vac_decsription", vac_decsription);
                VacancyData.append("vac_file", vac_file.files[0]);
                VacancyData.append("vacancy_name", vacancy_name);

                axios
                    .post(window.api_settings.ajax_url + "?action=saveVacancyForm", VacancyData, {
                        headers: {
                            "Content-Type": "multipart/form-data"
                        }
                    })
                    .then(function(response) {
                        alert("Form Sent success");

                        for (var f = 0; f < input_fields.length; f++) {
                            input_fields[f].value = null;
                        }
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            }
        });
    }
}

/**
 * Function for sent information about new feedback request
 */
function sentFeedbackForm() {
    if (document.getElementById("contacts_form")) {
        document.getElementById("contacts_form").addEventListener("submit", function(event) {
            event.preventDefault();

            var notifications = {
                empty: window.api_settings.translations["Fill field"],
                mail: window.api_settings.translations["Please enter the correct e-mail address"],
                phone: window.api_settings.translations["Please enter the correct number"],
                error: window.api_settings.translations["Check that the information you entered is correct"]
            };

            var input_fields = document.getElementsByClassName("input_field_contacts");

            var empty_fields = 0;

            for (var f = 0; f < input_fields.length; f++) {
                if (input_fields[f].classList.contains("required")) {
                    if (input_fields[f].value == "") {
                        input_fields[f].style.borderColor = "tomato";
                        input_fields[f].style.backgroundColor = "#fff6f6";
                        input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.empty;
                        input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 1;
                        input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "visible";
                        input_fields[f].parentNode.querySelector(".text-notification").style.color = "tomato";

                        if (input_fields[f].getAttribute("type") == "tel") {
                            input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.phone;
                        }

                        if (input_fields[f].getAttribute("type") == "email") {
                            input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.mail;
                        }

                        empty_fields++;
                    } else {
                        // input_fields[f].style.borderColor  = 'green';
                        input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 0;
                        input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "hidden";

                        input_fields[f].style.borderColor = "#003c71";
                        input_fields[f].style.backgroundColor = "#fff";
                    }
                } else {
                    // input_fields[f].style.borderColor  = 'green';
                    input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 0;
                    input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "hidden";

                    input_fields[f].style.borderColor = "#003c71";
                    input_fields[f].style.backgroundColor = "#fff";
                }
            }

            if (empty_fields == 0) {
                var cont_name = document.getElementById("cont_name").value;
                var cont_phone = document.getElementById("cont_phone").value;
                var cont_email = document.getElementById("cont_email").value;
                var cont_theme = document.getElementById("cont_theme").value;
                var cont_message = document.getElementById("cont_message").value;

                var FeedbackData = new FormData();

                FeedbackData.append("cont_name", cont_name);
                FeedbackData.append("cont_phone", cont_phone);
                FeedbackData.append("cont_email", cont_email);
                FeedbackData.append("cont_theme", cont_theme);
                FeedbackData.append("cont_message", cont_message);
                FeedbackData.append("action", "saveFeedbackForm");

                axios
                    .post(window.api_settings.ajax_url, FeedbackData, {
                        headers: {
                            "Content-Type": "multipart/form-data"
                        }
                    })
                    .then(function(response) {
                        alert("Form Sent success");

                        for (var f = 0; f < input_fields.length; f++) {
                            input_fields[f].value = null;
                        }
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            } else {
                for (var f = 0; f < input_fields.length; f++) {
                    if (input_fields[f].classList.contains("required")) {
                        if (input_fields[f].value == "") {
                            input_fields[f].style.borderColor = "tomato";
                            input_fields[f].style.backgroundColor = "#fff6f6";
                            input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.empty;
                            input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 1;
                            input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "visible";
                            input_fields[f].parentNode.querySelector(".text-notification").style.color = "tomato";

                            if (input_fields[f].getAttribute("type") == "tel") {
                                input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.phone;
                            }

                            if (input_fields[f].getAttribute("type") == "email") {
                                input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.mail;
                            }

                            empty_fields++;
                        } else {
                            // input_fields[f].style.borderColor  = 'green';
                            input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 0;
                            input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "hidden";

                            input_fields[f].style.borderColor = "#003c71";
                            input_fields[f].style.backgroundColor = "#fff";
                        }
                    } else {
                        // input_fields[f].style.borderColor  = 'green';
                        input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 0;
                        input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "hidden";

                        input_fields[f].style.borderColor = "#003c71";
                        input_fields[f].style.backgroundColor = "#fff";
                    }
                }
            }
        });
    }
}

/**
 * Function for get list of posts of current page and build pagination
 */
function createPagination() {
    var current_page = 0;
    var active_page = 1;

    var total_a = document.querySelectorAll(".pagination-item a");
    let params = new URLSearchParams(document.location.search.substring(1));
    var pages = params.get("pages");
    var sortFieldHead = params.get("order");
    var filterFieldHead = params.get("filter");
    var page_total;

    if (pages != null) {
        var elements = document.querySelectorAll(".pagination_numbers");
        active_page = pages;
        current_page = pages;
    } else {
        var elements = document.querySelectorAll(".pagination-item:nth-child(2)");

        for (var i = 0; i < elements.length; i++) {
            elements[i].classList.add("active");
        }
    }

    var pagination_links = document.getElementsByClassName("paginator");

    for (var i = 0; i < pagination_links.length; i++) {
        pagination_links[i].addEventListener("click", function(event) {
            event.preventDefault();

            var elements_two = document.getElementsByClassName("paginator");
            page_total = this.getAttribute("data-total");
            var count_items = this.parentNode.parentNode.parentNode.getAttribute("data-count");

            if (document.getElementById("industry_select")) {
                var filtered_field = document.getElementById("industry_select").value;
            }

            if (document.getElementById("industry_select_partners")) {
                var industry_select_partners = document.getElementById("industry_select_partners").value;
            }

            if (document.getElementById("sort_select")) {
                var sort_field = document.getElementById("sort_select").value;
            }

            for (var i = 0; i < elements_two.length; i++) {
                elements_two[i].classList.remove("active");
            }

            current_page = $(this).data("page");
            active_page = current_page + 1;

            var AjaxData = new FormData();
            AjaxData.append("action", "get_pagination_posts");
            AjaxData.append("pageid", current_page);
            AjaxData.append("page_total", page_total);
            AjaxData.append("count_items", count_items);

            if (history && history.pushState) {
                //Only do this if history.pushState is supported by the browser
                var obj = { Title: "test", Url: "tester" };
                window.history.pushState(obj, event.target.innerHTML, location.origin + location.pathname + "?pages=" + current_page);
                // window.history.pushState(obj, event.target.innerHTML, "?pages=" + current_page)
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "news") {
                AjaxData.append("post_type", "news");
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "success_historys") {
                AjaxData.append("post_type", "stories");
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "vacancies") {
                AjaxData.append("post_type", "vacancies");
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "speeches") {
                AjaxData.append("post_type", "speeches");
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "publication") {
                AjaxData.append("post_type", "publication");
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "expert_materials") {
                AjaxData.append("post_type", "expert_materials");
            }

            if(this.parentNode.parentNode.parentNode.getAttribute("data-type") == "investment_successes"){
                AjaxData.append("post_type", "investment_successes");
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "company") {
                if (this.parentNode.parentNode.parentNode.getAttribute("data-compnie") != "null") {
                    let company_name = params.get("company_name");
                    let company_id = params.get("company_id");

                    if (history && history.pushState) {
                        //Only do this if history.pushState is supported by the browser
                        var obj = { Title: "test", Url: "tester" };
                        window.history.replaceState(
                            obj,
                            event.target.innerHTML,
                            location.origin + location.pathname + "?pages=" + current_page + "&company_name=" + company_name + "&company_id=" + company_id
                        );
                    }

                    var comapnie_id = this.parentNode.parentNode.parentNode.getAttribute("data-compnie");
                    AjaxData.append("companie_id", comapnie_id);
                }

                AjaxData.append("post_type", "company");
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "companies") {
                if (history && history.pushState) {
                    //Only do this if history.pushState is supported by the browser
                    var obj = { Title: "test", Url: "tester" };

                    window.history.replaceState(
                        obj,
                        event.target.innerHTML,
                        location.origin + location.pathname + "?pages=" + current_page + "&order=" + sort_field + "&filter=" + filtered_field
                    );
                }

                var sort_field = document.getElementById("sort_select").value;

                AjaxData.append("post_type", "companies");
                AjaxData.append("order", sort_field);
                AjaxData.append("filtered_field", filtered_field);
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "partners") {
                var sort_field = document.getElementById("sort_select_partners").value;

                AjaxData.append("order", sort_field);
                AjaxData.append("post_type", "partners");

                if (history && history.pushState) {
                    //Only do this if history.pushState is supported by the browser
                    var obj = { Title: "test", Url: "tester" };
                    window.history.replaceState(
                        obj,
                        event.target.innerHTML,
                        location.origin + location.pathname + "?pages=" + current_page + "&order=" + sort_field
                    );
                }
            }

            if (this.parentNode.parentNode.parentNode.getAttribute("data-type") == "promotions") {

                var industry_select_discount = document.getElementById("industry_select_discount").value;

                if (history && history.pushState) {
                    //Only do this if history.pushState is supported by the browser
                    var obj = { Title: "test", Url: "tester" };

                    window.history.replaceState(
                        obj,
                        event.target.innerHTML,
                        location.origin + location.pathname + "?pages=" + current_page + "&industry=" + industry_select_discount
                    );
                }

                AjaxData.append("filtered_field", industry_select_discount);
                AjaxData.append("post_type", "promotions");
            }

            if(this.parentNode.parentNode.parentNode.getAttribute("data-type") == "events"){
                AjaxData.append("post_type", "events");
                AjaxData.append("event_types",this.parentNode.parentNode.parentNode.parentNode.getAttribute("data-event-type"));

                var event_type = params.get("event_type");

                if(event_type == 'past'){
                    AjaxData.append("event_filter", "past");
                }
                else{
                    AjaxData.append("event_filter", "upcoming");
                }
            }

            axios
                .post(window.api_settings.ajax_url, AjaxData)
                .then(function(response) {
                    console.log(response);
                    console.log(response.data);
                    var content = "";
                    var filterResponse;

                    if (document.getElementById("industry_select")) {
                        var filtered_field = document.getElementById("industry_select").value;
                    }

                    if (response.data.companies) {
                        for (var i = 0; i < response.data.companies.length; i++) {
                            content +=
                                '<div class="column col-3 col-sm-6">\
                            <a href="' +
                                response.data.companies[i].link +
                                '" class="imagein-block-with-text">\
                                <img src="' +
                                response.data.companies[i].logo +
                                '" alt="' +
                                response.data.companies[i].post_title +
                                '">\
                                <span class="h3">' +
                                response.data.companies[i].post_title +
                                "</span>\
                            </a>\
                            </div>";
                        }

                        document.getElementById("companies_list").innerHTML = content;

                        setTimeout(() => {
                            window.scrollTo({ top: 500, left: 0, behavior: "smooth" });
                        }, 500);

                        buildPaginationRepeater();
                    }

                    if (response.data.partners) {
                        for (var i = 0; i < response.data.partners.length; i++) {
                            content +=
                                '<div class="column col-3 col-sm-6">\
                            <a href="' +
                                response.data.partners[i].link +
                                '" class="imagein-block-with-text">\
                                <img src="' +
                                response.data.partners[i].logo +
                                '" alt="bwt">\
                                <span class="h3">' +
                                response.data.partners[i].post_title +
                                "</span>\
                            </a>\
                            </div>";
                        }

                        console.log(document.getElementById("partners_list"));

                        document.getElementById("partners_list").innerHTML = content;

                        setTimeout(() => {
                            window.scrollTo({ top: 500, left: 0, behavior: "smooth" });
                        }, 500);

                        buildPaginationRepeater();
                    }

                    if (!response.data.companies && !response.data.partners) {
                        console.log(response);
                        console.log(response.data);
                        document.getElementById("news_body").innerHTML = response.data.output;

                        setTimeout(() => {
                            window.scrollTo({ top: 500, left: 0, behavior: "smooth" });
                        }, 500);

                        buildPaginationRepeater();
                    }
                })
                .catch(function(error) {
                    console.log(error);
                });
        });
    }

    var pagination_arrow_links = document.getElementsByClassName("pagination-item-arrow");

    for (var i = 0; i < pagination_arrow_links.length; i++) {
        pagination_arrow_links[i].addEventListener("click", function(event) {
            event.preventDefault();
            page_total = this.getAttribute("data-total");
            var count_items = this.parentNode.parentNode.getAttribute("data-count");
            if (document.getElementById("industry_select")) {
                var filtered_field = document.getElementById("industry_select").value;
            }

            if (document.getElementById("sort_select")) {
                var sort_field = document.getElementById("sort_select").value;
            }

            if (this.classList.contains("pagination-item-prev")) {
                if (current_page > 0) {
                    current_page = current_page - 1;

                    let params = new URLSearchParams(document.location.search.substring(1));
                    let pages = params.get("pages");

                    if (!pages) {
                        active_page = active_page - 1;
                    } else {
                        active_page = pages;
                    }

                    var elements_two = document.getElementsByClassName("pagination-item");

                    for (var i = 0; i < elements_two.length; i++) {
                        elements_two[i].classList.remove("active");
                    }

                    var AjaxData = new FormData();
                    AjaxData.append("action", "get_pagination_posts");
                    AjaxData.append("pageid", current_page);
                    AjaxData.append("page_total", page_total);
                    AjaxData.append("count_items", count_items);

                    if (history && history.pushState) {
                        //Only do this if history.pushState is supported by the browser
                        var obj = { Title: "test", Url: "tester" };
                        window.history.pushState(obj, event.target.innerHTML, location.origin + location.pathname + "?pages=" + current_page);
                        // window.history.pushState(obj, event.target.innerHTML, "?pages=" + current_page)
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "news") {
                        AjaxData.append("post_type", "news");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "success_historys") {
                        AjaxData.append("post_type", "stories");

                        if (history && history.pushState) {
                            //Only do this if history.pushState is supported by the browser
                            var obj = { Title: "test", Url: "tester" };
                            window.history.pushState(obj, event.target.innerHTML, location.origin + location.pathname + "?pages=" + current_page);
                            // window.history.pushState(obj, event.target.innerHTML, "?pages=" + current_page)
                        }
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "speeches") {
                        AjaxData.append("post_type", "speeches");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "vacancies") {
                        AjaxData.append("post_type", "vacancies");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "publication") {
                        AjaxData.append("post_type", "publication");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "expert_materials") {
                        AjaxData.append("post_type", "expert_materials");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "company") {
                        if (this.parentNode.parentNode.getAttribute("data-compnie") != "null") {
                            var comapnie_id = this.parentNode.parentNode.getAttribute("data-compnie");
                            AjaxData.append("companie_id", comapnie_id);

                            let company_name = params.get("company_name");
                            let company_id = params.get("company_id");

                            if (history && history.pushState) {
                                //Only do this if history.pushState is supported by the browser
                                var obj = { Title: "test", Url: "tester" };
                                window.history.replaceState(
                                    obj,
                                    event.target.innerHTML,
                                    location.origin +
                                        location.pathname +
                                        "?pages=" +
                                        current_page +
                                        "&company_name=" +
                                        company_name +
                                        "&company_id=" +
                                        company_id
                                );
                            }
                        }

                        AjaxData.append("post_type", "company");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "companies") {
                        if (history && history.pushState) {
                            //Only do this if history.pushState is supported by the browser
                            var obj = { Title: "test", Url: "tester" };
                            window.history.replaceState(
                                obj,
                                event.target.innerHTML,
                                location.origin + location.pathname + "?pages=" + current_page + "&order=" + sort_field + "&filter=" + filtered_field
                            );
                        }

                        AjaxData.append("post_type", "companies");
                        AjaxData.append("order", sort_field);
                        AjaxData.append("filtered_field", filtered_field);
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "partners") {
                        AjaxData.append("order", sort_field);
                        AjaxData.append("post_type", "partners");

                        if (history && history.pushState) {
                            //Only do this if history.pushState is supported by the browser
                            var obj = { Title: "test", Url: "tester" };
                            window.history.replaceState(
                                obj,
                                event.target.innerHTML,
                                location.origin + location.pathname + "?pages=" + current_page + "&order=" + sort_field
                            );
                        }
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "promotions") {

                        var industry_select_discount = document.getElementById("industry_select_discount").value;
        
                        if (history && history.pushState) {
                            //Only do this if history.pushState is supported by the browser
                            var obj = { Title: "test", Url: "tester" };
        
                            window.history.replaceState(
                                obj,
                                event.target.innerHTML,
                                location.origin + location.pathname + "?pages=" + current_page + "&industry=" + industry_select_discount
                            );
                        }
        
                        AjaxData.append("filtered_field", industry_select_discount);
                        AjaxData.append("post_type", "promotions");
                    }

                    if(this.parentNode.parentNode.getAttribute("data-type") == "events"){
                        AjaxData.append("post_type", "events");
                        AjaxData.append("event_types",this.parentNode.parentNode.parentNode.getAttribute("data-event-type"));
        
                        var event_type = params.get("event_type");
        
                        if(event_type == 'past'){
                            AjaxData.append("event_filter", "past");
                        }
                        else{
                            AjaxData.append("event_filter", "upcoming");
                        }
                    }

                    if(this.parentNode.parentNode.getAttribute("data-type") == "investment_successes"){
                        AjaxData.append("post_type", "investment_successes");
                    }

                    axios
                        .post(window.api_settings.ajax_url, AjaxData)
                        .then(function(response) {
                            console.log(response);
                            console.log(response.data);
                            var content = "";
                            var filterResponse;

                            if (response.data.companies) {
                                for (var i = 0; i < response.data.companies.length; i++) {
                                    content +=
                                        '<div class="column col-3 col-sm-6">\
                                <a href="' +
                                        response.data.companies[i].link +
                                        '" class="imagein-block-with-text">\
                                    <img src="' +
                                        response.data.companies[i].logo +
                                        '" alt="' +
                                        response.data.companies[i].post_title +
                                        '">\
                                    <span class="h3">' +
                                        response.data.companies[i].post_title +
                                        "</span>\
                                </a>\
                                </div>";
                                }

                                document.getElementById("companies_list").innerHTML = content;

                                setTimeout(() => {
                                    window.scrollTo({ top: 500, left: 0, behavior: "smooth" });
                                }, 500);

                                buildPaginationRepeater();
                            }

                            if (response.data.partners) {
                                for (var i = 0; i < response.data.partners.length; i++) {
                                    content +=
                                        '<div class="column col-3 col-sm-6">\
                                <a href="' +
                                        response.data.partners[i].link +
                                        '" class="imagein-block-with-text">\
                                    <img src="' +
                                        response.data.partners[i].logo +
                                        '" alt="' +
                                        response.data.partners[i].post_title +
                                        '">\
                                    <span class="h3">' +
                                        response.data.partners[i].post_title +
                                        "</span>\
                                </a>\
                                </div>";
                                }

                                console.log(document.getElementById("partners_list"));

                                document.getElementById("partners_list").innerHTML = content;

                                setTimeout(() => {
                                    window.scrollTo({ top: 500, left: 0, behavior: "smooth" });
                                }, 500);

                                buildPaginationRepeater();
                            }

                            if (!response.data.companies && !response.data.partners) {
                                console.log(response);
                                console.log(response.data);
                                document.getElementById("news_body").innerHTML = response.data.output;
                                var paginationBody = document.getElementById("pagination_body");

                                setTimeout(() => {
                                    window.scrollTo({ top: 500, left: 0, behavior: "smooth" });
                                }, 500);

                                buildPaginationRepeater();
                            }
                        })
                        .catch(function(error) {
                            console.log(error);
                        });
                }
            }

            if (this.classList.contains("pagination-item-next")) {
                if (current_page < page_total - 1) {
                    current_page = parseInt(current_page) + 1;
                    active_page = parseInt(current_page) + 1;

                    let params = new URLSearchParams(document.location.search.substring(1));
                    let pages = params.get("pages");

                    if (document.getElementById("industry_select")) {
                        var filtered_field = document.getElementById("industry_select").value;
                    }

                    if (document.getElementById("sort_select")) {
                        var sort_field = document.getElementById("sort_select").value;
                    }

                    var elements_two = document.getElementsByClassName("pagination-item");

                    for (var i = 0; i < elements_two.length; i++) {
                        elements_two[i].classList.remove("active");
                    }

                    var AjaxData = new FormData();
                    AjaxData.append("action", "get_pagination_posts");
                    AjaxData.append("pageid", current_page);
                    AjaxData.append("page_total", page_total);
                    AjaxData.append("count_items", count_items);

                    if (history && history.pushState) {
                        //Only do this if history.pushState is supported by the browser
                        var obj = { Title: "test", Url: "tester" };
                        window.history.pushState(obj, event.target.innerHTML, location.origin + location.pathname + "?pages=" + current_page);
                        // window.history.pushState(obj, event.target.innerHTML, "?pages=" + current_page)
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "news") {
                        AjaxData.append("post_type", "news");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "success_historys") {
                        AjaxData.append("post_type", "stories");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "speeches") {
                        AjaxData.append("post_type", "speeches");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "vacancies") {
                        AjaxData.append("post_type", "vacancies");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "publication") {
                        AjaxData.append("post_type", "publication");
                    }

                    if(this.parentNode.parentNode.getAttribute("data-type") == "events"){
                        AjaxData.append("post_type", "events");
                        AjaxData.append("event_types",this.parentNode.parentNode.parentNode.getAttribute("data-event-type"));
        
                        var event_type = params.get("event_type");
        
                        if(event_type == 'past'){
                            AjaxData.append("event_filter", "past");
                        }
                        else{
                            AjaxData.append("event_filter", "upcoming");
                        }
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "expert_materials") {
                        AjaxData.append("post_type", "expert_materials");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "company") {
                        if (this.parentNode.parentNode.getAttribute("data-compnie") != "null") {
                            var comapnie_id = this.parentNode.parentNode.getAttribute("data-compnie");
                            AjaxData.append("companie_id", comapnie_id);

                            let company_name = params.get("company_name");
                            let company_id = params.get("company_id");

                            if (history && history.pushState) {
                                //Only do this if history.pushState is supported by the browser
                                var obj = { Title: "test", Url: "tester" };
                                window.history.replaceState(
                                    obj,
                                    event.target.innerHTML,
                                    location.origin +
                                        location.pathname +
                                        "?pages=" +
                                        current_page +
                                        "&company_name=" +
                                        company_name +
                                        "&company_id=" +
                                        company_id
                                );
                            }
                        }

                        AjaxData.append("post_type", "company");
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "companies") {
                        if (history && history.pushState) {
                            //Only do this if history.pushState is supported by the browser
                            var obj = { Title: "test", Url: "tester" };
                            window.history.replaceState(
                                obj,
                                event.target.innerHTML,
                                location.origin + location.pathname + "?pages=" + current_page + "&order=" + sort_field + "&filter=" + filtered_field
                            );
                        }

                        AjaxData.append("post_type", "companies");
                        AjaxData.append("order", sort_field);
                        AjaxData.append("filtered_field", filtered_field);
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "partners") {
                        AjaxData.append("order", sort_field);
                        AjaxData.append("post_type", "partners");

                        if (history && history.pushState) {
                            //Only do this if history.pushState is supported by the browser
                            var obj = { Title: "test", Url: "tester" };
                            window.history.replaceState(
                                obj,
                                event.target.innerHTML,
                                location.origin + location.pathname + "?pages=" + current_page + "&order=" + sort_field
                            );
                        }
                    }

                    if (this.parentNode.parentNode.getAttribute("data-type") == "promotions") {

                        var industry_select_discount = document.getElementById("industry_select_discount").value;
        
                        if (history && history.pushState) {
                            //Only do this if history.pushState is supported by the browser
                            var obj = { Title: "test", Url: "tester" };
        
                            window.history.replaceState(
                                obj,
                                event.target.innerHTML,
                                location.origin + location.pathname + "?pages=" + current_page + "&industry=" + industry_select_discount
                            );
                        }
        
                        AjaxData.append("filtered_field", industry_select_discount);
                        AjaxData.append("post_type", "promotions");
                    }

                    if(this.parentNode.parentNode.getAttribute("data-type") == "investment_successes"){
                        AjaxData.append("post_type", "investment_successes");
                    }

                    axios
                        .post(window.api_settings.ajax_url + "?action=ajax_by_order", AjaxData)
                        .then(function(response) {
                            console.log(response);
                            console.log(response.data);
                            var content = "";
                            var filterResponse;

                            if (response.data.companies) {
                                for (var i = 0; i < response.data.companies.length; i++) {
                                    content +=
                                        '<div class="column col-3 col-sm-6">\
                                <a href="' +
                                        response.data.companies[i].link +
                                        '" class="imagein-block-with-text">\
                                    <img src="' +
                                        response.data.companies[i].logo +
                                        '" alt="' +
                                        response.data.companies[i].post_title +
                                        '">\
                                    <span class="h3">' +
                                        response.data.companies[i].post_title +
                                        "</span>\
                                </a>\
                                </div>";
                                }

                                document.getElementById("companies_list").innerHTML = content;

                                setTimeout(() => {
                                    window.scrollTo({ top: 500, left: 0, behavior: "smooth" });
                                }, 500);

                                buildPaginationRepeater();
                            }

                            if (response.data.partners) {
                                for (var i = 0; i < response.data.partners.length; i++) {
                                    content +=
                                        '<div class="column col-3 col-sm-6">\
                                <a href="' +
                                        response.data.partners[i].link +
                                        '" class="imagein-block-with-text">\
                                    <img src="' +
                                        response.data.partners[i].logo +
                                        '" alt="' +
                                        response.data.partners[i].post_title +
                                        '">\
                                    <span class="h3">' +
                                        response.data.partners[i].post_title +
                                        "</span>\
                                </a>\
                                </div>";
                                }

                                console.log(document.getElementById("partners_list"));

                                document.getElementById("partners_list").innerHTML = content;

                                buildPaginationRepeater();
                            }

                            if (!response.data.companies && !response.data.partners) {
                                console.log(response);
                                console.log(response.data);
                                document.getElementById("news_body").innerHTML = response.data.output;

                                var paginationBody = document.getElementById("pagination_body");

                                setTimeout(() => {
                                    window.scrollTo({ top: 500, left: 0, behavior: "smooth" });
                                }, 500);

                                buildPaginationRepeater();
                            }
                        })
                        .catch(function(error) {
                            console.log(error);
                        });
                }
            }
        });
    }
}

/**
 * Function for logout users from site
 */
function logOutUser() {
    if (document.getElementById("logout_user")) {
        document.getElementById("logout_user").addEventListener("click", function(event) {
            event.preventDefault();

            axios
                .get(window.api_settings.ajax_url + "?action=logOutUser")
                .then(function(response) {
                    console.log(response);
                    location.href = "/";
                })
                .catch(function(error) {
                    console.log(error);
                });
        });
    }
}

/**
 * Function for go on previosu page after lcik on back button
 */
function goBack() {
    if (document.getElementById("goBackButton")) {
        document.getElementById("goBackButton").addEventListener("click", function(event) {
            event.preventDefault();

            if (history.length == 2) {
                document.location.href = "/";
            } else {
                history.back();
            }
        });
    }
}

/**
 * Function for registartion user on event
 */
function RegistatrationTicket() {
    if (document.getElementById("registrationEventForm")) {
        document.getElementById("registrationEventForm").addEventListener("submit", function(event) {
            event.preventDefault();

            var input_fields = document.getElementsByClassName("input_field_event");

            var empty_fields = 0;

            for (var f = 0; f < input_fields.length; f++) {
                if (input_fields[f].classList.contains("required")) {
                    if (input_fields[f].value == "") {
                        input_fields[f].parentNode.querySelector(".text-notification").innerHTML = "Fill field";
                        input_fields[f].classList.add("error");

                        notificationOpen("error", window.api_settings.translations["Error"], window.api_settings.translations["You have made"]);

                        empty_fields++;
                    } else {
                        input_fields[f].parentNode.querySelector(".text-notification").innerHTML = "";
                        input_fields[f].classList.remove("error");
                    }
                } else {
                    input_fields[f].classList.remove("error");
                }
            }

            if (empty_fields == 0) {
                var event_uuid = this.getAttribute("data-event-uuid");
                var event_id = this.getAttribute("data-event-id");
                buyTickets(event_uuid, event_id);
            }
        });
    }
}

/**
 * Function for buy tickets
 */
function buyTickets(event_uuid, event_id) {
    var name = document.getElementById("event_name").value;
    var second_name = document.getElementById("event_second_name").value;
    var company = document.getElementById("event_company").value;
    var post = document.getElementById("post_company").value;
    var email = document.getElementById("email_company").value;
    var phone = document.getElementById("phone_company").value;

    var EventData = new FormData();
    EventData.append("action", "registartionOnEvent");
    EventData.append("event_uuid", event_uuid);
    EventData.append("event_id", event_id);

    EventData.append("name", name);
    EventData.append("second_name", second_name);
    EventData.append("company", company);
    EventData.append("post", post);
    EventData.append("email", email);
    EventData.append("phone", phone);

    if (document.getElementById("event_price")) {
        var event_price = document.getElementById("event_price");
        EventData.append("event_price", event_price.value);
        EventData.append("event_type_ticket", event_price.options[event_price.selectedIndex].text);
    }

    if (document.getElementById("quantity")) {
        var quantity = document.getElementById("quantity").value;
        EventData.append("quantity", quantity);
        //test
    }

    axios
        .post(window.api_settings.ajax_url, EventData, {
            headers: {
                "Content-Type": "multipart/form-data"
            }
        })
        .then(function(response) {
            if (response.data.event_type == "pay") {
                console.log(response.data);
                window.location.href = response.data.url;
            } else {
                if (response.data.info != null) {
                    notificationOpen("info", window.api_settings.translations["Info"], response.data.info);
                } else {
                    if (response.data.success != null) {
                        notificationOpen(
                            "success",
                            window.api_settings.translations["Successful registration"],
                            window.api_settings.translations["Event registration"]
                        );
                    } else {
                        if (response.data.error != null) {
                            notificationOpen("error", window.api_settings.translations["Error"], window.api_settings.translations["You were wrong"]);
                        }
                    }
                }
            }
        });
}

/**
 * Function for get list of all events which user register
 */
function getUserEvents() {
    var events_list = document.getElementById("user_events_list");

    axios({
        method: "post",
        url: window.api_settings.ajax_url + "?action=getUserEvents",
        data: {
            // action: 'getCalendarEvents'
        }
    })
        .then(response => {
            var content = "";

            if (response.data.events.length > 0) {
                for (var i = 0; i < response.data.events.length; i++) {
                    var days_left = getEventDayLeft(response.data.events[i].date, document.getElementById("user_events_list"));

                    var archive_class;
                    var append_block;
                    var price;
                    var price_text;

                    if (!response.data.events[i].price) {
                        price = "Free";
                        price_text = "";
                    } else {
                        price = response.data.events[i].price;
                        price_text = "Event ticket price";
                    }

                    if (days_left == "The event happened") {
                        archive_class = " archive-event";
                        append_block = document.getElementById("user_last_events_list");
                    } else {
                        archive_class = "";
                        append_block = document.getElementById("user_events_list");
                    }

                    content =
                        '<div class="column col">\
                        <div class="event-block' +
                        archive_class +
                        '">\
                            <div class="info-row">\
                                <span class="tag primary-bg-color">' +
                        response.data.events[i].tag +
                        '</span>\
                                <span class="secondary-text" id="day_left_event">' +
                        days_left +
                        '</span>\
                            </div>\
                            <h3 class="h5 event-block-title">\
                                <a href="' +
                        response.data.events[i].link +
                        '">\
                                ' +
                        response.data.events[i].post_title +
                        '\
                                </a>\
                            </h3>\
                            <div class="event-block-location">\
                                <svg class="icon">\
                                    <use xlink:href="' +
                        window.api_settings.template +
                        'img/icons/svgmap.svg#location" />\
                                </svg>\
                                <span class="location-text">\
                                ' +
                        response.data.events[i].place +
                        '\
                                </span>\
                            </div>\
                            <div class="event-block-time primary-color">\
                            ' +
                        response.data.events[i].time_intervals +
                        "\
                            </div>\
                            <p>E-mail:  " +
                        response.data.events[i].email +
                        "</p>\
                            <p>Телефон / Phone:    " +
                        response.data.events[i].phone +
                        '</p>\
                            <p>Контроль / Control:</p>\
                            <img src="' +
                        response.data.events[i].qr_link +
                        '"></img>\
                            <div class="event-price">\
                                <span >' +
                        price +
                        '</span>\
                                <span class="secondary-text">' +
                        price_text +
                        "</span>\
                            </div>\
                        </div>\
                    </div>";

                    append_block.innerHTML += content;
                }
            } else {
                append_block = window.api_settings.translations["Your search did not match any"];
            }
        })
        .catch(error => {
            console.log(error);
        });
}

/**
 * Function for get how much time left before event start
 * @parametrs
 * event_date - date of event start for calculation in format (DD-MM-YYYY),
 * event_block - block with item of event, for check - need run this function or not
 */
function getEventDayLeft(event_date, event_block) {
    if (event_block) {
        var now = new Date();

        var currentDay = {
            day: now.getDate(),
            month: now.getMonth() + 1,
            year: now.getFullYear()
        };

        var active = {
            day: moment(event_date).format("DD"),
            month: moment(event_date).format("MM"),
            year: moment(event_date).format("YYYY")
        };

        if (window.api_settings.lang == "en") {
            var before = "Days to go: ";
            var today = "Today";
            var after = "The event happened";
        }

        if (window.api_settings.lang == "ua") {
            var before = "Днів до початку: ";
            var today = "Сьогодні";
            var after = "Подія відбулася";
        }

        var dateMonth = active.month < 10 ? "0" + active.month : active.month;
        var dateDay = active.day < 10 ? "0" + active.day : active.day;

        var thisDate = active.year + "-" + dateMonth + "-" + dateDay;
        var diff = moment(thisDate).diff(moment(new Date()), "day");

        var leftDays = diff > 0 ? before + diff : diff == 0 ? today : after;

        return leftDays;
    }
}

/**
 * Function for hendle approw button
 */
function approvedHandler() {
    var approved_btns = document.getElementsByClassName("approved_btn");

    for (var i = 0; i < approved_btns.length; i++) {
        approved_btns[i].addEventListener("click", function(event) {
            event.preventDefault();

            var user_id = document.getElementById("approved_select").value;
            var approved_comment = document.getElementById("approved_comment").value;
            var approved_type = this.getAttribute("data-type");

            var EventData = new FormData();
            EventData.append("action", "registartionOnEvent");

            EventData.append("user_id", user_id);
            EventData.append("approved_comment", approved_comment);
            EventData.append("approved_type", approved_type);
            EventData.append("action", "approveTicket");

            axios
                .post(window.api_settings.ajax_url, EventData, {
                    headers: {
                        "Content-Type": "multipart/form-data"
                    }
                })
                .then(function(response) {
                    alert(response.data.message);
                    document.location.reload();
                });
        });
    }
}

/**
 * Function for update user profile
 */
function updateProfile() {
    if (document.getElementById("updateProfile")) {
        document.getElementById("updateProfile").addEventListener("submit", function(event) {
            event.preventDefault();

            var input_fields = document.getElementsByClassName("input_field_event");

            var empty_fields = 0;

            for (var f = 0; f < input_fields.length; f++) {
                if (input_fields[f].classList.contains("required")) {
                    if (input_fields[f].value == "") {
                        input_fields[f].style.borderColor = "tomato";

                        empty_fields++;
                    } else {
                        input_fields[f].style.backgroundColor = "#d8f5d8";
                        input_fields[f].style.borderColor = "#d8f5d8";
                    }
                } else {
                    input_fields[f].style.backgroundColor = "#d8f5d8";
                    input_fields[f].style.borderColor = "#d8f5d8";
                }
            }

            if (empty_fields == 0) {
                var name_profile = document.getElementById("name_profile").value;
                var family_profile = document.getElementById("family_profile").value;
                var e_mail_profile = document.getElementById("e_mail_profile").value;
                var phone_profile = document.getElementById("phone_profile").value;
                var date_profile = document.getElementById("date_profile").value;
                var position_profile = document.getElementById("position_profile").value;

                // var ticket_id = this.getAttribute('data-ticket');

                var ProfileData = new FormData();
                ProfileData.append("action", "updateProfile");
                ProfileData.append("Name_profile", name_profile);
                ProfileData.append("Family_profile", family_profile);
                ProfileData.append("E_mail_profile", e_mail_profile);
                ProfileData.append("Phone_profile", phone_profile);
                ProfileData.append("Date_profile", date_profile);
                ProfileData.append("Position_profile", position_profile);

                axios
                    .post(window.api_settings.ajax_url, ProfileData, {
                        headers: {
                            "Content-Type": "multipart/form-data"
                        }
                    })
                    .then(function(response) {
                        if (response.data.success == true) {
                            alert("Profile successfully modified");
                            // location.reload();
                        }
                    });
            } else {
                for (var f = 0; f < input_fields.length; f++) {
                    if (input_fields[f].classList.contains("required")) {
                        if (input_fields[f].value == "") {
                            input_fields[f].style.backgroundColor = "#fff6f6";
                            empty_fields++;
                        } else {
                            input_fields[f].style.borderBottomColor = "#fff6f6";
                        }
                    } else {
                        input_fields[f].style.borderBottomColor = "#fff6f6";
                    }
                }
            }
        });
    }
}

/**
 * Function for get how much time left before event start in single event page
 */
function getSignleEventTimeLeft() {
    if (document.getElementById("single_event_page")) {
        console.log("Event Date");
        console.log(document.getElementById("date_event"));

        var DaysLeft = getEventDayLeft(document.getElementById("date_event").innerHTML, document.getElementById("single_event_page"));
        document.getElementById("day_left_event").innerHTML = DaysLeft;
    }
}

/**
 * Function for count summ of event price in sector with quantity
 */
function getSectorPrice() {
    if (document.getElementById("event_price")) {
        $("#event_price").change(function() {
            if (document.getElementById("quantity")) {
                var quantity = document.getElementById("quantity").value;

                console.log("Quantity:");
                console.log(quantity);
                var current_price = this.value;
                var price_block = document.getElementById("price_sector_place");
                var sinle_event_price = document.getElementById("sinle_event_price");
                price_block.innerHTML = parseInt(current_price) * quantity + " UAH ";
                sinle_event_price.innerHTML = current_price + " UAH ";
            }
        });

        $("#quantity").change(function() {
            if (document.getElementById("quantity")) {
                var current_price = document.getElementById("event_price").value;

                console.log("Curr Price:");
                console.log(current_price);
                var quantity = this.value;
                var price_block = document.getElementById("price_sector_place");
                var sinle_event_price = document.getElementById("sinle_event_price");
                price_block.innerHTML = parseInt(current_price) * quantity + " UAH ";
                sinle_event_price.innerHTML = current_price + " UAH ";
            }
        });
    }
}

/**
 * Function for get how much time left before event start in single event page in left sidebar
 */
function getSidebarEventDate() {
    var events = document.getElementsByClassName("sidebar_event_date");
    if (events) {
        var event_left;
        var event_left_blocks = document.getElementsByClassName("sidebar_event_left");
        for (var i = 0; i < events.length; i++) {
            event_left = getEventDayLeft(events[i].innerHTML, events);
            event_left_blocks[i].innerHTML = event_left;
        }
    }
}


function eventsListFilter(){
    $("#events_list_filter").change(function() {
        var content;
        var page = 0;

        var filtered_field = this.value;
        var eventListResponse = document.getElementById("news_body");
        eventListResponse.innerHTML = "";
        var FilterData = new FormData();
        var taxonomy_id = document.getElementById("news_body").getAttribute("data-taxonomy");


        FilterData.append("filtered_field", filtered_field);
        FilterData.append("action", "eventsListFilter");
        FilterData.append("page_id", page);
        FilterData.append("tax_id",taxonomy_id);
        FilterData.append("count",4);

        axios
            .post(window.api_settings.ajax_url, FilterData, {
                headers: {
                    "Content-Type": "multipart/form-data"
                }
            })
            .then(function(response) {
                content = "";

                if (history && history.pushState) {
                    //Only do this if history.pushState is supported by the browser
                    var obj = { Title: "test", Url: "tester" };

                    window.history.replaceState(
                        obj,
                        event.target.innerHTML,
                        location.origin + location.pathname + "?pages=" + page + "&event_type=" + filtered_field 
                    );
                }

                if (response.data.events.length > 0) {
                    for (var i = 0; i < response.data.events.length; i++) {
                        console.log("cycle");
                        content +=

                        '<div class="column col-6 col-sm">\
                            <div class="event-block">\
                                <div class="info-row">\
                                    <span class="tag primary-bg-color">' + response.data.events[i].tag + '</span>\
                                    <span class="secondary-text sidebar_event_left"></span>\
                                    <span class="sidebar_event_date" style="visibility:hidden">' + response.data.events[i].date + '</span>\
                                </div>\
                                <h3 class="h5 event-block-title">\
                                    <a href="<?= get_permalink($main_event->ID) ?>">\
                                    ' + response.data.events[i].post_title + ' \
                                    </a>\
                                </h3>\
                                <div class="event-block-location">\
                                    <svg class="icon">\
                                        <use xlink:href="' + window.api_settings.template + '/img/icons/svgmap.svg#location" />\
                                    </svg>\
                                    <span class="location-text">\
                                        ' + response.data.events[i].place + '\
                                    </span>\
                                </div>\
                                <div class="event-block-time primary-color">\
                                ' + response.data.events[i].time_intervals + '\
                                </div>\
                            </div>\
                        </div>';
                    }


                    eventListResponse.innerHTML = content;
                    buildPagination(pagination_body_events, "events", window.api_settings.events_displayed_per_page, 0, createPagination);
                    getSidebarEventDate();
                } else {
                    eventListResponse.innerHTML = '<div class="wrap"><h3>' + window.api_settings.translations["Your search did not match any"] + '</h3></div>';
                }
            });
    });
}


/**
 * Function for get list of events some committee, work group or club
 * @parametrs
 * item_type - type of sutom post type(direction,work_group,club)
 */
function getItemEvents(item_type) {
    if (document.getElementById("single_item")) {
        var direction_id = document.getElementById("single_item").getAttribute("date-eventid");

        var EventData = new FormData();

        EventData.append("item_type", item_type);
        EventData.append("page_id", direction_id);
        EventData.append("action", "getItemEvents");

        axios
            .post(window.api_settings.ajax_url, EventData, {
                headers: {
                    "Content-Type": "multipart/form-data"
                }
            })
            .then(function(response) {
                console.log("Reponse:");
                console.log(response.data.events);

                var events_list = response.data.events;
                var current_counter = 0;
                var last_counter = 0;

                for (var i = 0; i < events_list.length; i++) {
                    var event_left = getEventDayLeft(events_list[i].date, document.getElementById("item_events"));
                    var archive_class;
                    var append_block;
                    var content;
                    events_list[i].left = event_left;

                    if (event_left == "The event happened") {
                        archive_class = " archive-event";
                        last_counter++;
                        append_block = document.getElementById("last_item_events");
                    } else {
                        archive_class = "";
                        current_counter++;
                        append_block = document.getElementById("item_events");
                    }

                    content =
                        '<div class="column col-6">\
                        <div class="event-block' +
                        archive_class +
                        '">\
                        <div class="info-row">\
                            <span class="tag primary-bg-color">' +
                        events_list[i].tag +
                        '</span>\
                            <span class="secondary-text">' +
                        event_left +
                        '</span>\
                        </div>\
                        <h3 class="h5 event-block-title">\
                            <a href="' + events_list[i].link + '">\
                                ' + 
                        events_list[i].post_title +
                        '\
                            </a>\
                        </h3>\
                        <div class="event-block-location">\
                            <svg class="icon">\
                                <use xlink:href="' +
                        window.api_settings.template +
                        'img/icons/svgmap.svg#location" />\
                            </svg>\
                            <span class="location-text">\
                                ' +
                        events_list[i].place +
                        '\
                            </span>\
                        </div>\
                        <div class="event-block-time primary-color">\
                            ' +
                        events_list[i].time_intervals +
                        "\
                        </div>\
                        </div>\
                    </div>";

                    append_block.innerHTML += content;
                }

                if (current_counter == 0) {
                    document.getElementById("current_item_events_section").style.display = "none";
                }

                if (last_counter == 0) {
                    document.getElementById("last_item_events_section").style.display = "none";
                }
            });
    }
}

/**
 * Function for save suer subscribes
 */
function UpdateProfileSubscribe() {
    if (document.getElementById("subscribes_save")) {
        var user_subscribes = document.querySelectorAll("#subscribes_save .subscribe_checkbox");
        var subscribe_list = [];

        document.getElementById("subscribes_save").addEventListener("submit", function(event) {
            event.preventDefault();

            subscribe_list = [];
            user_subscribes.forEach(subscribe_check => {
                if (subscribe_check.checked == true) {
                    subscribe_list.push(subscribe_check.value);
                }
            });

            var SubscribeData = new FormData();
            SubscribeData.append("subscribes", subscribe_list);
            SubscribeData.append("action", "updateUserSubscribe");

            axios
                .post(window.api_settings.ajax_url, SubscribeData, {
                    headers: {
                        "Content-Type": "multipart/form-data"
                    }
                })
                .then(function(response) {
                    if (response.data.success == true) {
                        alert("Subscribes successfully modified");
                    }
                });
        });
    }
}

/**
 * Function for open notification
 * @parametrs
 * type - type of notification(erorrs,info,success),
 * name - title of notification,
 * message - message of notification,
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

    notification.querySelector(".btn-close").addEventListener("click", response => {
        notificationClose();
    });
}

/**
 * Function for close notification
 */
function notificationClose() {
    var notification = document.getElementById("notification");
    notification.classList.remove("open-notification");
    notification.classList.remove("info");
    notification.classList.remove("success");
    notification.classList.remove("error");

    notification.querySelector(".notification-title").innerHTML = "";
    notification.querySelector(".notification-content").innerHTML = "";
}

/**
 * Function for get manager team after lcik on "View command" button
*/
function getManagerTeam(){
    if (document.querySelectorAll(".open-team-modal")) {
        document.querySelectorAll(".open-team-modal").forEach(function(thisItem) {
            thisItem.addEventListener("click", function(e) {
                e.preventDefault();

                var companiesWrap = document.getElementById("modal_team_body");
                var manager_data = document.getElementById("modal_team_main_manager");
                companiesWrap.innerHTML = "";
                manager_data.innerHTML = "";
                var manager_content = "";
                var content = "";

                var manager_id = this.getAttribute("data-manager");
                var page_id = this.getAttribute("data-page");

                var ManagaerData = new FormData();

                ManagaerData.append("manager_id", manager_id);
                ManagaerData.append("action", "getManagerData");
                ManagaerData.append("page_id", page_id);

                axios
                    .post(window.api_settings.ajax_url, ManagaerData, {
                        headers: {
                            "Content-Type": "multipart/form-data"
                        }
                    })
                    .then(function(response) {
                        var main_manager = response.data.manager;
                        manager_content +=
                            ' <div class="row">\
                            <div class="col-6">\
                                <div class="person-card person-card-xs">\
                                    <div class="person-image">\
                                        <img src="' +
                            main_manager.logo +
                            '" alt="" class="cover">\
                                    </div>\
                                    <div class="person-col">\
                                        <h4 class="h6 primary-color person-title">\
                                            ' +
                            main_manager.post_title +
                            '</h4>\
                                        <div class="person-subrow">\
                                            <span class="secondary-text">' +
                            main_manager.position +
                            "</span>\
                                        </div>\
                                    </div>\
                                </div>\
                            </div>\
                        </div>";
                        manager_data.innerHTML = manager_content;

                        for (var i = 0; i < response.data.manager_team.length; i++) {
                            content +=
                                '<div class="column col-6">\
                            <div class="person-card person-card-sm">\
                                <div class="person-image">\
                                    <img src="' +
                                response.data.manager_team[i].manager_logo +
                                '" alt="" class="cover">\
                                </div>\
                                <div class="person-col">\
                                    <h4 class="h5 primary-color person-title">' +
                                response.data.manager_team[i].post_title +
                                '</h4>\
                                    <div class="person-subrow">\
                                        <span class="secondary-text">' +
                                response.data.manager_team[i].manager_position +
                                '</span>\
                                    </div>\
                                    <div class="person-contacts">\
                                        <a href="mailto:' +
                                response.data.manager_team[i].manager_email +
                                '">' +
                                response.data.manager_team[i].manager_email +
                                '</a>\
                                    </div>\
                                    <div class="person-socials">';
                                
                                if(response.data.manager_team[i].manager_facebook != null && response.data.manager_team[i].manager_facebook != ""){
                                    content += '<a href="' +
                                    response.data.manager_team[i].manager_facebook +
                                    '" target="_blank">\
                                                <svg class="icon">\
                                                    <use xlink:href="' +
                                    window.api_settings.template +
                                    'img/icons/svgmap.svg#facebook"></use>\
                                                </svg>\
                                            </a>';
                                }

                                if(response.data.manager_team[i].manager_twitter != null && response.data.manager_team[i].manager_twitter != ""){
                                    content += '<a href="' +
                                    response.data.manager_team[i].manager_twitter +
                                    '" target="_blank">\
                                                <svg class="icon">\
                                                    <use xlink:href="' +
                                    window.api_settings.template +
                                    'img/icons/svgmap.svg#twitter"></use>\
                                                </svg>\
                                            </a>';
                                }

                                if(response.data.manager_team[i].manager_linkedin != null && response.data.manager_team[i].manager_linkedin != "" ){
                                    content += '<a href="' +
                                    response.data.manager_team[i].manager_linkedin +
                                    '" target="_blank">\
                                                <svg class="icon">\
                                                    <use xlink:href="' +
                                    window.api_settings.template +
                                    'img/icons/svgmap.svg#linkedin"></use>\
                                                </svg>\
                                            </a>';
                                }
                        
                                content += '</div>\
                                        </div>\
                                    </div>\
                                </div>';
                        }
                        companiesWrap.innerHTML = content;
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            });
        });
    }
}


/**
 * Function for scroll to registration form after click on button "Register on event" in Event Signgle Page
*/
function scrollToRegistrationButton(){
    var registarationOnEventButton = document.getElementById("registarationOnEventButton");
    var registrationEventForm = document.getElementById("registrationEventForm");

    if (registrationEventForm) {
        var registrationEventFormTop = registrationEventForm.getBoundingClientRect().top + window.pageYOffset - 100;
    }

    if (document.getElementById("registarationOnEventButton")) {
        document.getElementById("registarationOnEventButton").addEventListener("click", function(event) {
            event.preventDefault();
            window.scrollTo({ top: registrationEventFormTop, left: 0, behavior: "smooth" });
        });
    }
}


/**
 * Function for get all event list of committee or work group or club
*/
function getEventsListOfCommitteeGroupClub(){
    if(document.getElementById('single_item')){
        if(document.getElementById('single_item').getAttribute('date-eventtype') == 'directions' ){
            getItemEvents("directions");
        }
        
        if(document.getElementById('single_item').getAttribute('date-eventtype') == 'work_group' ){
            getItemEvents("work_groups");
        }
        
        if(document.getElementById('single_item').getAttribute('date-eventtype') == 'club' ){
            getItemEvents("clubs");
        }
    }
}


/**
 * Function for get information for build pagination pages and build pagination
 * @parametrs
 * paginationBody - block for append pagination links,
 * pagination_type - type of custom post,
 * count_items - how much elements show per page,
 * active - which elelment need set active,
 * callback - callback function after creating of pagination,
 */
function buildPagination(paginationBody, pagination_type, count_items, active, callback) {
    var pagination_type = pagination_type;
    var count_items = count_items;
    var paginationBody = paginationBody;
    var content = "";
    var BuildPaginationData = new FormData();
    BuildPaginationData.append("type", pagination_type);
    
    BuildPaginationData.append("action", "getBuildPaginationData");
    let params = new URLSearchParams(document.location.search.substring(1));

    if(pagination_type == 'events'){
        var event_type = paginationBody.getAttribute("data-event-type");
        BuildPaginationData.append("event_type", event_type);

        var event_filter = params.get("event_type");

        if(event_filter == 'past'){
            BuildPaginationData.append("event_filter", "past");
        }
        else{
            BuildPaginationData.append("event_filter", "upcoming");
        }
    }


    if (params.get("company_id")) {
        BuildPaginationData.append("companie_id", params.get("company_id"));

        console.log("Single company:");
        console.log(window.api_settings.single_company_news_displayed_per_page);

        count_items = window.api_settings.single_company_news_displayed_per_page;
    }
    else{
        BuildPaginationData.append("count", count_items);
    }

    if (params.get("order")) {
        BuildPaginationData.append("order", params.get("order"));
    }

    if (params.get("industry")) {
        BuildPaginationData.append("filter", params.get("industry"));
    }

    if (params.get("filter")) {
        BuildPaginationData.append("filter", params.get("filter"));
    }

    if (params.get("pages")) {
        BuildPaginationData.append("page", params.get("pages"));
    }

    axios
        .post(window.api_settings.ajax_url, BuildPaginationData, {
            headers: {
                "Content-Type": "multipart/form-data"
            }
        })
        .then(function(response) {
            var i = 0;
            var end = 0;

            let active_page = params.get("pages");

            if (active_page) {
                active = parseInt(active_page);
            }

            console.log("Response Count");
            console.log(response.data.Pages_count);

            if (response.data.Pages_count > 1) {
                content +=
                    '<div class="pagination pagination_news" data-type="' +
                    pagination_type +
                    '" data-count="' +
                    count_items +
                    '" data-compnie="' +
                    params.get("company_id") +
                    '" >\
            <ul class="pagination-list">\
                <li data-total="' +
                    response.data.Pages_count +
                    '" id="prev_arrow_pagination" class="pagination-item pagination-item-arrow pagination-item-prev">\
                    <a href="' +
                    response.data.Prev +
                    '">\
                        <svg class="icon">\
                            <use xlink:href="' +
                    window.api_settings.template +
                    'img/icons/svgmap.svg#left" />\
                        </svg>\
                    </a>\
            </li>';

                if (active > 1 && response.data.Pages_count > 6) {
                    content +=
                        '<li class="pagination-item pagination_numbers">\
                    <a data-total="' +
                        response.data.Pages_count +
                        '" data-page="0" class="paginator">1</a>\
                </li>';

                    content += '<li class="pagination-item">\
                    <a>...</a>\
                </li>';
                }

                if (response.data.Pages_count < 6) {
                    i = 0;
                    end = 5;
                } else {
                    if (active > 1) {
                        i = active - 1;
                        end = active + 2;
                    } else {
                        i = 0;
                        end = 3;
                    }
                }

                if (end > response.data.Pages_count) {
                    end = response.data.Pages_count;
                }

                console.log("Counter");
                console.log(active);

                for (var i; i < end; i++) {
                    var counter = i + 1;

                    content +=
                        '<li class="pagination-item pagination_numbers">\
                        <a data-total="' +
                        response.data.Pages_count +
                        '" data-page="' +
                        i +
                        '" class="paginator">' +
                        counter +
                        "</a>\
                    </li>";
                }

                if (end < response.data.Pages_count && response.data.Pages_count > 6) {
                    content += '<li class="pagination-item">\
                    <a>...</a>\
                </li>';

                    content +=
                        '<li class="pagination-item pagination_numbers">\
                        <a data-total="' +
                        response.data.Pages_count +
                        '" data-page="' +
                        (response.data.Pages_count - 1) +
                        '" class="paginator">' +
                        response.data.Pages_count +
                        "</a>\
                    </li>";
                }

                content +=
                    '<li data-total="' +
                    response.data.Pages_count +
                    '" id="next_arrow_pagination" class="pagination-item pagination-item-arrow pagination-item-next">\
                    <a href="' +
                    response.data.Next +
                    '">\
                        <svg class="icon">\
                            <use xlink:href="' +
                    window.api_settings.template +
                    'img/icons/svgmap.svg#right" />\
                        </svg>\
                    </a>\
                </li>\
            </ul>\
            </div>';

                paginationBody.innerHTML = content;
                var elements_two = document.getElementsByClassName("paginator");

                for (var i = 0; i < elements_two.length; i++) {
                    elements_two[i].classList.remove("active");
                }

                for (var i = 0; i < elements_two.length; i++) {
                    if (parseInt(elements_two[i].innerHTML) == parseInt(active) + 1) {
                        console.log("Clicked element -->");
                        console.log(elements_two[i]);

                        elements_two[i].parentNode.classList.add("active");
                    }
                }

                if (active_page != null) {
                    if (parseInt(active_page) == 0) {
                        if (document.getElementById("prev_arrow_pagination")) {
                            document.getElementById("prev_arrow_pagination").classList.add("disable");
                        }
                    } else {
                        if (document.getElementById("prev_arrow_pagination")) {
                            document.getElementById("prev_arrow_pagination").classList.remove("disable");
                        }
                    }
                } else {
                    if (document.getElementById("prev_arrow_pagination")) {
                        document.getElementById("prev_arrow_pagination").classList.add("disable");
                    }
                }

                if (parseInt(active_page) == response.data.Pages_count - 1) {
                    if (document.getElementById("next_arrow_pagination")) {
                        document.getElementById("next_arrow_pagination").classList.add("disable");
                    }
                } else {
                    if (document.getElementById("next_arrow_pagination")) {
                        document.getElementById("next_arrow_pagination").classList.remove("disable");
                    }
                }
            } else {
                paginationBody.innerHTML = "";
            }

            callback();
        });
}
