import axios from 'axios';
import moment from 'moment';
import { TweenLite, TimelineLite } from 'gsap';
import 'moment/locale/en-au';

var allEvents;
var all_event_load;

document.addEventListener("DOMContentLoaded", function(event) { 
    if(document.getElementById('calendar-table')){

        var page = document.getElementById('calendar-table').getAttribute('data-id');


        axios({
            method: "post",
            url: window.api_settings.ajax_url + '?action=getCalendarEvents&page='+ page,
            data: {
                month: active.month,
                year: active.year,
                // action: 'getCalendarEvents'
            }
        })
        .then(response => {
            console.log("Events list");
            console.log(response.data.calendar);
    
            lang = response.data.lang;
            moment.locale(lang);
    
            localStorage.setItem('cur_lang',lang);
    
            if(lang == 'en'){
                emptyCalendar = 'There are no events on the selected date'
            } else if(lang == 'ua'){
                emptyCalendar = 'На обрану дату немає подій'
            }

            allEvents = response.data.calendar;
            all_event_load = response.data.all_event_load;
            calendar(allEvents);
            showAllEvents(all_event_load);
        
        })
        .catch(error => {
            console.log(error);
        });


    }
}); 

var lang;

var now = new Date();
var currentDay = {
    day: now.getDate(),
    month: (now.getMonth() + 1),
    year: now.getFullYear(),
}

var active = {
    day: currentDay.day,
    month: currentDay.month,
    year: currentDay.year,
}
var emptyCalendar;

function calendar(){

    setMonth();

    var prevMonth = document.getElementById('month-prev');
    var nextMonth = document.getElementById('month-next');


    prevMonth.addEventListener('click', function(){
        if (active.month == 1){
            active.month = 12;
            active.year -= 1;
        } else {
            active.month -= 1;
        }
        active.day = 1;
        setMonth();
    });

    nextMonth.addEventListener('click', function(){
        if (active.month == 12){
            active.month = 1;
            active.year += 1;
        } else {
            active.month += 1;
        }
        active.day = 1;
        setMonth();
    });

    document.querySelectorAll('input[name="main-events"]').forEach(function(item){
        item.addEventListener('change', function(){
            calendarFilter();
        });
    });

    document.querySelectorAll('input[name="secondary-events"]').forEach(function(item){
        item.addEventListener('change', function(){
            calendarFilter();
        });
    });

    if(window.innerWidth <= 720){
        document.getElementById('primary-filter-button').classList.add('active');
        document.getElementById('secondary-events').classList.add('hidden-events');
        document.querySelectorAll('.calendar-mob-filter-button').forEach(function(item){
            item.addEventListener('click', function(){
                document.querySelectorAll('.calendar-mob-filter-button').forEach(function(itemIt){
                    itemIt.classList.remove('active');
                });
                this.classList.add('active');
                if(this.classList.contains('primary-filter-button')){
                    document.getElementById('secondary-events').classList.add('hidden-events');
                    document.getElementById('primary-events').classList.remove('hidden-events');
                } else {
                    document.getElementById('primary-events').classList.add('hidden-events');
                    document.getElementById('secondary-events').classList.remove('hidden-events');
                }
            });
        });
    }

}

 /**
 * returns number of days in month
 * 
 * @param {number} m - number of month (start from 1)
 * @param {number} y - number of year
 */
function daysInMonth(m, y) {
    return 31 - (--m ^ 1? m % 7 & 1:  y & 3? 3: y % 25? 2: y & 15? 3: 2);
}


/**
 * changes month in calendar
 * 
 * @param {object} currentDay - current day with parametres
 * @param {object} active - has parametres active.day, active.month and active year
 */
function setMonth(){
    if((active.month <= 1) && (active.year <= 2017)){
        document.getElementById('month-prev').classList.add('unactive');
    } else {
        document.getElementById('month-prev').classList.remove('unactive');
    }
    setDays(allEvents);
    return active;

    
}

