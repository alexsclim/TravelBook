"use strict";$(document).ready(function(){L.mapbox.accessToken="pk.eyJ1IjoiYWxleHNjbGltIiwiYSI6ImNpc285OWc1cTA2MTAzMG14amI4MHF5aDYifQ.aBzJCCizYqDs0XmnnCGiFw";var a=L.mapbox.map("map","mapbox.streets").setView([45.1510532655634,-79.398193359375],9);$("#get-user").data("user-id");$.ajax({type:"GET",url:"/users/${userId}/locations",dataType:"json",success:function(e){L.mapbox.featureLayer(e).addTo(a)}})});