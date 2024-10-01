package com.Hexaware.mainprogram;

import com.Hexaware.entity.*;
import com.Hexaware.exceptions.*;

import java.util.Scanner;

public class BankingApp {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        BankAccount account = null;  					// No account created initially, object pointing to NULL
        boolean exit = false;

        while (!exit) {
            // Display the menu
            System.out.println("\nBank Account Menu:");
            System.out.println("1. Create New Account");
            System.out.println("2. Deposit Money");
            System.out.println("3. Withdraw Money");
            System.out.println("4. Check Balance");
            System.out.println("5. Exit");

            // Prompt the user for their choice
            System.out.print("Enter your choice: ");
            try {
                int choice = scanner.nextInt();      //taking the user input choice

                switch (choice) {
                    case 1:
                        if (account == null)   //checks is the there is no account object created , i.e. object is pointing to NULL
                        {
                            account = new BankAccount();       //bank account created
                            System.out.println("Account created successfully.");
                        } 
                        else
                        {
                            System.out.println("You already have an account.");
                        }
                        break;

                    case 2:
                        if (account == null)   //when user is trying to deposit the money without having a bank account
                        {
                            throw new NullPointerException("No account exists. Please create an account first.");
                        }
                        System.out.print("Enter amount to deposit: ");
                        double depositAmount = scanner.nextDouble();
                        account.deposit(depositAmount);
                        break;

                    case 3:
                        if (account == null)      //when user is trying to withdraw the money without having a bank account
                        {
                            throw new NullPointerException("No account exists. Please create an account first.");
                        }
                        System.out.print("Enter amount to withdraw: ");
                        double withdrawAmount = scanner.nextDouble();
                        account.withdraw(withdrawAmount);
                        break;

                    case 4:
                        if (account == null)    //when user is trying to check the balance without having a bank account
                        {
                            throw new NullPointerException("No account exists. Please create an account first.");
                        }
                        System.out.println("Your balance is: Rs" + account.getBalance());
                        break;

                    case 5:
                        System.out.println("Exiting the system. Goodbye!");
                        exit = true;
                        break;

                    default:
                        throw new InvalidChoiceException("Invalid choice. Please select a valid option.");
                }

            } catch (InvalidAmountException | InsufficientFundsException | InvalidChoiceException e) {
                System.out.println("Error: " + e.getMessage());
            } catch (NullPointerException e) {
                System.out.println("Error: " + e.getMessage());
            } catch (Exception e) {
                System.out.println("An unexpected error occurred: " + e.getMessage());
            }
        }
        scanner.close();
    }
}