function setDays(data){
    var dayPrev = document.getElementById('day-prev');
    var dayNext = document.getElementById('day-next');

    if(!dayPrev.classList.contains('has-event')){
        dayPrev.classList.add('has-event');
        dayPrev.addEventListener('click', function(){
            if(active.day == 1){
                if (active.month == 1){
                    active.month = 12;
                    active.year -= 1;
                    active.day = daysInMonth(active.month, active.year);
                } else {
                    active.month -= 1;
                    active.day = daysInMonth(active.month, active.year);
                }
                setMonth();
            } else {
                active.day -= 1;
                setEvents(data);
            }
        });
    }

    if(!dayNext.classList.contains('has-event')){
        dayNext.classList.add('has-event');
        dayNext.addEventListener('click', function (){
            if(active.day == daysInMonth(active.month, active.year)){
                if (active.month == 12){
                    active.month = 1;
                    active.year += 1;
                    active.day = 1;
                } else {
                    active.month += 1;
                    active.day = 1;
                }
                setMonth();
            } else {
                active.day += 1;
                setEvents(data);
            }
        });
    }

    setEvents(data);
}

/**
 * forms blocks of events for calendar
 * @param {array} data - data of events per day 
 */
function setEvents(data){

    var calendarWeek = document.getElementById('calendar-week');
    calendarWeek.innerHTML = "";

    var lang = localStorage.getItem('cur_lang');

    if(lang == 'ua'){
        lang = 'uk';
    }

    moment.locale(lang);

    for(var i = 1; i < 7; i++){
        calendarWeek.innerHTML += '<div>' + moment.weekdaysShort(i) + '</div>';
    }
    calendarWeek.innerHTML += '<div>' + moment.weekdaysShort(0) + '</div>';

    var choosedMonth = document.getElementById('choosed-month');
    var choosedYear = document.getElementById('choosed-year');
    var choosedDate =  document.getElementById('choosed-date');

    var dateMonth = (active.month < 10) ? "0" + active.month : active.month;
    var dateDay = (active.day < 10) ? "0" + active.day : active.day;
    var thisDate = active.year + "-" + dateMonth + "-" + dateDay;
  
    var formattedDate = moment(thisDate).format("dddd, D MMMM");

    choosedMonth.innerHTML = moment(active.month, 'MM').format('MMMM');
    choosedYear.innerHTML = active.year;
    choosedDate.innerHTML = formattedDate;

    var content = '';
    var primaryEvents = '', secondaryEvents = '';
    var calendarPrimaryEvents = document.getElementById('primary-events');
    var calendarSecondaryEvents = document.getElementById('secondary-events');

    for(var key in data){

        if(key == thisDate){
            
            primaryEvents = '', secondaryEvents = '';
            for(var i = 0; i < data[key].length; i++){
                var type = (data[key][i].type == "acc") ? 'primary-event' : 'secondary-event';

                var diff = moment(thisDate).diff(moment(new Date()), 'day');
                if(lang == "en") {
                    var before = "Days to go: ";
                    var today = "Today";
                    var after = "The event happened";
                } else if(lang == "uk"){
                    var before = "Днів до початку: ";
                    var today = "Сьогодні";
                    var after = "Подія відбулася";
                }


                var leftDays = (diff > 0) ? before+diff : (diff == 0) ? today : after;
                var status = (diff < 0) ? 'archive' : 'planned';

                content = '\
                    <div class="calendar-event '+ status+' ' + type +'" data-main-type="'+ data[key][i].type +'" data-secondary-type="'+data[key][i].secondaryType+'">\
                        <div class="calendar-event-time">' + data[key][i].time +'</div>\
                        <div class="calendar-event-main">\
                            <div class="calendar-event-top">\
                                <span class="tag">' + data[key][i].tag + '</span>\
                                <span class="days-left secondary-text">\
                                ' + leftDays + '\
                                </span>\
                            </div>\
                            <a href="'+ data[key][i].link +'" class="h5 calendar-event-title">\
                                ' + data[key][i].title + '\
                            </a>\
                        </div>\
                    </div>';

                (data[key][i].type == "acc") ? primaryEvents += content : secondaryEvents += content;
            }
        }
    }

    if((primaryEvents.length > 0) || (secondaryEvents.length > 0)) {
        calendarPrimaryEvents.innerHTML = primaryEvents;
        calendarSecondaryEvents.innerHTML = secondaryEvents;
    } else {
        calendarPrimaryEvents.innerHTML = '\
            <div class="calendar-event event-empty">\
                <div class="calendar-event-main">\
                    <div class="h5 calendar-event-title">\
                        ' + emptyCalendar + '\
                    </div>\
                </div>\
            </div>';

            calendarSecondaryEvents.innerHTML = '';
    }

    if(window.innerWidth <= 720){
        console.log(primaryEvents.length);
        if(primaryEvents.length > 0){
            calendarPrimaryEvents.innerHTML = primaryEvents;
        } else {
            calendarPrimaryEvents.innerHTML = '\
            <div class="calendar-event event-empty">\
                <div class="calendar-event-main">\
                    <div class="h5 calendar-event-title">\
                        ' + emptyCalendar + '\
                    </div>\
                </div>\
            </div>';
        }
        if(secondaryEvents.length > 0){
            calendarSecondaryEvents.innerHTML = secondaryEvents;
        } else {
            calendarSecondaryEvents.innerHTML = '\
            <div class="calendar-event event-empty">\
                <div class="calendar-event-main">\
                    <div class="h5 calendar-event-title">\
                        ' + emptyCalendar + '\
                    </div>\
                </div>\
            </div>';
        }

    }
    

    var activeMonth = {
        dayOfMonth: daysInMonth(active.month, active.year),
        firstWeekDay: new Date(active.year, active.month - 1, 1).getDay(),
    }

    var calendarTable = document.getElementById('calendar-days');

    if(activeMonth.firstWeekDay == 0){
        activeMonth.firstWeekDay = 7;
    }

    var fieldsInCalendar = activeMonth.firstWeekDay - 1 + activeMonth.dayOfMonth;

    if((fieldsInCalendar % 7) != 0){
        fieldsInCalendar += 7 - (fieldsInCalendar % 7);
    }

    var prevMonth = {};
    if (active.month == 1){
        prevMonth.month = 12;
        prevMonth.year = active.year - 1;
    } else {
        prevMonth.month = active.month - 1;
        prevMonth.year = active.year;
    }

    var nextMonth = {};
    if (active.month == 12){
        nextMonth.month = 1;
        nextMonth.year = active.year + 1;
    } else {
        nextMonth.month = active.month + 1;
        nextMonth.year = active.year;
    }

    var prevMonthCountDays =  daysInMonth(prevMonth.month, prevMonth.year);

    var k = 1, t = 1;

    calendarTable.innerHTML = '';


    for (var i = 0; i < 42; i++){
        if(i < activeMonth.firstWeekDay - 1){
            calendarTable.innerHTML += '<div class="calendar-month-day unactive from-prev-month" data-day="'+prevMonth.year+'-'+prevMonth.month+'-'+(prevMonthCountDays - activeMonth.firstWeekDay + 2 + i)+'">' + (prevMonthCountDays - activeMonth.firstWeekDay + 2 + i) + '</div>';
        } else if((i >= activeMonth.firstWeekDay - 1) && (i < activeMonth.dayOfMonth + activeMonth.firstWeekDay - 1)){
           
            calendarTable.innerHTML += '<div class="calendar-month-day with-date" data-day=' + active.year + '-' + active.month + '-' + k + '>' + k + '</div>';

            if(document.querySelectorAll('.calendar-month-day.with-date')[k - 1].getAttribute('data-day') == active.year+'-'+active.month+'-'+active.day){
                var currentDate = document.querySelectorAll('.calendar-month-day.with-date')[k - 1];
             
                addCurrent(currentDate, document.querySelectorAll('.calendar-month-day.with-date'));
            }
            if(document.querySelectorAll('.calendar-month-day.with-date')[k - 1].getAttribute('data-day') == currentDay.year+'-'+currentDay.month+'-'+currentDay.day){
                document.querySelectorAll('.calendar-month-day.with-date')[k - 1].classList.add('today');
            }
            k++;
        } else {
            calendarTable.innerHTML += '<div class="calendar-month-day unactive from-next-month" data-day="'+nextMonth.year+'-'+nextMonth.month+'-'+t+'">' + t + '</div>';
            t++;
        }
        for(var key in data){
            var dateFromAttr = document.querySelectorAll('.calendar-month-day')[i].getAttribute('data-day').split("-");
            var dateYear = dateFromAttr[0];
            var dateMonth= (dateFromAttr[1] < 10) ? "0" + dateFromAttr[1] : dateFromAttr[1];
            var dateDay = (dateFromAttr[2] < 10) ? "0" + dateFromAttr[2] : dateFromAttr[2];

            var date1 = moment(key);
            var date2 = moment(dateYear + '-' + dateMonth + '-' + dateDay);

            if(Number(date1) == Number(date2)){
                for(var j = 0; j < data[key].length; j++){
                    if(data[key][j].type == "acc"){
                        document.querySelectorAll('.calendar-month-day')[i].classList.add('has-primary-event');
                    } else if(data[key][j].type == "partners") {
                        document.querySelectorAll('.calendar-month-day')[i].classList.add('has-secondary-event');
                    }
                }
            }
        }
    }   

    var calendarDays = document.querySelectorAll('.calendar-month-day');
    for(var j = 0; j < calendarDays.length; j++){
        calendarDays[j].addEventListener('click', function(){
            addCurrent(this, calendarDays);

            var dateFromAttr = this.getAttribute('data-day').split("-");
            var dateYear = dateFromAttr[0];
            var dateMonth= (dateFromAttr[1] < 10) ? "0" + dateFromAttr[1] : dateFromAttr[1];
            var dateDay = (dateFromAttr[2] < 10) ? "0" + dateFromAttr[2] : dateFromAttr[2];

            var date = new Date(dateYear + '-' + dateMonth + '-' + dateDay);
            active = {
                day: date.getDate(),
                month: (date.getMonth() + 1),
                year: date.getFullYear(),
            }
            if(this.classList.contains('with-date')){
                setEvents(data);
            } else {
                setMonth();
            }
            if(window.innerWidth > 720){
                calendarFilter();
            }
        });
    }
    if(window.innerWidth > 720){
        calendarFilter();
    }
}

