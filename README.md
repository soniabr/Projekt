# MATLAB HS13 Research Plan 


> * Group Name: Rich Bitch
> * Group participants names: Brechbuehl Sonia, Buechi Jonathan
> * Project Title: Residential Segregation in Zurich

## General Introduction

<<<<<<< HEAD
The segregation of people in living areas of cities is a well known phenomena which was investigated strongly for the case of blacks and whites living in the US. Because we are living in Z웦ich we would like to find out more about the social situation here. Z웦ich is a multi cultural city, many people from different origins and social backgrounds are living here. Thats why we would like to find out what makes people choose the part they live in. The combination of circumstances of people and the characteristics of places makes it a complex problem. In order to investigate this interactions, we will create a general model based on the data of Z웦ich that takes the peoples origin, age and family state into account.

## The Model

Based on statistical data of Z웦ich we want to implement a model which takes into account the origin age and family state of the people. Since it is not possible to get any data on the social state of every of Zurichs inhabitants, properties like housing prices of certain areas and attractivness of places cant be taken into account. 
We plan to use an agent based model. Each agent will have an origin, i.e. will bi Swiss or foreign, an age and a family state and be placed randomly at a certain location in the city. The city will be a grid diveded into 12 districts. Looking at the characteristics of their neighbors and the average of each property in the respective district, the agents have to decide whether they will stay or move to a next place. 
The tolarences of agents to still stay at a place, even though the situation is not fully satisfying can be varied in the model. 
=======
The segregation of people in living areas of cities is a well known phenomena which was investigated strongly for the case of blacks and whites living in the US. Because we are living in Z체rich we would like to find out more about the social situation here. Z체rich is a multi cultural city, many people from different origins and social backgrounds are living here. Thats why we would like to find out what makes people choose the part they live in. The combination of circumstances of people and the characteristics of places makes it a complex problem. In order to investigate this interactions, we will create a general model based on the data of Z체rich that takes the peoples origin, age and family state into account.

## The Model

Based on statistical data of Z체rich we want to implement a model which takes into account the origin age and family state of the people. Since it is not possible to get any data on the social state of every of Zurichs inhabitants, properties like housing prices of certain areas and attractivness of places cant be taken into account. 
We plan to use an agent based model. Each agent will have an origin, i.e. will bi Swiss or foreign, an age and a family state and be placed randomly at a certain location in the city. The city will be a grid diveded into 12 districts. Looking at the characteristics of their neighbors and the average of each property in the respective district, the agents have to decide whether they will stay or move to a next place. 
The tolarences of agents to still stay at a place, even though the situation is not fully satisfying can be varied in the model.
>>>>>>> 924fb7b1018920f8dbea5ba249ec6f4b958e87cd

## Fundamental Questions

What makes people choose their place to live? Is it the social environment? How can the tolerances change the moving behaviour? Based on statistical data we will try to verify if the model reproduces reality and try to chose the right parameters. 

## Expected Results

We expect the simulation to relax in an equilibrium, depending on the chosen tolerances.

## References 

Li Yan (2009): The Dynamics of Residential Segregation in Buffalo: An Agent-based Simulation

Thomas C. Schelling (1969): Models of Segregation

Statistik der Stadt Zurich: Segregation und Umz占퐑ge in der Stadt und Agglomeration Zurich

Statistik der Stadt Zurich: Zurich in Zahlen 2013


## Research Methods

Agent-Based Model, Monte Carlo Simulations
