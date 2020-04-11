/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/js/report.js":
/*!**************************!*\
  !*** ./src/js/report.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

document.addEventListener("DOMContentLoaded", function () {
  addSlider();
  var charts = document.querySelectorAll(".cart-section");

  if (charts.length) {
    charts.forEach(function (el) {
      var id = "#" + el.getAttribute("id");
      var dataChart = window[el.getAttribute("data-chart")];
      addChart(id, dataChart);
    });
  }

  if (window.innerWidth <= 1200 && document.getElementById('body-wrap').classList.contains('report-body-wrap')) {
    document.getElementById('btn-menu').addEventListener('click', function () {
      this.classList.toggle('open-menu');
      document.getElementById('header').classList.toggle('open-menu');
      document.body.classList.toggle('body-overflow-mode');
    });
  }

  fixedMenu();
  window.addEventListener('scroll', function () {
    fixedMenu();
  });

  function fixedMenu() {
    if (window.pageYOffset > 20) {
      document.getElementById('header').classList.add('header-report-sm');
    } else {
      document.getElementById('header').classList.remove('header-report-sm');
    }
  } // find coordinates in map
  // var svg = document.getElementById("ukraine-map");
  // var pt = svg.createSVGPoint();
  // svg.addEventListener("click", function(evt) {
  //     pt.x = evt.clientX;
  //     pt.y = evt.clientY;
  //     console.log(pt.matrixTransform(svg.getScreenCTM().inverse()));
  // });

});

function addSlider() {
  if ($(".simple-block-slider")) {
    $(".simple-block-slider").each(function () {
      $(this).slick({
        infinite: true,
        arrows: true,
        dots: false,
        slidesToShow: 3,
        swipeToSlide: true,
        speed: 300,
        prevArrow: $(this).parent().find(".simple-block-slider-controls .prev"),
        nextArrow: $(this).parent().find(".simple-block-slider-controls .next"),
        responsive: [{
          breakpoint: 1081,
          settings: {
            variableWidth: true,
            slidesToShow: 2
          }
        }, {
          breakpoint: 421,
          settings: {
            variableWidth: true,
            slidesToShow: 1
          }
        }]
      });
    });
  }

  if ($(".image-slider")) {
    $(".image-slider").each(function () {
      $(this).slick({
        infinite: true,
        arrows: true,
        dots: false,
        slidesToShow: 1,
        swipeToSlide: true,
        speed: 300,
        prevArrow: $(this).parent().find(".image-slider-controls .prev"),
        nextArrow: $(this).parent().find(".image-slider-controls .next")
      });
    });
  }

  if ($(".news-block-slider-rows")) {
    $(".news-block-slider-rows").each(function () {
      $(this).slick({
        infinite: true,
        arrows: true,
        dots: false,
        swipeToSlide: true,
        speed: 300,
        slidesPerRow: 4,
        rows: 2,
        prevArrow: $(this).parent().find(".news-block-slider-controls .prev"),
        nextArrow: $(this).parent().find(".news-block-slider-controls .next"),
        responsive: [{
          breakpoint: 1201,
          settings: {
            slidesPerRow: 3
          }
        }, {
          breakpoint: 961,
          settings: {
            slidesPerRow: 1,
            variableWidth: true,
            swipeToSlide: true
          }
        }]
      });
    });
  }
}

function addChart(id, dataChart) {
  Chart.types.Doughnut.extend({
    name: "doughnutAlt",
    draw: function draw() {
      Chart.types.Doughnut.prototype.draw.apply(this, arguments);

      for (var i = 0; i < this.segments.length; i++) {
        var centerAngle = this.segments[i].startAngle + (this.segments[i].endAngle - this.segments[i].startAngle) / 2,
            rangeFromCenter = (this.segments[i].outerRadius - this.segments[i].innerRadius) / 2 + this.segments[i].innerRadius;
        x = this.segments[i].x + Math.cos(centerAngle) * rangeFromCenter;
        y = this.segments[i].y + Math.sin(centerAngle) * rangeFromCenter;
        this.chart.ctx.textAlign = "center";
        this.chart.ctx.textBaseline = "middle";
        this.chart.ctx.fillStyle = "#fff";
        this.chart.ctx.font = 'normal 18px "Helvetica Neue", "Helvetica", "Arial", sans-serif';
        this.chart.ctx.fillText(this.segments[i].value + "%", x, y);
      }
    }
  });
  var chartOptions = {
    onAnimationComplete: function onAnimationComplete() {
      // Always show Tooltip
      this.showTooltip(this.segments, true);
    },
    customTooltips: function customTooltips(tooltip) {
      // Tooltip Element
      var tooltipEl = $(id + " .chartjs-tooltip"); // Hide if no tooltip

      if (!tooltip) {
        tooltipEl.css({
          opacity: 1
        });
        return;
      } // Set caret Position


      tooltipEl.removeClass("above below");
      tooltipEl.addClass(tooltip.yAlign);
      tooltipEl.addClass(tooltip.xAlign); // Set Text

      tooltipEl.html(tooltip.text); // Find Y Location on page

      var top;

      if (tooltip.yAlign == "above") {
        top = tooltip.y - tooltip.caretHeight - tooltip.caretPadding;
      } else {
        top = tooltip.y + tooltip.caretHeight + tooltip.caretPadding;
      } // Display, position, and set styles for font


      tooltipEl.css({
        opacity: 0,
        left: tooltip.chart.canvas.offsetLeft + tooltip.x + "px",
        top: tooltip.chart.canvas.offsetTop + top + "px",
        fontFamily: tooltip.fontFamily,
        fontSize: tooltip.fontSize,
        fontStyle: tooltip.fontStyle,
        xOffset: tooltip.xOffset
      });
    },
    tooltipEvents: [],
    // Remove to enable Default Mouseover events
    tooltipFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
    tooltipFillColor: "rgba(0,0,0,0.0)",
    tooltipFontColor: "#505050",
    tooltipFontSize: 24,
    tooltipXOffset: 0,
    tooltipXPadding: 0,
    tooltipYPadding: 0,
    tooltipTemplate: "<%= value %>%",
    legends: true,
    showTooltips: true,
    segmentShowStroke: false,
    percentageInnerCutout: 70,
    responsive: true,
    maintainAspectRatio: false,
    animationEasing: "easeInOutQuart",
    legendTemplate: '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<segments.length; i++){%><li><span style="background-color:<%=segments[i].fillColor%>"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>'
  };
  var doughnutChart = new Chart(document.querySelector(id + " .doughnut").getContext("2d")).doughnutAlt(dataChart, chartOptions);
  document.querySelector(id + " .chart-legend").innerHTML = doughnutChart.generateLegend();
}

/***/ }),

/***/ 1:
/*!********************************!*\
  !*** multi ./src/js/report.js ***!
  \********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! C:\OSPanel\domains\acc-site\wp-content\themes\acc_theme\src\js\report.js */"./src/js/report.js");


/***/ })

/******/ });