function addCurrent(currentDate, allDates){
    for(var i = 0; i < allDates.length; i++){
        allDates[i].classList.remove('choosed-date');
    }
    currentDate.classList.add('choosed-date');

    var currentLabel = document.getElementById('current-date-label');

    var tll = new TimelineLite();

    if(window.innerWidth > 1440){
        tll.to(currentLabel, .2, {width: '4rem', y: currentDate.offsetTop - 3 + 'px'})
           .to(currentLabel, .2, {x: currentDate.offsetLeft + 7 + 'px' });
    } else if(window.innerWidth <= 1440 && window.innerWidth > 960){
        tll.to(currentLabel, .2, {width: '3.5rem', y: currentDate.offsetTop - 5 + 'px'})
           .to(currentLabel, .2, {x: currentDate.offsetLeft + 2 + 'px' });
    } else if(window.innerWidth <= 960 && window.innerWidth > 720){
        tll.to(currentLabel, .2, {width: '3.5rem', y: currentDate.offsetTop - 5 + 'px'})
           .to(currentLabel, .2, {x: currentDate.offsetLeft - 1 + 'px' });
    } else {
        
        tll.to(currentLabel, .2, {width: '3.5rem', y: currentDate.offsetTop - 5 + 'px'})
           .to(currentLabel, .2, {x: currentDate.offsetLeft + 0.07 * window.innerWidth - 26 + 'px' });
    }
    
}

