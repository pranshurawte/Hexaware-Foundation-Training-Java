package com.Hexaware.concreteclasses;
import com.Hexaware.abstractclasses.Vehicle;

public class User {

		//attributes
		private String userName;
		private Vehicle[] rentedVehicles;
		private int rentedCount;   //to keep track of how many vehicles are rented
		
		//Paramertized Constructor
		public User(String userName) {
			super();
			this.userName = userName;
			this.rentedVehicles = new Vehicle[10];          // Fixed array size
			this.rentedCount = 0 ;   //initially any user has 0 rented vehicles
		}
		
		//method to rent the vehicles
		public void rentVehicle(Vehicle vehicle) 
		{
	        if (rentedCount < rentedVehicles.length) // checking that an individual user can only rent 10 vehicles
	        {
	            if (!vehicle.isRented())  // if vehicle is not rented already
	            {
	                vehicle.rentVehicle();          //rent the new vehicle
	                rentedVehicles[rentedCount] = vehicle;           //include the vehicle into the rentedVehicle array
	                rentedCount++;         // increase the count of rented vehicle
	            } 
	            else      //if the vehicle is already rented
	            {
	                System.out.println(vehicle.getName() + " is already rented.");
	            }
	        } 
	        else             //if the limit is reached
	        {
	            System.out.println("Cannot rent more vehicles. Limit reached.");
	        }
	    }
		
		public void returnVehicle(Vehicle vehicle)    //method to return the vehicles
		{
			
	        boolean found = false;     //to check whether the vehicle was found in the user's rented list or not, initially we set it to false
	        
	        for (int i = 0; i < rentedCount; i++) {
	            if (rentedVehicles[i] == vehicle) 
	            {
	                vehicle.returnVehicle();      //return the vehicle
	                rentedVehicles[i] = null;     //making the removed vehicle NULL
	                shiftVehiclesLeft(i);         //Remove the vehicle and shift array elements to the left            
	                rentedCount--;                //decrementing the rentedCount as we removed a vehicle
	                found = true;                 //found the vehicle
	                break;						  //break from the loop
	            }
	        }
	        if (!found)       //if no vehicle is found
	        {
	            System.out.println("You haven't rented " + vehicle.getName());
	        }
	    }

		//method to shift rentedVehicles array elements to left 
	    private void shiftVehiclesLeft(int index)    
	    {
	        for (int i = index; i < rentedCount - 1; i++) {
	            rentedVehicles[i] = rentedVehicles[i + 1];
	        }
	        rentedVehicles[rentedCount - 1] = null;  // To clear the last position
	    }

	    public void viewRentedVehicles() {
	        if (rentedCount == 0) 
	        {
	            System.out.println("No vehicles rented.");
	        } 
	        else 
	        {
	            System.out.println("Rented Vehicles:");
	            for (int i = 0; i < rentedCount; i++) 
	            {
	                rentedVehicles[i].displayDetails();
	            }
	        }
	    }
}
