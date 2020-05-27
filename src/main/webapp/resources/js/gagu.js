
$(function(){//로드하면 실행되는데 window.onload
	getJsonTest();
})

function getJsonTest(){ // jquery에서는 getJSON()함수를 통해 json파일을 읽어올 수 있다.
	$.getJSON("resources/json/gagu.json", function(data){  //읽어올 파일위치 정보(url), 서버로보낼 데이터(data)
		$.each(data, function(key,val){//$.each() 메서드는 반복함수, 첫번째 매개변수로 data 객체 받음, 두번째 매개변수로 콜백함수
			  //즉, 콜백 함수란 1. 다른 함수의 인자로써 이용되는 함수. 2. 어떤 이벤트에 의해 호출되어지는 함수.

			$("table").attr("border","1");
				
			$("thead").append(
					"<tr>"+
						"<th>REGION</th>"+
						"<th>GENDER</th>"+
						"<th>AGESUM</th>"+
						"<th>MIMAN_20</th>"+
						"<th>N_20</th>"+
						"<th>N_30</th>"+
						"<th>N_40</th>"+
						"<th>N_50</th>"+
						"<th>N_60</th>"+
						"<th>N_70</th>"+
						"<th>ISANG_80</th>"+
					"</tr>"
				);
			
			if(key=="row"){
				var list = val;
				for(var i=0; i<list.length;i++){
					var str = list[i];
					
					var n_20 = Number(str.n_2024se)+Number(str.n_2529se);
					var n_30 = Number(str.n_3034se)+Number(str.n_3539se);
					var n_40 = Number(str.n_4044se)+Number(str.n_3539se);
					var n_50 = Number(str.n_5054se)+Number(str.n_3539se);
					var n_60 = Number(str.n_6064se)+Number(str.n_4549se);
					var n_70 = Number(str.n_7074se)+Number(str.n_5559se);
					var isang_80 = Number(str.n_8084se)+Number(str.n_85seisang);
					
					
					$("tbody").append(
						"<tr>"+
							"<td>"+str.gubun+"</td>"+
							"<td>"+str.seongbyeol+"</td>"+
							"<td>"+str.hapgye+"</td>"+
							"<td>"+str.n_20semiman+"</td>"+
							"<td>"+n_20+"</td>"+
							"<td>"+n_30+"</td>"+
							"<td>"+n_40+"</td>"+
							"<td>"+n_50+"</td>"+
							"<td>"+n_60+"</td>"+
							"<td>"+n_70+"</td>"+
							"<td>"+isang_80+"</td>"+
							"<input type='hidden' name='gagu' value='"
												+str.gubun+"/"+
												str.seongbyeol+"/"+
												str.hapgye+"/"+
												str.n_20semiman+"/"+
												n_20+"/"+
												n_30+"/"+
												n_40+"/"+
												n_50+"/"+
												n_60+"/"+
												n_70+"/"+
												isang_80+"/"+"'>"+
						"</tr>" 
					);
				}
			}
		});
	})
}