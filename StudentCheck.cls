global class StudentCheck{
    //request class
    global class Request{
    	webservice integer studentId; 
    }
    
    //response class
    global class Response{
        webservice boolean Availability;
    }
    public static boolean validate(Request req){
       	
       if (req <> null  && req.studentId <> 0){
            return true;
        }
        
       return false; 
    }  
    
    webservice static Response getStudentDetails(Request req){
            Response res =new Response();
        	//1.validate the request.
        	boolean isvalid =  validate(req);
                if (isvalid){
            //2.query the database of the student object.
            list<student__c> student=[SELECT Availability__c from student__c where Student_Id__c= :req.studentId ];
        	//3.create response.
            for(student__c s: student){
               res.Availability=s.Availability__c;

        	}
                    system.debug('++++'  + res);
            }
            //        if(student.size()==0)
            // System.debug('the given id is not there' );
        else {
        	  // send the error.
        }
        
    
        
        //4.send the repsonse.
    	return res;        
    }    
}