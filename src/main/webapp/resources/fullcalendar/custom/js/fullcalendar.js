// add schedule popup open
function click_add() {
   var url = "fullcalendarpopup";
   var name = "fullcalendarpopup";
   var option = "width = 600, height = 600 left = 100, top=50,location=no";
   window.open("fullcalendarpopup.do",name,option)
};


//datepicker
$(function() {
   $.datepicker.setDefaults({
      dateFormat : 'yy-mm-dd',
      showOtherMonths : true,
      showMonthAfterYear : true,
      changeYear : true,
      changeMonth : true,          
       yearSuffix: "년",
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNamesMin: ['일','월','화','수','목','금','토'],
       dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
   });
   $("#startDate").datepicker();
   $("#endDate").datepicker();
   
   $("#startDate").datepicker('setDate', 'today');
   $("#endDate").datepicker('setDate', 'today');
});

//add schedule
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
       var name = $.trim(this.name),
          value = $.trim(this.value);
       
        if (o[name]) {
            if (!o[name].push) {
                o[name] = [o[name]];
            }
            o[name].push(value || '');
        } else {
            o[name] = value || '';
        }
    });
    return o;
};


function click_ok(){

   var fullcalendarData = JSON.stringify($('form#fullcalendarData').serializeObject());
   
   $.ajax({
      data : fullcalendarData,
      url : "/prectice/fullcalendaradd.do",
      type : "POST",
      dataType : "json",
      contentType : "application/json; charset=UTF-8",
      success : function(data) {
         alert("일정을 등록하셨습니다.");
         opener.parent.location.reload();
         window.close();
      },error : function(){
         alert("Insert실패");
      }
   });
};