function calendarFilter(){
    var mainChoosedFilter = document.querySelector('input[name="main-events"]:checked').getAttribute('date-check');
    var secondaryChoosedFilter = document.querySelector('input[name="secondary-events"]:checked').getAttribute('date-check');
    var calendarEvents = document.querySelectorAll('.calendar-event:not(.event-empty)');

    for(var i = 0; i < calendarEvents.length; i++){
        if(mainChoosedFilter == 'all' && secondaryChoosedFilter == 'all'){
            calendarEvents[i].classList.remove('hidden');
        } else if(secondaryChoosedFilter == 'all'){
            if(calendarEvents[i].getAttribute('data-main-type') != mainChoosedFilter){
                calendarEvents[i].classList.add('hidden');
            } else {
                calendarEvents[i].classList.remove('hidden');
            }
        } else if(mainChoosedFilter == 'all'){
            if(calendarEvents[i].getAttribute('data-secondary-type') != secondaryChoosedFilter){
                calendarEvents[i].classList.add('hidden');
            } else {
                calendarEvents[i].classList.remove('hidden');
            }
        } else {
            if((calendarEvents[i].getAttribute('data-main-type') != mainChoosedFilter) || (calendarEvents[i].getAttribute('data-secondary-type') != secondaryChoosedFilter)){
                calendarEvents[i].classList.add('hidden');
            } else {
                calendarEvents[i].classList.remove('hidden');
            }
        }
    }

    if((calendarEvents.length > 0) && (calendarEvents.length == document.querySelectorAll('.calendar-event.hidden').length) && (document.querySelectorAll('.calendar-event.event-empty').length == 0)){
        document.getElementById('primary-events').innerHTML += '\
        <div class="calendar-event event-empty">\
            <div class="calendar-event-main">\
                <div class="h5 calendar-event-title">\
                    ' + emptyCalendar + '\
                </div>\
            </div>\
        </div>';
    } else if(document.querySelectorAll('.calendar-event:not(.event-empty):not(.hidden)').length > 0){
        if( document.querySelector('.calendar-event.event-empty')){
            document.querySelector('.calendar-event.event-empty').remove();
        }
    }
   
}

