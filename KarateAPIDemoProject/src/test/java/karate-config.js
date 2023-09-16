function fun() {
	karate.configure('ssl', true);
	karate.configure('report', {
		showLog : true,
		showAllSteps : false
	});

	var config = {
			testCycleID                    : 'AJI-R1',
			jiraUrl                        : 'https://app.tm4j.smartbear.com/v2/testexecutions',
			baseURL                        : 'https://restful-booker.herokuapp.com',
			contentType                    : 'application/json',
			
			//end points
			
			getListOfBookings              : '/booking',
			getListOfParticularBookings    : '/booking/<id>',
			
			//Request Payload
			
			createBookingPayload           : 'classpath:requestpayload/CreateBookingPayload.json',
			
			//Expected Response
			getListOfBookingsSchema        : 'classpath:expectedresponse/GetListOfBookingsSchema.json',
			createBookingsSchema           : 'classpath:expectedresponse/CreateBookingsSchema.json'
	}
	return config;
}