/**
 * 
 */

window.onload=function(){
		   	var bar = document.getElementById('barChart').getContext('2d');
		   	var pie = document.getElementById('pieChart').getContext('2d');
		   	var center = document.getElementById('centerChart').getContext('2d');
		   	var gangwondo = document.getElementById('gangwondoChart').getContext('2d');
		   	var chungcheongdo = document.getElementById('chungcheongdoChart').getContext('2d');
		   	var jollado = document.getElementById('jolladoChart').getContext('2d');
		   	var gyeongsangdo = document.getElementById('gyeongsangdoChart').getContext('2d');
		   	var jejudo = document.getElementById('jejudoChart').getContext('2d');
		   	
		   	var barChart = new Chart(bar, {
				type: 'bar',
				data: {
					labels: ['월', '화', '수', '목', '금', '토', '일'],
					datasets: [{
						label: '등록 건수',
						backgroundColor: 'skyblue',
						data: [12, 19, 3, 5, 2, 3, 22],
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
		   	var pieChart = new Chart(pie, {
		   		type: 'pie',
				data: {
					datasets: [{
						data: [12, 19, 3],
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
		   	var centerChart = new Chart(center, {
				type: 'line',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					datasets: [{
						label: '서울',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 19, 3, 5, 2, 3, 20, 34, 20, 1, 34, 22],
						fill: false,
					}, {
						label: '경기도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [11, 8, 5, 3, 6, 24, 3, 12, 32, 34, 11, 20],
					}, {
						label: '인천',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [21, 5, 14, 7, 2, 24, 3, 45, 23, 24, 11, 29],
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
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					datasets: [{
						label: '강원도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 19, 3, 5, 2, 3, 20, 34, 20, 1, 34, 22],
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
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					datasets: [{
						label: '충청남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 19, 3, 5, 2, 3, 20, 34, 20, 1, 34, 22],
						fill: false,
					}, {
						label: '충청북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [11, 8, 5, 3, 6, 24, 3, 12, 32, 34, 11, 20],
					}, {
						label: '대전광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [21, 5, 14, 7, 2, 24, 3, 45, 23, 24, 11, 29],
					}, {
						label: '세종특별자치시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [42, 12, 12, 13, 33, 44, 33, 21, 52, 35, 23, 15],
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
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					datasets: [{
						label: '전라북도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 19, 3, 5, 2, 3, 20, 34, 20, 1, 34, 22],
						fill: false,
					}, {
						label: '전라남도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [11, 8, 5, 3, 6, 24, 3, 12, 32, 34, 11, 20],
					}, {
						label: '광주광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [21, 5, 14, 7, 2, 24, 3, 45, 23, 24, 11, 29],
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
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					datasets: [{
						label: '경상남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 19, 3, 5, 2, 3, 20, 34, 20, 1, 34, 22],
						fill: false,
					}, {
						label: '경상북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [11, 8, 5, 3, 6, 24, 3, 12, 32, 34, 11, 20],
					}, {
						label: '대구광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [21, 5, 14, 7, 2, 24, 3, 45, 23, 24, 11, 29],
					}, {
						label: '부산광역시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [1, 23, 12, 8, 45, 2, 34, 12, 35, 12, 22, 9],
					}, {
						label: '울산광역시',
						fill: false,
						backgroundColor: 'pink',
						borderColor: 'pink',
						data: [95, 9, 24, 42, 24, 53, 75, 8, 12, 23, 1, 43],
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
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					datasets: [{
						label: '제주도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 19, 3, 5, 2, 3, 20, 34, 20, 1, 34, 22],
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
 		   	var weekBar = document.getElementById('weekBarChart').getContext('2d');
 		   	var dayBar = document.getElementById('dayBarChart').getContext('2d');
		   	
 		   	var centerYearSales = document.getElementById('centerYearSalesChart').getContext('2d');
 		   	var centerMonthSales = document.getElementById('centerMonthSalesChart').getContext('2d');
 		   	var centerWeekSales = document.getElementById('centerWeekSalesChart').getContext('2d');
 		   	var centerDaySales = document.getElementById('centerDaySalesChart').getContext('2d');

 		   	var gangwondoYearSales = document.getElementById('gangwondoYearSalesChart').getContext('2d');
 		   	var gangwondoMonthSales = document.getElementById('gangwondoMonthSalesChart').getContext('2d');
 		   	var gangwondoWeekSales = document.getElementById('gangwondoWeekSalesChart').getContext('2d');
 		   	var gangwondoDaySales = document.getElementById('gangwondoDaySalesChart').getContext('2d');

 		   	var chungcheongdoYearSales = document.getElementById('chungcheongdoYearSalesChart').getContext('2d');
 		   	var chungcheongdoMonthSales = document.getElementById('chungcheongdoMonthSalesChart').getContext('2d');
 		   	var chungcheongdoWeekSales = document.getElementById('chungcheongdoWeekSalesChart').getContext('2d');
 		   	var chungcheongdoDaySales = document.getElementById('chungcheongdoDaySalesChart').getContext('2d');

 		   	var jolladoYearSales = document.getElementById('jolladoYearSalesChart').getContext('2d');
 		   	var jolladoMonthSales = document.getElementById('jolladoMonthSalesChart').getContext('2d');
 		   	var jolladoWeekSales = document.getElementById('jolladoWeekSalesChart').getContext('2d');
 		   	var jolladoDaySales = document.getElementById('jolladoDaySalesChart').getContext('2d');

 		   	var gyeongsangdoYearSales = document.getElementById('gyeongsangdoYearSalesChart').getContext('2d');
 		   	var gyeongsangdoMonthSales = document.getElementById('gyeongsangdoMonthSalesChart').getContext('2d');
 		   	var gyeongsangdoWeekSales = document.getElementById('gyeongsangdoWeekSalesChart').getContext('2d');
 		   	var gyeongsangdoDaySales = document.getElementById('gyeongsangdoDaySalesChart').getContext('2d');

 		   	var jejudoYearSales = document.getElementById('jejudoYearSalesChart').getContext('2d');
 		   	var jejudoMonthSales = document.getElementById('jejudoMonthSalesChart').getContext('2d');
 		   	var jejudoWeekSales = document.getElementById('jejudoWeekSalesChart').getContext('2d');
 		   	var jejudoDaySales = document.getElementById('jejudoDaySalesChart').getContext('2d');

  		   var yearBarChart = new Chart(yearBar, {
 				type: 'bar',
 				data: {
 					labels: ['2016', '2017', '2018'],
 					datasets: [{
 						label: '매출 (년 단위) ',
 						backgroundColor: 'skyblue',
 						data: [2891, 5893, 12034],
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
 		   var monthBarChart = new Chart(monthBar, {
				type: 'bar',
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'],
					datasets: [{
						label: '매출 (월 단위) ',
						backgroundColor: 'skyblue',
						data: [52, 23, 78, 65, 46, 120, 233, 422],
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
 		   var weekBarChart = new Chart(weekBar, {
				type: 'bar',
				data: {
					labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주', '13주', '14주', '15주', '16주', '17주', '18주', '19주', '20주', '21주', '22주', '23주', '24주', '25주', '26주', '27주', '28주', '29주', '30주'],
					datasets: [{
						label: '매출 (주 단위) ',
						backgroundColor: 'skyblue',
						data: [5, 6, 4, 6, 10, 11, 5, 2, 3, 3 ,4, 1, 3, 9, 0, 10, 15, 8, 6, 4, 14, 12, 13, 6, 7, 4, 7, 8, 4, 10],
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
						data: [2, 5, 4, 5, 3, 6, 1],
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
						label: '서울',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [124, 344, 523],
						fill: false,
					}, {
						label: '경기도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [123, 213, 123],
					}, {
						label: '인천',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [100, 122, 231],
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
						label: '서울',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 23, 34, 33, 23, 12, 24, 23],
						fill: false,
					}, {
						label: '경기도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [12, 13, 23, 31, 12, 3, 42, 12],
					}, {
						label: '인천',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [10, 12, 1, 4, 5, 12, 9, 10],
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
		  var centerWeekSalesChart = new Chart(centerWeekSales, {
				type: 'line',
				data: {
					labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주', '13주', '14주', '15주', '16주', '17주', '18주', '19주', '20주', '21주', '22주', '23주', '24주', '25주', '26주', '27주', '28주', '29주', '30주'],
					datasets: [{
						label: '서울',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [5, 6, 4, 6, 10, 11, 5, 2, 3, 3 ,4, 1, 3, 9, 0, 10, 15, 8, 6, 4, 14, 12, 13, 6, 7, 4, 7, 8, 4, 10],
						fill: false,
					}, {
						label: '경기도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [2, 2, 3, 7, 19, 6, 4, 3, 1, 2 ,4, 5, 6, 4, 10, 12, 5, 4, 3, 7, 12, 11, 15, 8, 5, 3, 5, 2, 1, 11],
					}, {
						label: '인천',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [1, 2, 3, 5, 12, 13, 5, 7, 7, 5 ,5, 2, 3, 4, 2, 14, 10, 9, 8, 3, 4, 1, 3, 12, 2, 4, 4, 5, 8, 4],
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
						label: '서울',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [1, 4, 8, 6, 2, 5, 4],
						fill: false,
					}, {
						label: '경기도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [2, 3, 2, 1, 4, 5, 2],
					}, {
						label: '인천',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [1, 0, 2, 3, 6, 2, 2],
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
						data: [563, 1023, 2413],
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
						data: [12, 23, 34, 33, 23, 12, 24, 23],
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
 		  var gangwondoWeekSalesChart = new Chart(gangwondoWeekSales, {
				type: 'line',
				data: {
					labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주', '13주', '14주', '15주', '16주', '17주', '18주', '19주', '20주', '21주', '22주', '23주', '24주', '25주', '26주', '27주', '28주', '29주', '30주'],
					datasets: [{
						label: '강원도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [5, 6, 4, 6, 10, 11, 5, 2, 3, 3 ,4, 1, 3, 9, 0, 10, 15, 8, 6, 4, 14, 12, 13, 6, 7, 4, 7, 8, 4, 10],
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
						data: [1, 4, 8, 6, 2, 5, 4],
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
						data: [320, 400, 450],
						fill: false,
					}, {
						label: '충청북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [300, 200, 320],
					}, {
						label: '대전광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [30, 120, 230],
					}, {
						label: '세종특별자치시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [42, 112, 122],
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
						data: [12, 19, 3, 5, 2, 3, 20, 34],
						fill: false,
					}, {
						label: '충청북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [11, 8, 5, 3, 6, 24, 3, 12],
					}, {
						label: '대전광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [21, 5, 14, 7, 2, 24, 3, 45],
					}, {
						label: '세종특별자치시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [42, 12, 12, 13, 33, 44, 33, 21],
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
		  var chungcheongdoWeekSalesChart = new Chart(chungcheongdoWeekSales, {
				type: 'line',
				data: {
					labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주', '13주', '14주', '15주', '16주', '17주', '18주', '19주', '20주', '21주', '22주', '23주', '24주', '25주', '26주', '27주', '28주', '29주', '30주'],
					datasets: [{
						label: '충청남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 19, 3, 5, 2, 3, 20, 34, 31, 32, 1, 4, 5, 23, 23, 45 ,1, 3 ,2 ,53, 23, 9, 30, 12, 3, 24, 7, 27, 26 ,40 ],
						fill: false,
					}, {
						label: '충청북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [2, 9, 13, 15, 12, 13, 10, 24, 21, 22, 11, 14, 15, 13, 13, 25 ,31, 23 ,12 ,23, 13, 29, 1, 2, 13, 34, 17, 17, 16 ,20 ],
					}, {
						label: '대전광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [22, 19, 33, 54, 27, 42, 21, 24, 11, 2, 21, 41, 2, 13, 33, 55 ,13, 33 ,22 ,3, 33, 29, 3, 1, 33, 2, 27, 2, 2 ,4 ],
					}, {
						label: '세종특별자치시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [32, 39, 23, 50, 20, 35, 23, 31, 25, 31, 12, 23, 42, 31, 35, 24 ,16, 32 ,23 ,5, 3, 3, 20, 52, 33, 14, 17, 7, 46 ,30 ],
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
						data: [12, 19, 3, 5, 2, 3, 20],
						fill: false,
					}, {
						label: '충청북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [11, 8, 5, 3, 6, 24, 3],
					}, {
						label: '대전광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [21, 5, 14, 7, 2, 24, 3],
					}, {
						label: '세종특별자치시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [42, 12, 12, 13, 33, 44, 33],
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
						data: [320, 400, 450],
						fill: false,
					}, {
						label: '전라남도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [300, 200, 320],
					}, {
						label: '광주광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [30, 120, 230],
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
						data: [12, 19, 3, 5, 2, 3, 20, 34],
						fill: false,
					}, {
						label: '전라남도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [11, 8, 5, 3, 6, 24, 3, 12],
					}, {
						label: '광주광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [21, 5, 14, 7, 2, 24, 3, 45],
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
		  var jolladoWeekSalesChart = new Chart(jolladoWeekSales, {
				type: 'line',
				data: {
					labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주', '13주', '14주', '15주', '16주', '17주', '18주', '19주', '20주', '21주', '22주', '23주', '24주', '25주', '26주', '27주', '28주', '29주', '30주'],
					datasets: [{
						label: '전라북도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 19, 3, 5, 2, 3, 20, 34, 31, 32, 1, 4, 5, 23, 23, 45 ,1, 3 ,2 ,53, 23, 9, 30, 12, 3, 24, 7, 27, 26 ,40 ],
						fill: false,
					}, {
						label: '전라남도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [2, 9, 13, 15, 12, 13, 10, 24, 21, 22, 11, 14, 15, 13, 13, 25 ,31, 23 ,12 ,23, 13, 29, 1, 2, 13, 34, 17, 17, 16 ,20 ],
					}, {
						label: '광주광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [22, 19, 33, 54, 27, 42, 21, 24, 11, 2, 21, 41, 2, 13, 33, 55 ,13, 33 ,22 ,3, 33, 29, 3, 1, 33, 2, 27, 2, 2 ,4 ],
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
						data: [12, 19, 3, 5, 2, 3, 20],
						fill: false,
					}, {
						label: '전라남도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [11, 8, 5, 3, 6, 24, 3],
					}, {
						label: '광주광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [21, 5, 14, 7, 2, 24, 3],
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
						data: [320, 400, 450],
						fill: false,
					}, {
						label: '경삭북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [300, 200, 320],
					}, {
						label: '대구광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [30, 120, 230],
					}, {
						label: '부산광역시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [40, 130, 120],
					}, {
						label: '울산광역시',
						fill: false,
						backgroundColor: 'pink',
						borderColor: 'pink',
						data: [42, 112, 122],
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
						data: [23, 12, 40, 21, 42, 34, 12, 34],
						fill: false,
					}, {
						label: '경삭북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [30, 20, 32, 32, 1 ,12, 23, 42],
					}, {
						label: '대구광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [30, 12, 20, 13, 34, 59, 23, 20],
					}, {
						label: '부산광역시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [4, 10, 42, 34, 10, 50, 28, 12],
					}, {
						label: '울산광역시',
						fill: false,
						backgroundColor: 'pink',
						borderColor: 'pink',
						data: [42, 12, 22, 12, 23, 19, 8, 25],
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
		  var gyeongsangdoWeekSalesChart = new Chart(gyeongsangdoWeekSales, {
				type: 'line',
				data: {
					labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주', '13주', '14주', '15주', '16주', '17주', '18주', '19주', '20주', '21주', '22주', '23주', '24주', '25주', '26주', '27주', '28주', '29주', '30주'],
					datasets: [{
						label: '경상남도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [20, 4, 5, 4, 32, 23, 10, 32, 12, 14, 19, 12, 34, 32, 20, 25, 28, 20, 23, 29, 21, 23, 24, 35, 39, 20, 31, 39, 20, 40],
						fill: false,
					}, {
						label: '경삭북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [23, 2, 15, 24, 22, 13, 20, 22, 2, 4, 9, 2, 14, 2, 20, 15, 38, 30, 13, 49, 11, 33, 34, 25, 19, 30, 21, 19, 10, 30],
					}, {
						label: '대구광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [2, 23, 15, 42, 52, 53, 62, 16, 25, 35, 49, 2, 4, 14, 18, 16, 21, 26, 57, 35, 23, 38, 55, 37, 57, 37, 45, 14, 40, 30],
					}, {
						label: '부산광역시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [12, 12, 23, 2, 42, 33, 34, 2, 57, 48, 46, 36, 45, 67, 45, 45, 26, 34, 56, 5, 1, 53, 56, 23, 4, 10, 12, 29, 30, 10],
					}, {
						label: '울산광역시',
						fill: false,
						backgroundColor: 'pink',
						borderColor: 'pink',
						data: [40, 34, 25, 14, 36, 24, 23, 23, 24, 19, 17, 15, 64, 35, 23, 25, 45, 34, 25, 75, 54, 25, 35, 36, 36, 26, 45, 59, 2, 23],
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
						data: [20, 4, 5, 4, 32, 23, 10],
						fill: false,
					}, {
						label: '경삭북도',
						fill: false,
						backgroundColor: 'blue',
						borderColor: 'blue',
						data: [23, 2, 15, 24, 22, 13, 20],
					}, {
						label: '대구광역시',
						fill: false,
						backgroundColor: 'green',
						borderColor: 'green',
						data: [2, 23, 15, 42, 52, 53, 62],
					}, {
						label: '부산광역시',
						fill: false,
						backgroundColor: 'black',
						borderColor: 'black',
						data: [12, 12, 23, 2, 42, 33, 34],
					}, {
						label: '울산광역시',
						fill: false,
						backgroundColor: 'pink',
						borderColor: 'pink',
						data: [40, 34, 25, 14, 36, 24, 23],
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
						label: '제주도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [563, 1023, 2413],
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
						label: '제주도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [12, 23, 34, 33, 23, 12, 24, 23],
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
 		  var jejudoWeekSalesChart = new Chart(jejudoWeekSales, {
				type: 'line',
				data: {
					labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주', '13주', '14주', '15주', '16주', '17주', '18주', '19주', '20주', '21주', '22주', '23주', '24주', '25주', '26주', '27주', '28주', '29주', '30주'],
					datasets: [{
						label: '제주도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [5, 6, 4, 6, 10, 11, 5, 2, 3, 3 ,4, 1, 3, 9, 0, 10, 15, 8, 6, 4, 14, 12, 13, 6, 7, 4, 7, 8, 4, 10],
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
						label: '제주도',
						backgroundColor: 'red',
						borderColor: 'red',
						data: [1, 4, 8, 6, 2, 5, 4],
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
	   		
	   		$(".year, .week, .day").css("display", "none");
}

