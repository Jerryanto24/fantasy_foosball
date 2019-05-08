


//turbolinks event, full documentation https://github.com/turbolinks/turbolinks#preparing-the-page-to-be-cached
//turbolinks:before-cache (fires before Turbolinks saves the current page to cache)
//You can use this event to reset forms, collapse expanded UI elements, or tear down any third-party widgets so the page is ready to be displayed again
//Idempotent function for tubolinks (remove datatable before cache it)
$(document).on('turbolinks:before-cache', function() {
	
	//--------------------------- Destroy DATA TABLE before cache  ------------------------------
	$('.datatables.table-action.non-first-col-ordering').DataTable().destroy();
	
	
});



//turbolinks event, full documentation https://github.com/turbolinks/turbolinks#full-list-of-events
//turbolinks:load (fires once after the initial page load, and again after every Turbolinks visit)
$(document).on('turbolinks:load', function() {
	
	//clear turbolinks cache	
	Turbolinks.clearCache();


	// use plugin for data table (javascripts\admin\plugins\jquery.datatables.min)
	// all index page data table will use this plug in
  $('.datatables.table-action.non-first-col-ordering').DataTable({
		destroy: true,
		"pagingType": "full_numbers",
		"lengthMenu": [
		  [10, 25, 50, -1],
		  [10, 25, 50, "All"]
		],
		"order": [],
		responsive: true,
		language: {
		  search: "_INPUT_",
		  searchPlaceholder: "Search records",
		},
		"columnDefs": [ {
		  "targets": [ -1 ],
		  "orderable": false
		}]
	});
	
	
});


//--------------------------- BOOTSTRAP NOTIFY/ALERT/FLASH PART ------------------------------


// Convert html code
// Example: "can&#39;t be blank" to "can't be blank"
var html_unescape = function(string) {
  var parser = new DOMParser
    , dom = parser.parseFromString('<!doctype html><body>' + string, 'text/html');

  return dom.body.textContent;
};


// Bootstrap Notify, full documentation at http://bootstrap-notify.remabledesigns.com/
var show_notification = function(message, type, icon="", from='top', align='right') {
  /*
  ===========================================================================
  * message
  ===========================================================================
  * can support HTML code
  * example : 'Welcome to <b>Material Dashboard </b> - a beautiful admin panel for every web developer.'
  ===========================================================================
  * type options, can be found on material-dashboard.css
  ===========================================================================
  * primary, alert alert-primary
  * success, alert alert-success
  * info, alert alert-info
  * danger, alert alert-danger
  * rose, alert alert-rose
  */
  types = {'primary': 'alert-primary'
            , 'success': 'alert-success'
            , 'info': 'alert-info'
            , 'warning': 'alert-warning'
            , 'danger': 'alert-danger'
            , 'rose': 'alert-rose'
  };

  /*
  ===========================================================================
  * icon default options (can be overiden)
  * using material icon, https://design.google.com/icons/
  ===========================================================================
  * primary, notifications_none
  * success, done
  * info, notifications_none
  * danger, priority_high
  * rose, priority_high
  */
  icons = {'primary': 'notifications_none'
            , 'success': 'done'
            , 'info': 'notifications_none'
            , 'warning': 'priority_high'
            , 'danger': 'priority_high'
            , 'rose': 'notifications_none'
  };

  if (icon == '') icon = icons[type];

  // init bootstrap notify
  if (message != "")
  {
	  $.notify({
		icon: icon,
		message: html_unescape(message)
	  }, {
		allow_dismiss: true,
		newest_on_top: true,
		mouse_over: 'pause',
		timer: 3000,
		type: 'alert ' + types[type],
		placement: {
		  from: from,
		  align: align
		}
	  });
  }
  
};

//--------------------------- END OF BOOTSTRAP NOTIFY PART ------------------------------



//--------------------------- CONVERT STRING TO TITLE CASE ------------------------------
// Trim & convert string to title case
// Example : "confirm_password" to "Confirm Password"
var to_title_case = function(str) {
  str = str.replace('_', ' ');
  return str.replace(
    /\w\S*/g
    , function(txt) {
      return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
    }
  );
};

//--------------------------- END OF CONVERT STRING TO TITLE CASE ------------------------------





//--------------------------- SHOW AND HIGHLIGHT ERROR FIELD ------------------------------

// Show error on form validation
// Error example : {:username => can't be blank"}
var show_error = function(field, error, model) {
	
  error = html_unescape(error);
  model = model.toLowerCase();
  var error_msg = error;
  
  if (error == "can't be blank") {
    error_msg = to_title_case(field) + ' ' + error;
  } 
  
	//check if has (dot)
	let indexOfDot = field.indexOf('.');

	if(indexOfDot !== -1)
	{
	  //get field value
	  let field_name = field.substring(indexOfDot + 1, field.length)
	  
	  
	  	  // textbox
	  $('input[id*='+ field_name +']').after('<span class="bmd-help text-danger is-error">' + error_msg + '</span>')
		.after('<span class="form-control-feedback is-error"><i class="material-icons">error</i></span>')
		.parents('.form-group').addClass('has-danger')
		.find('.bmd-help').not('.is-error').remove();
	  
	  // select
	  $('select[id*='+ field_name +']').after('<span class="bmd-help text-danger is-error">' + error_msg + '</span>')
		.after('<span class="form-control-feedback is-error"><i class="material-icons">error</i></span>')
		.parents('.form-group').addClass('has-danger')
		.find('.bmd-help').not('.is-error').remove();
		
	  // datepicker

	  // textarea
	  $('textarea[id*='+ field_name +']').after('<span class="bmd-help text-danger is-error">' + error_msg + '</span>')
		.after('<span class="form-control-feedback is-error"><i class="material-icons">error</i></span>')
		.parents('.form-group').addClass('has-danger')
		.find('.bmd-help').not('.is-error').remove();
	}
	else
	{

	  // textbox
	  $('input[id='+ model + '_' + field + ']').after('<span class="bmd-help text-danger is-error">' + error_msg + '</span>')
		.after('<span class="form-control-feedback is-error"><i class="material-icons">error</i></span>')
		.parents('.form-group').addClass('has-danger')
		.find('.bmd-help').not('.is-error').remove();
	  
	  // select
	  $('select[id='+ model + '_' + field + ']').after('<span class="bmd-help text-danger is-error">' + error_msg + '</span>')
		.after('<span class="form-control-feedback is-error"><i class="material-icons">error</i></span>')
		.parents('.form-group').addClass('has-danger')
		.find('.bmd-help').not('.is-error').remove();
		
	  // datepicker

	  // textarea
	  $('textarea[id='+ model + '_' + field + ']').after('<span class="bmd-help text-danger is-error">' + error_msg + '</span>')
		.after('<span class="form-control-feedback is-error"><i class="material-icons">error</i></span>')
		.parents('.form-group').addClass('has-danger')
		.find('.bmd-help').not('.is-error').remove();
		
	}
  // checkbox
  // radio
};

//--------------------------- SHOW AND HIGHLIGHT ERROR FIELD ------------------------------