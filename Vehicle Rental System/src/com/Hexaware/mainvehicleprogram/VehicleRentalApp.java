package com.Hexaware.mainvehicleprogram;

import com.Hexaware.abstractclasses.*;
import com.Hexaware.concreteclasses.*;
import java.util.Scanner;

public class VehicleRentalApp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 	Scanner sc = new Scanner(System.in);

	        Vehicle car1 = new Car("Tata Curvv", 20000.00);            //Car object 
	        Vehicle bike1 = new Bike("Honda CB300R", 10000.00);          //Bike object 
	        Vehicle truck1 = new Truck("Tesla CyberTruck", 30000.00);        //Truck object 

	        Vehicle[] availableVehicles = {car1, bike1, truck1};
	        User user = new User("Pranshu");                       //user object created

	        int choice;      //variable that will store the user's choice
	        
	        do {
	            System.out.println("\nVehicle Rental System");
	            System.out.println("1. Rent a Vehicle");
	            System.out.println("2. Return a Vehicle");
	            System.out.println("3. View Rented Vehicles");
	            System.out.println("4. Exit");
	            System.out.print("Enter your choice: ");
	            choice = sc.nextInt();

	            switch (choice) {
	                case 1:
	                    System.out.println("Available Vehicles:");
	                    for (int i = 0; i < availableVehicles.length; i++)
	                    {
	                        System.out.println((i + 1) + ". " + availableVehicles[i].getName() + " (Rs" + availableVehicles[i].getRentalPrice() + "/day)");
	                    }
	                    System.out.print("Select vehicle to rent (1, 2, 3): ");
	                    int vehicleChoice = sc.nextInt();
	                    if (vehicleChoice >= 1 && vehicleChoice <= availableVehicles.length) 
	                    {
	                        user.rentVehicle(availableVehicles[vehicleChoice - 1]);
	                    }
	                    else   //if user chooses a invalid number
	                    {
	                        System.out.println("Invalid choice.");
	                    }
	                    break;

	                case 2:
	                    user.viewRentedVehicles();
	                    System.out.print("Enter vehicle number to return: ");
	                    int returnChoice = sc.nextInt();
	                    if (returnChoice >= 1 && returnChoice <= availableVehicles.length) {
	                        user.returnVehicle(availableVehicles[returnChoice - 1]);
	                    }
	                    else
	                    {
	                        System.out.println("Invalid choice.");
	                    }
	                    break;

	                case 3:
	                    user.viewRentedVehicles();
	                    break;

	                case 4:
	                    System.out.println("Exiting...");
	                    break;

	                default:
	                    System.out.println("Invalid choice.");
	            }
	        } while (choice != 4);

	        sc.close();

	     


	}

}
