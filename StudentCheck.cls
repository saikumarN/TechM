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
    
    
        
    
        
      
