package com.mycompany.app;


public class App {
  public static void main(String[] args) throws  Exception {
 
   MGSamples samples = new MGSamples();
    System.out.println("send : " + samples.sendSimpleMessage());
    System.out.println("templates : " + samples.sendSimpleMessageTemplate());
 
 }
}
