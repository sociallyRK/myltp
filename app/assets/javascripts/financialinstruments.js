
$( document ).ready( function () {
  $("#financialinstrument_instrument_type").change(function() {
  		("#new_financialinstrument").append($("#myStuff"));
  		("#myStuff").append($("#new_financialinstrument"));
 			 alert("call the do something function on option 2");
  });
  }
);


// $( document ).ready( function () {
//   $("#financialinstrument_instrument_type").change(function() {
//     var asset_types = [{label: 'Savings', value: 'savings_account'}],{}];
//     var liability_types = [];
//     var income_types = [];


//     $("#financialinstrument_instrument_sub"). // set select options

//   });
//   }
// );
