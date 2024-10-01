package com.Hexaware.entity;

//Bank Account Management System
//Build a simple menu-based Java program for a bank account system where users can perform operations like depositing, withdrawing, 
//and checking balance. Handle exceptions such as insufficient funds, invalid amounts, and account-related errors using both built-in
//and custom exceptions.
//Problem Statement:
//You need to design a Bank Account Management System that allows users to:
//Create a new bank account.
//Deposit money into their account.
//Withdraw money from their account.
//Check their account balance.
//You must handle exceptions such as:
//InvalidAmountException (custom): When the user tries to deposit or withdraw a negative amount.
//InsufficientFundsException (custom): When the user tries to withdraw more than the current balance.
//InvalidChoiceException (custom): When the user selects an option that doesn't exist in the menu.
//NullPointerException: When a user attempts to perform an operation without creating an account.

import com.Hexaware.exceptions.*;
public class BankAccount {
	 private double balance;
	 
	 public BankAccount() {
	        this.balance = 0.0;    //initially every account will have zero balance
	    }
	 
	 // Method to deposit money
	 public void deposit(double amount) throws InvalidAmountException {
	        if (amount <= 0)   ///when deposit amount is negative
	        {
	            throw new InvalidAmountException("Deposit amount must be positive.");
	        }
	        balance += amount;      //adding the deposited amount to the balance
	        System.out.println("Successfully deposited: Rs" + amount);
	    }
	 
	 // Method to withdraw money
	    public void withdraw(double amount) throws InvalidAmountException, InsufficientFundsException {
	        if (amount <= 0)    //if the user enters a negative amount
	        {
	            throw new InvalidAmountException("Withdrawal amount must be positive.");
	        }
	        if (amount > balance)    // if the amount of withdrawal is greater than the current balance
	        {
	            throw new InsufficientFundsException("Insufficient funds. Your balance is: Rs" + balance);
	        }
	        balance -= amount;          //subtracting the withdrawal amount to the balance
	        System.out.println("Successfully withdrew: Rs" + amount);
	    }
	    
	 // Method to check balance
	    public double getBalance() {
	        return balance;
	    }
}
