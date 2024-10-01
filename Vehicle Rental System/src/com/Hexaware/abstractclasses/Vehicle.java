package com.Hexaware.abstractclasses;

public abstract class Vehicle {
	
	//Attributes
	private String name;
	private double rentalPrice;
	private boolean isRented;
	
	//Parameterized Constructor 
	public Vehicle(String name, double rentalPrice) {
		super();
		this.name = name;
		this.rentalPrice = rentalPrice;
		//this.isRented = isRented; 
	}
	
	//Getter for name
	public String getName() {
		return name;
	}
	
	//Getter for rentalPrice
	public double getRentalPrice() {
		return rentalPrice;
	}
	
	//Getter for isRented
	public boolean isRented() {
		return isRented;
	}
	
	//to set if the vehicle is rented or not
	public void setRented(boolean rented) {
	        this.isRented = rented;
	    }
	// to rent the vehicle
	public abstract void rentVehicle();

	
	// to return the vehicle
	public abstract void returnVehicle();
	
	//abstract method to display the details of the vehicle
	public abstract void displayDetails();
}