function showAllEvents(data){
    var page = document.getElementById('calendar-table').getAttribute('data-id');

    var calendarWeek = document.getElementById('calendar-week');
    calendarWeek.innerHTML = "";
    
    for(var i = 1; i < 7; i++){
        calendarWeek.innerHTML += '<div>' + moment.weekdaysShort(i) + '</div>';
    }
    calendarWeek.innerHTML += '<div>' + moment.weekdaysShort(0) + '</div>';

    var choosedMonth = document.getElementById('choosed-month');
    var choosedYear = document.getElementById('choosed-year');
    var choosedDate =  document.getElementById('choosed-date');

    var dateMonth = (active.month < 10) ? "0" + active.month : active.month;
    var dateDay = (active.day < 10) ? "0" + active.day : active.day;
    var thisDate = active.year + "-" + dateMonth + "-" + dateDay;
  
    var formattedDate = moment(thisDate).format("dddd, D MMMM");

    choosedMonth.innerHTML = moment(active.month, 'MM').format('MMMM');
    choosedYear.innerHTML = active.year;
    choosedDate.innerHTML = formattedDate;

    var content = '';
    var primaryEvents = '';
    var secondaryEvents = '';

    var calendarPrimaryEvents = document.getElementById('primary-events');
    var calendarSecondaryEvents = document.getElementById('secondary-events');

    var counter = 0;

    primaryEvents = '', secondaryEvents = '';

    var choosedDate =  document.getElementById('choosed-date');
    var upcomingEvents = 'Upcoming events';
    choosedDate.innerHTML = upcomingEvents;


    for(var i = 0; i < data.length; i++){

        if(lang == "en") {
            var before = "Days to go: ";
            var today = "Today";
            var after = "The event happened";
        } else if(lang == "uk"){
            var before = "Днів до початку: ";
            var today = "Сьогодні";
            var after = "Подія відбулася";
        }


        var diff = moment(data[i].date).diff(moment(new Date()), 'day');

        var leftDays = (diff > 0) ? before+diff : (diff == 0) ? today : after;
        var status = (diff < 0) ? 'archive' : 'planned';



        if(counter < 10 && leftDays != after){
            counter++;
            var type = (data[i].type == "acc") ? 'primary-event' : 'secondary-event';






            content = '\
                <div class="calendar-event '+ status+' ' + type +'" data-main-type="'+ data[i].type +'" data-secondary-type="'+data[i].secondaryType+'">\
                    <div class="calendar-event-time">' + data[i].time +'</div>\
                    <div class="calendar-event-main">\
                        <div class="calendar-event-top">\
                            <span class="tag">' + data[i].tag + '</span>\
                            <span class="days-left secondary-text">\
                            ' + leftDays + '\
                            </span>\
                        </div>\
                        <a href="'+ data[i].link +'" class="h5 calendar-event-title">\
                            ' + data[i].title + '\
                        </a>\
                    </div>\
                </div>';

            (data[i].type == "acc") ? primaryEvents += content : secondaryEvents += content;
        }
    }

    if((primaryEvents.length > 0) || (secondaryEvents.length > 0)) {
        calendarPrimaryEvents.innerHTML = primaryEvents;
        calendarSecondaryEvents.innerHTML = secondaryEvents;
    } else {
        calendarPrimaryEvents.innerHTML = '\
            <div class="calendar-event event-empty">\
                <div class="calendar-event-main">\
                    <div class="h5 calendar-event-title">\
                        ' + emptyCalendar + '\
                    </div>\
                </div>\
            </div>';

            calendarSecondaryEvents.innerHTML = '';
    }
}