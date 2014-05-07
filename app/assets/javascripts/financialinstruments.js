		  
$(document).ready( function () {
		  $("#instrument_sub").hide();
		  $("#asset select").hide();
  		$("#liability select").hide();
  		$("#income select").hide();
  		$("#expense select").hide();

  $("#financialinstrument_instrument_type").change(function() {
  	  if ($(this).val() === "liability") {
  	  $("#instrument_sub").show();
  	 	$("#liability select").show();
  	 	$("#asset select").hide();
  		$("#income select").hide();
  		$("#expense select").hide();
  		}
  		if ($(this).val() === "asset") {
  		$("#instrument_sub").show();
  		$("#liability select").hide();
  		$("#income select").hide();
  		$("#expense select").hide();
  	 	$("#asset select").show();
  		}
  		if ($(this).val() === "income") {
  		$("#instrument_sub").show();
		  $("#asset select").hide();
  		$("#liability select").hide();
  		$("#income select").show();
  		$("#expense select").hide();
  		}
  		if ($(this).val() === "expense") {
		  $("#instrument_sub").show();
		  $("#asset select").hide();
  		$("#liability select").hide();
  		$("#income select").hide();
  	 	$("#expense select").show();
  		}
  });
  }
);
