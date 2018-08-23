
window.onload=function(){
	(function(){
		$("#myLeft").css("z-index",2); // navbar 제일 뒤로 밀기
		$("#myNavBar").css("z-index",1); // navbar 제일 뒤로 밀기
		$("#first").css({margin:"20px 0",padding:"0px 0"});
		$("#second").css({margin:"0px 0",padding:"0px 0"});
		$("#third").css({margin:"40px 0",padding:"0px 0"});
		$("#fourth").css({margin:"10px 0",padding:"0px 0"});
	})()
   			var pie = document.getElementById('pieChart').getContext('2d');
		   	var bar = document.getElementById('barChart').getContext('2d');
		   	var center = document.getElementById('centerChart').getContext('2d');
		   	var gangwondo = document.getElementById('gangwondoChart').getContext('2d');
		   	var chungcheongdo = document.getElementById('chungcheongdoChart').getContext('2d');
		   	var jollado = document.getElementById('jolladoChart').getContext('2d');
		   	var gyeongsangdo = document.getElementById('gyeongsangdoChart').getContext('2d');
		   	var jejudo = document.getElementById('jejudoChart').getContext('2d');

		   	var pieChart = new Chart(pie, {
		   		type: 'pie',
				data: {
					datasets: [{
						data: [$("#buildPie1").val(), $("#buildPie2").val(), $("#buildPie3").val()],
						backgroundColor: [
							'red',
							'skyblue',
							'blue',
						],
						label: 'Dataset 1'
					}],
					labels: [
						'전세',
						'반전세',
						'월세'
					]
				},
				options: {
					responsive: true,
					legend: {
			            labels: {
		                	fontSize: 30
			            }
			        }, 
			        tooltips: {
			            titleFontSize: 30,
			            bodyFontSize: 30
			        }
				}
		   	});
		   	var barChart = new Chart(bar, {
				type: 'bar',
				data: {
					labels: ['월', '화', '수', '목', '금', '토', '일'],
					datasets: [{
						label: '등록 건수',
						backgroundColor: 'skyblue',
						data: [$("#buildBar1").val(), $("#buildBar2").val(), $("#buildBar3").val(), $("#buildBar4").val(), $("#buildBar5").val(), $("#buildBar6").val(), $("#buildBar7").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		   	var centerChart = new Chart(center, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '서울특별시',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLine11").val(), $("#buildLine12").val(), $("#buildLine13").val(), $("#buildLine14").val(), $("#buildLine15").val(), $("#buildLine16").val(), $("#buildLine17").val(), $("#buildLine18").val()],
						fill: false,
					}, {
						label: '경기도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLine21").val(), $("#buildLine22").val(), $("#buildLine23").val(), $("#buildLine24").val(), $("#buildLine25").val(), $("#buildLine26").val(), $("#buildLine27").val(), $("#buildLine28").val()],
					}, {
						label: '인천광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLine31").val(), $("#buildLine32").val(), $("#buildLine33").val(), $("#buildLine34").val(), $("#buildLine35").val(), $("#buildLine36").val(), $("#buildLine37").val(), $("#buildLine38").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		   	var gangwondoChart = new Chart(gangwondo, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '강원도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLine41").val(), $("#buildLine42").val(), $("#buildLine43").val(), $("#buildLine44").val(), $("#buildLine45").val(), $("#buildLine46").val(), $("#buildLine47").val(), $("#buildLine48").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		   	var chungcheongdoChart = new Chart(chungcheongdo, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '충청남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLine51").val(), $("#buildLine52").val(), $("#buildLine53").val(), $("#buildLine54").val(), $("#buildLine55").val(), $("#buildLine56").val(), $("#buildLine57").val(), $("#buildLine58").val()],
						fill: false,
					}, {
						label: '충청북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLine61").val(), $("#buildLine62").val(), $("#buildLine63").val(), $("#buildLine64").val(), $("#buildLine65").val(), $("#buildLine66").val(), $("#buildLine67").val(), $("#buildLine68").val()],
					}, {
						label: '대전광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLine71").val(), $("#buildLine72").val(), $("#buildLine73").val(), $("#buildLine74").val(), $("#buildLine75").val(), $("#buildLine76").val(), $("#buildLine77").val(), $("#buildLine78").val()],
					}, {
						label: '세종특별자치시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [$("#buildLine81").val(), $("#buildLine82").val(), $("#buildLine83").val(), $("#buildLine84").val(), $("#buildLine85").val(), $("#buildLine86").val(), $("#buildLine87").val(), $("#buildLine88").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		   	var jolladoChart = new Chart(jollado, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '전라북도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLine91").val(), $("#buildLine92").val(), $("#buildLine93").val(), $("#buildLine94").val(), $("#buildLine95").val(), $("#buildLine96").val(), $("#buildLine97").val(), $("#buildLine98").val()],
						fill: false,
					}, {
						label: '전라남도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLine101").val(), $("#buildLine102").val(), $("#buildLine103").val(), $("#buildLine104").val(), $("#buildLine105").val(), $("#buildLine106").val(), $("#buildLine107").val(), $("#buildLine108").val()],
					}, {
						label: '광주광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLine111").val(), $("#buildLine112").val(), $("#buildLine113").val(), $("#buildLine114").val(), $("#buildLine115").val(), $("#buildLine116").val(), $("#buildLine117").val(), $("#buildLine118").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		   	var gyeongsangdoChart = new Chart(gyeongsangdo, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '경상남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLine121").val(), $("#buildLine122").val(), $("#buildLine123").val(), $("#buildLine124").val(), $("#buildLine125").val(), $("#buildLine126").val(), $("#buildLine127").val(), $("#buildLine128").val()],
						fill: false,
					}, {
						label: '경상북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLine131").val(), $("#buildLine132").val(), $("#buildLine133").val(), $("#buildLine134").val(), $("#buildLine135").val(), $("#buildLine136").val(), $("#buildLine137").val(), $("#buildLine138").val()],
					}, {
						label: '대구광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLine141").val(), $("#buildLine142").val(), $("#buildLine143").val(), $("#buildLine144").val(), $("#buildLine145").val(), $("#buildLine146").val(), $("#buildLine147").val(), $("#buildLine148").val()],
					}, {
						label: '부산광역시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [$("#buildLine151").val(), $("#buildLine152").val(), $("#buildLine153").val(), $("#buildLine154").val(), $("#buildLine155").val(), $("#buildLine156").val(), $("#buildLine157").val(), $("#buildLine158").val()],
					}, {
						label: '울산광역시',
						fill: false,
						backgroundColor: 'pink',
						borderColor: 'pink',
						data: [$("#buildLine161").val(), $("#buildLine162").val(), $("#buildLine163").val(), $("#buildLine164").val(), $("#buildLine165").val(), $("#buildLine166").val(), $("#buildLine167").val(), $("#buildLine168").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		   	var jejudoChart = new Chart(jejudo, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '제주특별자치도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLine171").val(), $("#buildLine172").val(), $("#buildLine173").val(), $("#buildLine174").val(), $("#buildLine175").val(), $("#buildLine176").val(), $("#buildLine177").val(), $("#buildLine178").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});

		  
		   	$("#pieChart").css("width","50%");
		   	$("#pieChart").css("height","50%");
		   	$(".chartWrapper").attr("align","center");

		   	
		   	
		   	
		   		/*  여기부터 매출현황  */
			
 		   	var yearBar = document.getElementById('yearBarChart').getContext('2d');
 		   	var monthBar = document.getElementById('monthBarChart').getContext('2d');
 		   	var dayBar = document.getElementById('dayBarChart').getContext('2d');
		   	
 		   	var centerYearSales = document.getElementById('centerYearSalesChart').getContext('2d');
 		   	var centerMonthSales = document.getElementById('centerMonthSalesChart').getContext('2d');
 		   	var centerDaySales = document.getElementById('centerDaySalesChart').getContext('2d');

 		   	var gangwondoYearSales = document.getElementById('gangwondoYearSalesChart').getContext('2d');
 		   	var gangwondoMonthSales = document.getElementById('gangwondoMonthSalesChart').getContext('2d');
 		   	var gangwondoDaySales = document.getElementById('gangwondoDaySalesChart').getContext('2d');

 		   	var chungcheongdoYearSales = document.getElementById('chungcheongdoYearSalesChart').getContext('2d');
 		   	var chungcheongdoMonthSales = document.getElementById('chungcheongdoMonthSalesChart').getContext('2d');
 		   	var chungcheongdoDaySales = document.getElementById('chungcheongdoDaySalesChart').getContext('2d');

 		   	var jolladoYearSales = document.getElementById('jolladoYearSalesChart').getContext('2d');
 		   	var jolladoMonthSales = document.getElementById('jolladoMonthSalesChart').getContext('2d');
 		   	var jolladoDaySales = document.getElementById('jolladoDaySalesChart').getContext('2d');

 		   	var gyeongsangdoYearSales = document.getElementById('gyeongsangdoYearSalesChart').getContext('2d');
 		   	var gyeongsangdoMonthSales = document.getElementById('gyeongsangdoMonthSalesChart').getContext('2d');
 		   	var gyeongsangdoDaySales = document.getElementById('gyeongsangdoDaySalesChart').getContext('2d');

 		   	var jejudoYearSales = document.getElementById('jejudoYearSalesChart').getContext('2d');
 		   	var jejudoMonthSales = document.getElementById('jejudoMonthSalesChart').getContext('2d');
 		   	var jejudoDaySales = document.getElementById('jejudoDaySalesChart').getContext('2d');

  		   var yearBarChart = new Chart(yearBar, {
 				type: 'bar',
 				data: {
 					labels: ['2016', '2017', '2018'],
 					datasets: [{
 						label: '매출 (년 단위) ',
 						backgroundColor: 'skyblue',
 						data: [$("#buildBarYear1").val(), $("#buildBarYear2").val(), $("#buildBarYear3").val()],
 						fill: false,
 					}]
 				},
 				options: {
 					responsive: true,
 					tooltips: {
 						mode: 'index',
 						intersect: false,
 					},
 					hover: {
 						mode: 'nearest',
 						intersect: true
 					},
 					scales: {
 						xAxes: [{
 							display: true
 						}],
 						yAxes: [{
 							display: true,
 							scaleLabel: {
 								display: true,
 								labelString: '매출액'
 							}
 						}]
 					},
 					legend: {
 			            labels: {
 		                	fontSize: 15
 			            }
 			        }
 				}
 			});
  		   // 현재 월까지만 하려고 현재 월까지만 받아오는데, json 안에서 동적으로 처리하는 법을 모르겠다. 
 		   var monthBarChart = new Chart(monthBar, {
				type: 'bar',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '매출 (월 단위) ',
						backgroundColor: 'skyblue',
						data: [$("#buildBarMonth1").val(), $("#buildBarMonth2").val(), $("#buildBarMonth3").val(), $("#buildBarMonth4").val(), $("#buildBarMonth5").val(), $("#buildBarMonth6").val(), $("#buildBarMonth7").val(), $("#buildBarMonth8").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '매출액'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});	
 		   var dayBarChart = new Chart(dayBar, {
				type: 'bar',
				data: {
					labels: ['월', '화', '수', '목', '금', '토', '일'],
					datasets: [{
						label: '매출 (일 단위) ',
						backgroundColor: 'skyblue',
						data: [$("#buildBarDay1").val(), $("#buildBarDay2").val(), $("#buildBarDay3").val(), $("#buildBarDay4").val(), $("#buildBarDay5").val(), $("#buildBarDay6").val(), $("#buildBarDay7").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '매출액'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});	
   		  var centerYearSalesChart = new Chart(centerYearSales, {
				type: 'line',
				data: {
					labels: ['2016년', '2017년', '2018년'],
					datasets: [{
						label: '서울특별시',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineYear11").val(), $("#buildLineYear12").val(), $("#buildLineYear13").val()],
						fill: false,
					}, {
						label: '경기도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineYear21").val(), $("#buildLineYear22").val(), $("#buildLineYear23").val()],
					}, {
						label: '인천광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineYear31").val(), $("#buildLineYear32").val(), $("#buildLineYear33").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  var centerMonthSalesChart = new Chart(centerMonthSales, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '서울특별시',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineMonth11").val(), $("#buildLineMonth12").val(), $("#buildLineMonth13").val(), $("#buildLineMonth14").val(), $("#buildLineMonth15").val(), $("#buildLineMonth16").val(), $("#buildLineMonth17").val(), $("#buildLineMonth18").val()],
						fill: false,
					}, {
						label: '경기도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineMonth21").val(), $("#buildLineMonth22").val(), $("#buildLineMonth23").val(), $("#buildLineMonth24").val(), $("#buildLineMonth25").val(), $("#buildLineMonth26").val(), $("#buildLineMonth27").val(), $("#buildLineMonth28").val()],
					}, {
						label: '인천광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineMonth31").val(), $("#buildLineMonth32").val(), $("#buildLineMonth33").val(), $("#buildLineMonth34").val(), $("#buildLineMonth35").val(), $("#buildLineMonth36").val(), $("#buildLineMonth37").val(), $("#buildLineMonth38").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  var centerDaySalesChart = new Chart(centerDaySales, {
				type: 'line',
				data: {
					labels: ['월', '화', '수', '목', '금', '토', '일'],
					datasets: [{
						label: '서울특별시',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineDay11").val(), $("#buildLineDay12").val(), $("#buildLineDay13").val(), $("#buildLineDay14").val(), $("#buildLineDay15").val(), $("#buildLineDay16").val(), $("#buildLineDay17").val()],
						fill: false,
					}, {
						label: '경기도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineDay21").val(), $("#buildLineDay22").val(), $("#buildLineDay23").val(), $("#buildLineDay24").val(), $("#buildLineDay25").val(), $("#buildLineDay26").val(), $("#buildLineDay27").val()],
					}, {
						label: '인천광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineDay31").val(), $("#buildLineDay32").val(), $("#buildLineDay33").val(), $("#buildLineDay34").val(), $("#buildLineDay35").val(), $("#buildLineDay36").val(), $("#buildLineDay37").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  

  		  var gangwondoYearSalesChart = new Chart(gangwondoYearSales, {
				type: 'line',
				data: {
					labels: ['2016년', '2017년', '2018년'],
					datasets: [{
						label: '강원도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineYear41").val(), $("#buildLineYear42").val(), $("#buildLineYear43").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
 		  var gangwondoMonthSalesChart = new Chart(gangwondoMonthSales, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '강원도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineMonth41").val(), $("#buildLineMonth42").val(), $("#buildLineMonth43").val(), $("#buildLineMonth44").val(), $("#buildLineMonth45").val(), $("#buildLineMonth46").val(), $("#buildLineMonth47").val(), $("#buildLineMonth48").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
 		  var gangwondoDaySalesChart = new Chart(gangwondoDaySales, {
				type: 'line',
				data: {
					labels: ['월', '화', '수', '목', '금', '토', '일'],
					datasets: [{
						label: '강원도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineDay41").val(), $("#buildLineDay42").val(), $("#buildLineDay43").val(), $("#buildLineDay44").val(), $("#buildLineDay45").val(), $("#buildLineDay46").val(), $("#buildLineDay47").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
 		  
  		  var chungcheongdoYearSalesChart = new Chart(chungcheongdoYearSales, {
				type: 'line',
				data: {
					labels: ['2016년', '2017년', '2018년'],
					datasets: [{
						label: '충청남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineYear51").val(), $("#buildLineYear52").val(), $("#buildLineYear53").val()],
						fill: false,
					}, {
						label: '충청북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineYear61").val(), $("#buildLineYear62").val(), $("#buildLineYear63").val()],
					}, {
						label: '대전광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineYear71").val(), $("#buildLineYear72").val(), $("#buildLineYear73").val()],
					}, {
						label: '세종특별자치시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [$("#buildLineYear81").val(), $("#buildLineYear82").val(), $("#buildLineYear83").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  var chungcheongdoMonthSalesChart = new Chart(chungcheongdoMonthSales, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '충청남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineMonth51").val(), $("#buildLineMonth52").val(), $("#buildLineMonth53").val(), $("#buildLineMonth54").val(), $("#buildLineMonth55").val(), $("#buildLineMonth56").val(), $("#buildLineMonth57").val(), $("#buildLineMonth58").val()],
						fill: false,
					}, {
						label: '충청북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineMonth61").val(), $("#buildLineMonth62").val(), $("#buildLineMonth63").val(), $("#buildLineMonth64").val(), $("#buildLineMonth65").val(), $("#buildLineMonth66").val(), $("#buildLineMonth67").val(), $("#buildLineMonth68").val()],
					}, {
						label: '대전광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineMonth71").val(), $("#buildLineMonth72").val(), $("#buildLineMonth73").val(), $("#buildLineMonth74").val(), $("#buildLineMonth75").val(), $("#buildLineMonth76").val(), $("#buildLineMonth77").val(), $("#buildLineMonth78").val()],
					}, {
						label: '세종특별자치시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [$("#buildLineMonth81").val(), $("#buildLineMonth82").val(), $("#buildLineMonth83").val(), $("#buildLineMonth84").val(), $("#buildLineMonth85").val(), $("#buildLineMonth86").val(), $("#buildLineMonth87").val(), $("#buildLineMonth88").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  var chungcheongdoDaySalesChart = new Chart(chungcheongdoDaySales, {
				type: 'line',
				data: {
					labels: ['월', '화', '수', '목', '금', '토', '일'],
					datasets: [{
						label: '충청남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineDay51").val(), $("#buildLineDay52").val(), $("#buildLineDay53").val(), $("#buildLineDay54").val(), $("#buildLineDay55").val(), $("#buildLineDay56").val(), $("#buildLineDay57").val()],
						fill: false,
					}, {
						label: '충청북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineDay61").val(), $("#buildLineDay62").val(), $("#buildLineDay63").val(), $("#buildLineDay64").val(), $("#buildLineDay65").val(), $("#buildLineDay66").val(), $("#buildLineDay67").val()],
					}, {
						label: '대전광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineDay71").val(), $("#buildLineDay72").val(), $("#buildLineDay73").val(), $("#buildLineDay74").val(), $("#buildLineDay75").val(), $("#buildLineDay76").val(), $("#buildLineDay77").val()],
					}, {
						label: '세종특별자치시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [$("#buildLineDay81").val(), $("#buildLineDay82").val(), $("#buildLineDay83").val(), $("#buildLineDay84").val(), $("#buildLineDay85").val(), $("#buildLineDay86").val(), $("#buildLineDay87").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
 		  
  		  var jolladoYearSalesChart = new Chart(jolladoYearSales, {
				type: 'line',
				data: {
					labels: ['2016년', '2017년', '2018년'],
					datasets: [{
						label: '전라북도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineYear91").val(), $("#buildLineYear92").val(), $("#buildLineYear93").val()],
						fill: false,
					}, {
						label: '전라남도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineYear101").val(), $("#buildLineYear102").val(), $("#buildLineYear103").val()],
					}, {
						label: '광주광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineYear111").val(), $("#buildLineYear112").val(), $("#buildLineYear113").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  var jolladoMonthSalesChart = new Chart(jolladoMonthSales, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '전라북도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineMonth91").val(), $("#buildLineMonth92").val(), $("#buildLineMonth93").val(), $("#buildLineMonth94").val(), $("#buildLineMonth95").val(), $("#buildLineMonth96").val(), $("#buildLineMonth97").val(), $("#buildLineMonth98").val()],
						fill: false,
					}, {
						label: '전라남도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineMonth101").val(), $("#buildLineMonth102").val(), $("#buildLineMonth103").val(), $("#buildLineMonth104").val(), $("#buildLineMonth105").val(), $("#buildLineMonth106").val(), $("#buildLineMonth107").val(), $("#buildLineMonth108").val()],
					}, {
						label: '광주광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineMonth111").val(), $("#buildLineMonth112").val(), $("#buildLineMonth113").val(), $("#buildLineMonth114").val(), $("#buildLineMonth115").val(), $("#buildLineMonth116").val(), $("#buildLineMonth117").val(), $("#buildLine118").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  var jolladoDaySalesChart = new Chart(jolladoDaySales, {
				type: 'line',
				data: {
					labels: ['월', '화', '수', '목', '금', '토', '일'],
					datasets: [{
						label: '전라북도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineDay91").val(), $("#buildLineDay92").val(), $("#buildLineDay93").val(), $("#buildLineDay94").val(), $("#buildLineDay95").val(), $("#buildLineDay96").val(), $("#buildLineDay97").val()],
						fill: false,
					}, {
						label: '전라남도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineDay101").val(), $("#buildLineDay102").val(), $("#buildLineDay103").val(), $("#buildLineDay104").val(), $("#buildLineDay105").val(), $("#buildLineDay106").val(), $("#buildLineDay107").val()],
					}, {
						label: '광주광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineDay111").val(), $("#buildLineDay112").val(), $("#buildLineDay113").val(), $("#buildLineDay114").val(), $("#buildLineDay115").val(), $("#buildLineDay116").val(), $("#buildLineDay117").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  

  		  var gyeongsangdoYearSalesChart = new Chart(gyeongsangdoYearSales, {
				type: 'line',
				data: {
					labels: ['2016년', '2017년', '2018년'],
					datasets: [{
						label: '경상남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineYear121").val(), $("#buildLineYear122").val(), $("#buildLineYear123").val()],
						fill: false,
					}, {
						label: '경삭북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineYear131").val(), $("#buildLineYear132").val(), $("#buildLineYear133").val()],
					}, {
						label: '대구광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineYear141").val(), $("#buildLineYear142").val(), $("#buildLineYear143").val()],
					}, {
						label: '부산광역시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [$("#buildLineYear151").val(), $("#buildLineYear152").val(), $("#buildLineYear153").val()],
					}, {
						label: '울산광역시',
						fill: false,
						backgroundColor: 'pink',
						borderColor: 'pink',
						data: [$("#buildLineYear161").val(), $("#buildLineYear162").val(), $("#buildLineYear163").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  var gyeongsangdoMonthChart = new Chart(gyeongsangdoMonthSales, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '경상남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineMonth121").val(), $("#buildLineMonth122").val(), $("#buildLineMonth123").val(), $("#buildLineMonth124").val(), $("#buildLineMonth125").val(), $("#buildLineMonth126").val(), $("#buildLineMonth127").val(), $("#buildLineMonth128").val()],
						fill: false,
					}, {
						label: '경삭북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineMonth131").val(), $("#buildLineMonth132").val(), $("#buildLineMonth133").val(), $("#buildLineMonth134").val(), $("#buildLineMonth135").val(), $("#buildLineMonth136").val(), $("#buildLineMonth137").val(), $("#buildLineMonth138").val()],
					}, {
						label: '대구광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineMonth141").val(), $("#buildLineMonth142").val(), $("#buildLineMonth143").val(), $("#buildLineMonth144").val(), $("#buildLineMonth145").val(), $("#buildLineMonth146").val(), $("#buildLineMonth147").val(), $("#buildLineMonth148").val()],
					}, {
						label: '부산광역시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [$("#buildLineMonth151").val(), $("#buildLineMonth152").val(), $("#buildLineMonth153").val(), $("#buildLineMonth154").val(), $("#buildLineMonth155").val(), $("#buildLineMonth156").val(), $("#buildLineMonth157").val(), $("#buildLineMonth158").val()],
					}, {
						label: '울산광역시',
						fill: false,
						backgroundColor: 'pink',
						borderColor: 'pink',
						data: [$("#buildLineMonth161").val(), $("#buildLineMonth162").val(), $("#buildLineMonth163").val(), $("#buildLineMonth164").val(), $("#buildLineMonth165").val(), $("#buildLineMonth166").val(), $("#buildLineMonth167").val(), $("#buildLineMonth168").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
		  var gyeongsangdoDaySalesChart = new Chart(gyeongsangdoDaySales, {
				type: 'line',
				data: {
					labels: ['월', '화', '수', '목', '금', '토', '일'],
					datasets: [{
						label: '경상남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineDay121").val(), $("#buildLineDay122").val(), $("#buildLineDay123").val(), $("#buildLineDay124").val(), $("#buildLineDay125").val(), $("#buildLineDay126").val(), $("#buildLineDay127").val()],
						fill: false,
					}, {
						label: '경삭북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [$("#buildLineDay131").val(), $("#buildLineDay132").val(), $("#buildLineDay133").val(), $("#buildLineDay134").val(), $("#buildLineDay135").val(), $("#buildLineDay136").val(), $("#buildLineDay137").val()],
					}, {
						label: '대구광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [$("#buildLineDay141").val(), $("#buildLineDay142").val(), $("#buildLineDay143").val(), $("#buildLineDay144").val(), $("#buildLineDay145").val(), $("#buildLineDay146").val(), $("#buildLineDay147").val()],
					}, {
						label: '부산광역시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [$("#buildLineDay151").val(), $("#buildLineDay152").val(), $("#buildLineDay153").val(), $("#buildLineDay154").val(), $("#buildLineDay155").val(), $("#buildLineDay156").val(), $("#buildLineDay157").val()],
					}, {
						label: '울산광역시',
						fill: false,
						backgroundColor: 'pink',
						borderColor: 'pink',
						data: [$("#buildLineDay161").val(), $("#buildLineDay162").val(), $("#buildLineDay163").val(), $("#buildLineDay164").val(), $("#buildLineDay165").val(), $("#buildLineDay166").val(), $("#buildLineDay167").val()],
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});

  		  var jejudoYearSalesChart = new Chart(jejudoYearSales, {
				type: 'line',
				data: {
					labels: ['2016년', '2017년', '2018년'],
					datasets: [{
						label: '제주특별자치도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineYear171").val(), $("#buildLineYear172").val(), $("#buildLineYear173").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
 		  var jejudoMonthSalesChart = new Chart(jejudoMonthSales, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '제주특별자치도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineMonth171").val(), $("#buildLineMonth172").val(), $("#buildLineMonth173").val(), $("#buildLineMonth174").val(), $("#buildLineMonth175").val(), $("#buildLineMonth176").val(), $("#buildLineMonth177").val(), $("#buildLineMonth178").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
 		  var jejudoDaySalesChart = new Chart(jejudoDaySales, {
				type: 'line',
				data: {
					labels: ['월', '화', '수', '목', '금', '토', '일'],
					datasets: [{
						label: '제주특별자치도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [$("#buildLineDay171").val(), $("#buildLineDay172").val(), $("#buildLineDay173").val(), $("#buildLineDay174").val(), $("#buildLineDay175").val(), $("#buildLineDay176").val(), $("#buildLineDay177").val()],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: '등록 건수'
							}
						}]
					},
					legend: {
			            labels: {
		                	fontSize: 15
			            }
			        }
				}
			});
 		  
		   	
		   	
	   		$("#firstBtn").click(function(){
	   			$('#firstBtn').addClass('active');
	   			$("#secondBtn").removeClass("active");
	   			$('#thirdBtn').removeClass('active');
	   			$('#fourthBtn').removeClass('active');
	   			$("#first").css("display", "");
	   			$("#second").css("display", "none");
	   			$("#third").css("display", "none");
	   			$("#fourth").css("display", "none");
	   		});
	   		$("#secondBtn").click(function(){
	   			$('#firstBtn').removeClass('active');
	   			$("#secondBtn").addClass("active");
	   			$('#thirdBtn').removeClass('active');
	   			$('#fourthBtn').removeClass('active');
	   			$("#first").css("display", "none");
	   			$("#second").css("display", "");
	   			$("#third").css("display", "none");
	   			$("#fourth").css("display", "none");
	   		});
	   		$("#thirdBtn").click(function(){
	   			$('#firstBtn').removeClass('active');
	   			$("#secondBtn").removeClass("active");
	   			$('#thirdBtn').addClass('active');
	   			$('#fourthBtn').removeClass('active');
	   			$("#first").css("display", "none");
	   			$("#second").css("display", "none");
	   			$("#third").css("display", "");
	   			$("#fourth").css("display", "none");
	   		});
	   		$("#fourthBtn").click(function(){
	   			$('#firstBtn').removeClass('active');
	   			$("#secondBtn").removeClass("active");
	   			$('#thirdBtn').removeClass('active');
	   			$('#fourthBtn').addClass('active');
	   			$("#first").css("display", "none");
	   			$("#second").css("display", "none");
	   			$("#third").css("display", "none");
	   			$("#fourth").css("display", "");
	   		});
	   		
	   		$(".year, .day").css("display", "none");
}

