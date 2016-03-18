﻿$.fn.vectorMap(
				'addMap',
				'cn_mill_en',
				{
				    "paths": {
				        "CN-01": {
				            "path": "M167.944,4.607l1.315-2.084  C169.259,2.523,161.552,8.871,167.944,4.607z M248.352,60.981c0,0,4.011-36.681-14.329-38.973l-30.947-10.89  c0,0-20.635-16.621-32.097-8.595c-1.258,0.879-2.248,1.558-3.035,2.084l-5.561,8.806l-2.867,4.012c0,0-8.025,2.864-9.743,2.864  c-1.719,0-16.048,2.294-16.048,2.294l-0.575,5.731l5.733,15.474l13.182-5.731l0.573-4.586l5.158-1.72l3.439,12.037  c0,0-32.669,9.17-12.609,11.462l6.878-1.717c0,0,5.731,4.584-10.317,6.876s-1.147,0.573-1.147,0.573s-4.009,51.009-28.083,71.069  l-2.864,5.159l-0.575,16.621l-1.145,8.598v6.303c0,0,19.485,12.035,34.961,6.306c15.474-5.733,16.048-9.745,16.048-9.745  l7.451-4.586h5.729l9.06-2.06l10.949-10.952l29.933-10.22l3.649-6.571h-3.649l-7.303-11.681l-17.52,2.19l20.442-6.571v-10.95  l6.569-2.922l-2.188-3.649l3.649-5.112l10.95,5.112l5.112-10.952l6.571-3.649L248.352,60.981z",
				            "name": "澳门半岛"
				        },
				        "CN-02": {
				            "path": "M193.837,243.66c0,0,24.902-9.088,30.013-1.059  c0,0,2.922-5.839,13.142-2.92c10.22,2.92,20.229,3.782,24.351,2.986l0.126-0.002c0,0,54.895,13.756,63.49,17.196  c8.598,3.438-6.878,29.229-6.878,29.229c-6.304,6.307-28.083,14.327-28.083,14.327l-7.451-5.156l-12.609,2.866l1.722,2.864  l-0.574,2.867l-8.023,4.584l-1.719,51.01l1.146,3.438l-1.722,16.049l-0.049,0.128c0,0-21.536,24.797-25.917,24.797  c-4.381,0-6.569,0.729-6.569,0.729l-19.688,6.562l0.068-3.561l0.572-69.923l-14.901-22.354c0,0-2.864-5.156-5.159-6.304  c-2.292-1.147-19.485-18.913-19.485-18.913l-1.72-8.598c-14.329-15.476,0.572-33.241,0.572-33.241  C177.665,251.264,193.837,243.66,193.837,243.66z",
				            "name": "乙仔岛"
				        }
						,
				        "CN-03": {
				            "path": "M377.307,417.472c0,0,2.292-6.304,9.171-5.731  l1.146-9.17l-4.011-2.864c0,0-4.587-6.306-4.015-12.611c0,0-2.864-6.876-9.742,4.014c0,0-2.866,0-2.866-4.014l-7.451-5.156  l-4.009,5.156l-10.317-3.438c0,0,0-13.756-4.014-1.719l-7.451-0.573c0,0,2.867-11.464-1.717-13.756c0,0,37.253-41.265-6.879-7.451  l1.72,4.584l-9.742,5.159l-2.867-0.572l-19.485,0.572l-16.048,12.037h-17.769c0,0-21.584,24.924-25.965,24.924  s-6.571,0.729-6.571,0.729l-19.689,6.563l-0.501,25.669l2.864,3.439c0,0-6.878,3.437-9.17,8.025  c-2.292,4.584-2.292,8.596,0.572,10.315c2.867,1.719,4.012,14.326-3.439,20.632l2.292,8.598c0,0,14.331,4.01,16.048,6.876  l12.609,2.295l3.439-4.587l6.304-2.292l0.575-5.158l6.303-4.012c0,0,1.72-0.572,3.439,0.574c1.72,1.146,1.147,5.159,2.292,6.876  c1.147,1.72,8.023,1.72,8.023,1.72s4.014-3.437,5.733-3.437s3.438,0.57,7.45,0.57s3.439,0,8.023,0.574  c4.586,0.572,2.294,0.572,8.025,0.572c5.73,0,13.754-4.584,13.754-4.584s5.158-14.9,0-14.9s-12.609-0.575-12.609-0.575  s-1.72-18.338,7.451-28.655c9.172-10.315,6.306-12.037,6.306-12.037s6.876-2.864,9.168,0.575c2.294,3.438,10.317,5.158,10.317,5.158  h6.878l4.012,1.718c0,0,6.304-5.729,10.892-6.304l2.292-4.584l4.584-5.731l6.304-4.586l6.878,1.72  C365.845,418.619,376.734,424.35,377.307,417.472z",
				            "name": "路环岛"
				        }



				    },
				    "height": 500,
				    "projection": {
				        "type": "mill",
				        "centralMeridian": 0.0
				    },
				    focusOn: {
				        x: 0.5,
				        y: 0.5,
				        scale: 2
				    },
				    "width": 500
				});
var url = "/GuestService/SiteQuery?Province=";
var dataStatus = [
    { id: 'CN-01', name: '澳门半岛', event: '1', url: url, lx: "210px", ly: "80px" },
    { id: 'CN-02', name: '乙仔岛', event: '1', url: url, lx: "270px", ly: "280px" },
    { id: 'CN-03', name: '路环岛', event: '1', url: url, lx: "310px", ly: "410px" }
];