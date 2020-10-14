$(document).ready(function() {

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	var u = $(location).attr('pathname');
	
	if ((u.search('available') == 1) || (u.search('pricing_block_periods') == 1)) {
		pricing_block_period();
	} else {
	
	$('#calendar').fullCalendar({
		editable: true,        
		header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultView: 'month',
        height: 500,
        slotMinutes: 15,
        
        loading: function(bool){
            if (bool) 
                $('#loading').show();
            else 
                $('#loading').hide();
        },
        
        // a future calendar might have many sources.        

        eventSources: [
			{
	            url: '/job_assignments',
				src: 'assignment',
	            color: '#FFBE8A',
	            textColor: 'black',
	            ignoreTimezone: false
        	},
			{
	            url: '/job_requests',
				src: 'request',
	            color: '#CAFF8A',
	            textColor: 'black',
	            ignoreTimezone: false
        	}

			],
        
        timeFormat: 'h:mm t{ - h:mm t} ',
        dragOpacity: "0.5",
        
        //http://arshaw.com/fullcalendar/docs/event_ui/eventDrop/
        eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
            updateEvent(event);
        },

        // http://arshaw.com/fullcalendar/docs/event_ui/eventResize/
        eventResize: function(event, dayDelta, minuteDelta, revertFunc){
            updateEvent(event);
        },

        // http://arshaw.com/fullcalendar/docs/mouse/eventClick/
        eventClick: function(event, jsEvent, view){
          // would like a lightbox here.
        },
	});
};
});

function updateEvent(the_event) {
    $.update(
      "/job_assignments/" + the_event.id,
      { event: { title: the_event.title,
                 starts_at: "" + the_event.scheduled_start,
                 ends_at: "" + the_event.estimated_end
                 // description: the_event.description
               }
      },
      function (reponse) { alert('successfully updated task.'); }
    );
};

function pricing_block_period(){
		$('#calendar').fullCalendar({
			editable: true,        
			header: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'month,agendaWeek,agendaDay'
	        },
	        defaultView: 'month',
	        height: 500,
	        slotMinutes: 15,

	        loading: function(bool){
	            if (bool) 
	                $('#loading').show();
	            else 
	                $('#loading').hide();
	        },      

	        eventSources: [
				{
		            url: '/pricing_block_periods',
					src: 'block',
		            color: '#F2F2F2',
		            textColor: 'black',
		            ignoreTimezone: false
		    	}
			],

	        timeFormat: 'h:mm t{ - h:mm t} ',
	        dragOpacity: "0.5",

	        //http://arshaw.com/fullcalendar/docs/event_ui/eventDrop/
	        eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
	            updateBlockPeriod(event);
	        },

	        // http://arshaw.com/fullcalendar/docs/event_ui/eventResize/
	        eventResize: function(event, dayDelta, minuteDelta, revertFunc){
	            updateBlockPeriod(event);
	        },

	        // http://arshaw.com/fullcalendar/docs/mouse/eventClick/
	        eventClick: function(event, jsEvent, view){
	          // would like a lightbox here.
	        },
		});
};

function updateBlockPeriod(the_event) {
    $.update(
      "/pricing_block_period/" + the_event.id,
      { event: { effective_date: "" + the_event.effective_date,
                 end_date: "" + the_event.endDate,
                 start_time: "" + the_event.start_time,
                 end_time: "" + the_event.end_time,
				 day_of_week: "" + the_event.day_of_week
               }
      },
      function (reponse) { alert('successfully updated period block.'); }
    );
};