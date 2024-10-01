package com.Hexaware.concreteclasses;
import com.Hexaware.abstractclasses.Vehicle;

public class Car extends Vehicle {

	//constructor
	public Car(String name, double price) {
		super(name, price);
	}

	// Implementation of rentVehicle

    public void rentVehicle() {
        if (!isRented())       //if the vehicle is not rented
        {
            setRented(true);
            System.out.println(getName() + " (Car) has been rented.");
        } 
        else 
        {
            System.out.println(getName() + " (Car) is already rented.");
        }
    }

    // Implementation of returnVehicle
    @Override
    public void returnVehicle() {
        if (isRented())    //if the vehicle is rented
        { 
            setRented(false);
            System.out.println(getName() + " (Car) has been returned.");
        } 
        else 
        {
            System.out.println(getName() + " (Car) wasn't rented.");
        }
    }

    // Implementation of displayDetails
    @Override
    public void displayDetails() {
        System.out.println("Car Name: " + getName() + ", Rental Price: Rs" + getRentalPrice());
    }
	
}
