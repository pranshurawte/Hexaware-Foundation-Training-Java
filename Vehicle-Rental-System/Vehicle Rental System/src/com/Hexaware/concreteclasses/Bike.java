package com.Hexaware.concreteclasses;
import com.Hexaware.abstractclasses.Vehicle;

public class Bike extends Vehicle {

    // Constructor for Bike class
    public Bike(String name, double rentalPrice) {
        super(name, rentalPrice);  // Calling the parent constructor
    }

    // Implementation of rentVehicle
    public void rentVehicle()
    {
        if (!isRented())   //if the vehicle is not rented
        {
            setRented(true);
            System.out.println(getName() + " (Bike) has been rented.");
        } 
        else
        {
            System.out.println(getName() + " (Bike) is already rented.");
        }
    }

    // Implementation of returnVehicle

    public void returnVehicle() {
        if (isRented())     //if the vehicle is rented
        {
            setRented(false);
            System.out.println(getName() + " (Bike) has been returned.");
        } 
        else 
        {
            System.out.println(getName() + " (Bike) wasn't rented.");
        }
    }

    // Implementation of displayDetails
    @Override
    public void displayDetails() {
        System.out.println("Bike Name: " + getName() + ", Rental Price: Rs" + getRentalPrice());
    }
}

